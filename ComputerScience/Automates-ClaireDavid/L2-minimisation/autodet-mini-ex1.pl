


extends = ../templates/editor-mini.pl



## Ajouter ici la génération de l'automate et autres variables de l'exo
generate== #|py|
from automaton import Automaton

soluce = '''
    #states
    S0
    S1
    S2
    S3
    S4
    S5
    #initials
    S0
    #accepting
    S0
    S2
    #alphabet
    a
    b
    #transitions
    S0:a>S4
    S0:b>S1
    S1:a>S0
    S1:b>S2
    S2:a>S5
    S2:b>S1
    S3:a>S0
    S3:b>S4
    S4:a>S2
    S4:b>S5
    S5:a>S2
    S5:b>S3
'''

viewer = soluce

viewer_enonce = AutomatonDrawer()
viewer_enonce.automaton = '''
    #states
    S0
    S1
    S2
    S3
    S4
    S5
    #initials
    S0
    #accepting
    S0
    S2
    #alphabet
    a
    b
    #transitions
    S0:a>S4
    S0:b>S1
    S1:a>S0
    S1:b>S2
    S2:a>S5
    S2:b>S1
    S3:a>S0
    S3:b>S4
    S4:a>S2
    S4:b>S5
    S5:a>S2
    S5:b>S3
'''

#    l'alphabet
alphabet = "a,b"
==

# dans ce qui suit le pb est que le viewer contient l'automate minimisé et non celui de départ
title = Minimisation
text ==
{{ viewer_enonce|component }}

{{ viewer|component }}

On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez l'automate minimal déterministe complet correspondant àà l'automate ci-dessus. <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==



























