extends = /model/basic.pl

title =

footerbefore ==
from customdragdrop import CustomDragDrop
drops = []
labels = []

if isinstance(dropsol, str):
    list_dropsol = dropsol.splitlines()
else:
    list_dropsol = dropsol

if 'labelscontent' in globals():
    list_labelcontents = labelscontent.splitlines()
else:
    list_labelcontents = list(set(dropsol))

for content in list_labelcontents:
    labels.append(CustomDragDrop.Label(content=content))

nbdrops = len(list_dropsol)
for _ in list_dropsol:
    drops.append(CustomDragDrop.Drop())
==

dropsol ==
Os frontal
Os pariétal
Os sphénoïde
Os temporal
Os occipital
Os ethmoïde
==

text =

scheme =$ /Biology/media/550px-Cranial_bones_numbers.svg.png

form ==
<img src="{{scheme}}" style="max-width: 300px; vertical-align:top; display: inline-block"> 
<ul>
{% for i in range(nbdrops) %}
<li> {{ i + 1 }}. {{ drops[i]|component }} </li>
{% endfor %}
</ul>

{% for label in labels %}
{{ label|component }}
{% endfor %}
==

evaluator ==
for i in range(drops):
    if drops[i].content == dropsol[i]
            drop.css += "success-state"
        else:
            drop.css += "error-state"    
==


