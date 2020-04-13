custom_pl_template == 
    <ion-card-header class="exercise__header">
        <ion-card-subtitle class='exercise__author'>{% if author %}{{ author }}{% endif %}</ion-card-subtitle>
        <ion-card-title class=" exercise__header">{% if title %}{{ title }}{% endif %}</ion-card-title>
    </ion-card-header>
    <!-- BODY -->
    <ion-card-content class="exercise__body">
        <!-- INSTRUCTIONS -->
        <div class="exercise__instructions">
            {% if text %}
            {{ text|markdown|safe }}
            {% endif %}
        </div>
        <!-- FEEDBACK -->
        <div class="exercise__feedback">
            {{ feedback__|markdown|safe if feedback else "" }}
        </div>
        <!-- FORM -->
        {% csrf_token %}
        <div class="exercise__form">
            {% block form %}{{ form|safe }}{% endblock %}
        </div>
        <br>
        <!-- ACTIONS -->
        <div class="exercise__actions text-center">
            <div class="btn-group" role="group" aria-label="actions">
                <a type="button" class="btn btn-warning action-reset"
                href="{{ url('activity:play', activity_id__) }}?action=reset">
                    <i class="fas fa-undo"></i>
                    <span class="ion-hide-md-down">Réinitialiser</span>
                </a>
                {% with reroll_limit__=(firstof(settings.reroll,_threshold, 100)) %}
                {% if settings.allow_reroll and grade__|int >= reroll_limit__|int %}
                <a type="button" class="btn btn-warning action-reroll"
                href="{{ url('activity:play', activity_id__) }}?action=reroll">
                    <i class="fas fa-dice"></i>
                    <span class="ion-hide-md-down">Nouveau tirage</span>
                </a>
                {% endif %}
                {% endwith %}
                <button class="btn btn-info action-save">
                    <i class="fas fa-save"></i>
                    <span class="ion-hide-md-down">Sauvegarder</span>
                </button>
                <button class="btn btn-primary action-submit">
                    <i class="fas fa-check"></i>
                    <span class="ion-hide-md-down">Valider</span>
                </button>
            </div>
            {% if grade__|int > 0 %}
            <br/> <br/>
            <a type="button" class="btn btn-success action-next" href="{{ url('activity:next', activity_id__) }}">
                <span class="ion-hide-md-down">Suivant</span>
                <span class="glyphicon glyphicon-arrow-right"></span>
            </a>
            {% endif %}
        </div>
        <!-- SPINNER -->
        <div class="exercise__spinner text-center">
            <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
    </ion-card-content>
==






extends = /model/basic.pl


title = Essai d'un nouveau template d'exo

before==
import random as rd

[a,b] = rd.sample(range(1,100),2)

==

text==
Le quel de ces deux nombres préférez-vous : {{ a }} ou {{ b }} ?
==

form==


==

settings.feedback = lightscore

evaluator==
grade = (0, 'c'est nul')
==



