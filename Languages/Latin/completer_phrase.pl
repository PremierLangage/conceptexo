extends = /model/basic.pl

title = Comparaison de nombres (DragDrop)

before==#|python|
from customdragdrop import *

dragdrop = DragDropGroup()
dragdrop.set_drop("")
dragdrop.set_label(["1","3"])
labels = list(dragdrop.labels.values())
==

text==
Compléter la phrase suivante avec les étiquettes proposées.
==

form ==
{% for key, value in dragdrop.labels.items() %} {{ key }} {% endfor %}
{% for label in labels %} {{ label|component }} {% endfor %}
==

settings.feedback = lightscore

evaluator==#|python|

==

