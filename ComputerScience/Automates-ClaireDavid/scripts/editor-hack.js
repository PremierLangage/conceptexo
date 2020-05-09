// TODO HACK TO REMOVE AFTER V1 RELEASE

const editors = document.querySelectorAll('c-automaton-editor');

const addKeyboardListenerToPromptInput = () => {
    setTimeout(() => {
        const input = document.querySelector('app-prompt input');
        const buttons = document.querySelectorAll('app-prompt .mat-button')
        const handler = (e) => {
            if (e.key === 'Enter') {
                buttons[0].click(); // confirm
                input.removeEventListener('keydown', handler);
            } else if (e.key === 'Escape') {
                buttons[1].click(); // cancel
            }
        };
        const listener = input.addEventListener('keydown', handler);
    }, 1000);
};

const addProperty = (component, property) => {
    if (!component.properties.find(e => e.name === property.name)) {
        component.properties.push(property);
    }
}

const createGetterSetter = (component, name) => {
    Object.defineProperty(component, name, {
        get: () => {
            return component.automaton[name];
        },
        set: (value) => {
            component.automaton[name] = value;
        }
    });
};

editors.forEach((editor) => {
    const component = editor.ngElementStrategy.componentRef.instance;
    
    const FINAL_STATE_CLASS = 'automaton-state--final';
    const INITIAL_STATE_CLASS = 'automaton-state--initial';
    
    addProperty(component, { name: 'textSetInitial', default: 'Initial' });
    addProperty(component, { name: 'textSetNonInitial', default: 'Non initial' });
    addProperty(component, { name: 'textSetFinal', default: 'Final' });
    addProperty(component, { name: 'textSetNonFinal', default: 'Non final' });
    addProperty(component, { name: 'textRenameState', default: 'Renommer' });
    addProperty(component, { name: 'textDeleteState', default: 'Supprimer' });
    addProperty(component, { name: 'textRenameSymbol', default: 'Changer étiquette' });
    addProperty(component, { name: 'textDeleteSymbol', default: 'Supprimer transition' });

    createGetterSetter(component, 'initialStates');
    createGetterSetter(component, 'acceptingStates');
    createGetterSetter(component, 'states');
    createGetterSetter(component, 'position');
    createGetterSetter(component, 'transitions');

    component.removeState =  (state) => {
         component.states =  component.states.filter(
            e => {
                return e !== state;
            }
        );
    };

    component.removeFinal = (state) => {
         component.acceptingStates =  component.acceptingStates.filter(
            e => {
                return e !== state;
            }
        );
    };
 
    component.removeInitial = (state) => {
         component.initialStates =  component.initialStates.filter(
            e => {
                return e !== state;
            }
        );
    };


    /*
    component.zoom = 1;
    component.setZoom = (zoom, transformOrigin) => {
        transformOrigin = transformOrigin || [ 0.5, 0.5 ];
        const instance = component.instance;
        const el = instance.getContainer();
        const prefix = [ "webkit", "moz", "ms", "o" ];
        const scale = "scale(" + zoom + ")";
        const oString = (transformOrigin[0] * 100) + "% " + (transformOrigin[1] * 100) + "%";

        for (let i = 0; i < prefix.length; i++) {
            el.style[prefix[i] + "Transform"] = scale;
            el.style[prefix[i] + "TransformOrigin"] = oString;
        }

        el.style["transform"] = scale;
        el.style["transformOrigin"] = oString;
        
        instance.setZoom(zoom);
    };
    editor.addEventListener("wheel", event => {
        const delta = Math.sign(event.deltaY);
        component.setZoom(component.zoom + (0.5 * delta));
    });
    */
    
    // BUTTONS TO DISPLAY WHEN A STATE IS FOCUSED 
    
    /**
     * 
     */
    component.actionSetInitial = () => {
        const stateName = this.node.id;
        return {
            name: this.textSetInitial,
            action: () => {
                this.initialStates.push(stateName);
                this.node.classList.add(INITIAL_STATE_CLASS);
                this.focus(this.node);
            }
        }
    };

    /**
     * 
     */
    component.actionSetNonInitial = () => {
        const stateName = this.node.id;
        return {
            name: this.textSetNonInitial,
            action: () => {
                this.removeInitial(stateName);
                this.node.classList.remove(INITIAL_STATE_CLASS);
                this.focus(this.node);
            }
        };
    };

    /**
     * 
     */
    component.actionSetFinal = () => {
        const stateName = this.node.id;
        return {
            name: this.textSetFinal,
            action: () => {
                this.acceptingStates.push(stateName);
                this.node.classList.add(FINAL_STATE_CLASS);
                this.focus(this.node);
            }
        };
    }

    /**
     * 
     */
    component.actionSetNonFinal = () => {
        const stateName = this.node.id;
        return {
            name: this.textSetNonFinal,
            action: () => {
                this.removeFinal(stateName);
                this.node.classList.remove(FINAL_STATE_CLASS);
                this.focus(this.node);
            }
        };
    }

    /**
     * 
     */
    component.actionRenameState = () => {
        const stateName = this.node.id;
        return {
            name: this.textRenameState,
            action: async () => {
                const title = 'État';
                const hint = 'Entrez un nouveau nom';
                addKeyboardListenerToPromptInput();    
                let newState = await this.prompt(title, hint, stateName);
                if (newState && newState.trim()) {
                    newState = newState.trim();
                    if (this.automaton.states.includes(newState)) {
                        alert('Il existe déjà un état avec ce nom !');
                    } else {
                        // replace in states
                        this.states = [
                            newState,
                            ...this.states.filter(state => {
                                return state !== stateName;
                            })
                        ];
                        // replace in initials
                        this.initialStates = this.initialStates.map(
                            state => {
                                if (state === stateName) {
                                    return newState;
                                }
                                return state;
                            }
                        );
                        // replace in finals
                        this.acceptingStates = this.acceptingStates.map(
                            state => {
                                if (state === stateName) {
                                    return newState;
                                }
                                return state;
                            }
                        );
                        // replace in transitions
                        this.automaton.transitions.forEach(transition => {
                            if (transition.fromState === stateName) {
                                transition.fromState = newState;
                            }
                            if (transition.toState === stateName) {
                                transition.toState = newState;
                            }
                        });

                        // replace in position
                        this.position[newState] = this.position[stateName];
                        delete this.position[stateName];

                        // RENDER THE WHOLE VIEW
                        this.node = undefined;
                        this.actions = [];
                        this.connection = undefined;
                        
                        this.unfocus();
                        this.onRender();
                        this.detectChanges();
                    }
                }
                this.updateAlphabet();
                this.detectChanges();
            }
        };
    };

    /**
     * 
     */
    component.actionDeleteState = () => {
        const stateName = this.node.id;
        return {
            name: this.textDeleteState,
            action: () => {
                this.removeState(stateName);
                this.removeFinal(stateName);
                this.removeInitial(stateName);
                // remove transition
                this.automaton.transitions = this.automaton.transitions.filter(
                    transition => {
                        return (
                            transition.fromState !== this.node.id &&
                            transition.toState !== this.node.id
                        );
                    }
                );
                delete this.automaton.position[stateName];
                // remove node from the dom
                this.instance.remove(this.node);
                this.focus();
                this.updateAlphabet();
            }
        };
    }



    /**
     * Override the function that handles focus of state|connection.
     * @param node the focused node (may be null if the focused element is connection).
     * @param connection the focused connection (may be null if the focused element is a node).
    */
    component.focus = function (node, connection) {
        this.unfocus();
    
        this.node = node;
        this.connection = connection;

        const actions = [];
     
        
        // CLICK ON STATE
        if (node) {
            node.classList.remove('focused');
            node.classList.add('focused');

            const isFinalState = classes.contains(FINAL_STATE_CLASS);
            const isInitialState = classes.contains(INITIAL_STATE_CLASS);

            if (isInitialState) {
                actions.push(this.actionSetNonInitial());
            } else {
                actions.push(this.actionSetInitial());
            }

            if (isFinalState) {
                actions.push(this.actionSetNonFinal());
            } else {
                actions.push(this.actionSetFinal());
            }

            actions.push(this.actionRenameState());
            actions.push(this.actionDeleteState());
        }


        // CLICK ON TRANSITION
        if (this.connection) {
            const canvas = (connection).canvas;
            canvas.classList.add('focused');
            actions.push({
                name: this.textRenameSymbol,
                action: async () => {
                    const s = this.connection.endpoints[0];
                    const t = this.connection.endpoints[1];
                    const transition = this.automaton.transitions.find(e => {
                        return (
                            e.fromState === s.elementId &&
                            e.toState === t.elementId
                        );
                    });
                    addKeyboardListenerToPromptInput();
                    const title = 'Transition';
                    const hint = 'Entrez les symboles en les séparant par une virgule';
                    const input = await this.prompt(
                        title,
                        hint,
                        transition.symbols.join(',')
                    );
                    if (input !== false) {
                        const symbols = input
                            .split(',')
                            .map((symbol) => {
                                return symbol.trim();
                            })
                            .filter((symbol) => !!symbol);

                        if (symbols.length === 0) {
                            alert('Vous devez saisir les symboles en les séparant par une virgule');
                        } else {
                            this.connection.getOverlay('transition').setLabel(symbols.join(','));
                            transition.symbols = symbols;
                        }
                        this.updateAlphabet();
                    }
                }
            });
            actions.push({
                name: this.textDeleteSymbol,
                action: async () => {
                    const s = this.connection.endpoints[0];
                    const t = this.connection.endpoints[1];
                    this.automaton.transitions = this.automaton.transitions.filter(
                        e => {
                            return !(
                                e.fromState === s.elementId &&
                                e.toState === t.elementId
                            );
                        }
                    );
                    this.instance.deleteConnection(this.connection);
                    this.focus(null, null);

                    this.updateAlphabet();
                }
            });
        }

        this.actions = actions;
        this.detectChanges();
    } 
});








