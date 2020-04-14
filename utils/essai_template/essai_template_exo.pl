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
grade = (0, 'c\'est nul')
==

custom_pl_template == 
    <ion-card-header class="exercise__header">
        <ion-card-subtitle class='exercise__author'>{% if author %}{{ author }}{% endif %}</ion-card-subtitle>
        <ion-card-title class='exercise__title'>{% if title %}{{ title }}{% endif%}</ion-card-title>
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
        <br/>
        <!-- ACTIONS -->
        <div class="exercise__actions text-center">
            <div class="btn-group" role="group" aria-label="actions">
                <button class="btn btn-primary action-submit">
                    <i id="validate" class="fas fa-check"></i>
                    <span class="ion-hide-md-down">Valider</span>
                </button>
                {% if tests %}
                <a type="button" class="btn btn-primary action-test"
                href="{{ url('playexo:test_pl', pl_id__)}}"
                target="_blank" test>
                    <i class="fas fa-angle-double-right"></i>
                    <span class="ion-hide-md-down">Tester</span>
                </a>
                {% endif %}
                <a type="button" class="btn btn-secondary action-download-env"
                href="{{ url('filebrowser:dlenv', id__) }}" download>
                    <i class="fas fa-download"></i>
                    <span class="ion-hide-md-down">Télécharger l'Environnement</span>
                </a>
            </div>
        </div>
        <!-- SPINNER -->
        <div class="exercise__spinner text-center">
            <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
    </ion-card-content>

==







