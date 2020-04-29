
extends = ../templates/editor-mini.pl

image_enonce =$ automate_1.png

## Ajouter ici la génération de l'automate et autres variables de l'exo
generate== #|py|
from automaton import Automaton

editor.debug = False
editor.editorHeight = "520px"
viewer = Automaton.parse('bb*a(b*a)*')

#    l'alphabet
alphabet = "a,b"
message = 'bb * a(b * a) *'
==

title = Minimisation
text ==

<img src="{{ image_enonce }}" style=" y a du style !" >

On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez l'automate minimal déterministe complet reconnaissant le langage {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==




























