extends = /model/basic.pl

title = Comparaison de nombres (DragDrop)

before==#|python|
from customdragdrop import *

dragdrop = CustomDragDrop()
dragdrop.set_drops("")
drops = dragdrop.drops
labels = [CustomDragDrop.Label() for _ in range(3)]
==

text==
Compléter la phrase suivante avec les étiquettes proposées.
==

form==
Le {{ drops[0]|component }} est absent.


{% for label in labels %} {{ label|component }} {% endfor %}
==

settings.feedback = lightscore

evaluator==#|python|

==

