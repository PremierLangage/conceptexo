############### A FINIR #########################

extends = editor.pl


## On doit pouvoir utiliser le même style que pour count/prefix/suffix/factor pour récupérer un automate et le comparer

maxattempt = 1

generate== #|py|
## Ajouter ici la génération:
#    du message de l'énoncé décrivant le langage
#    l'alphabet
#    la construction de l'automate pour tester la réponse
from automaton import Automaton

automaton = AutomatonEditor(
    automaton= {
        "alphabet": ["a", "b"],
        "initialStates": ["S0"],
        "acceptingStates": ["S0", "S1", "S2"],
        "states": ["S0", "S1", "S2"],
        "transitions": [
            { "fromState": "S0", "toState": "S1", "symbols": ["a"] },
            { "fromState": "S1", "toState": "S1", "symbols": ["a"] },
            { "fromState": "S1", "toState": "S2", "symbols": ["b"] },
        ]
    }
)

automaton = Automaton.parse(automaton)

alphabet = "a,b"
message = "bli"
# peut-on utiliser la syntaxe du viewer ?
==

title = Exemples de langages
text ==

On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir la solution !
</p>
{% endif %}
==














