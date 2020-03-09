extends = /model/basic.pl

@ /utils/components/dragdrop.py [customdragdrop.py]

title = Comparaison de nombres (DragDrop)

before==
import random as rd
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong

lt="&lt;"
gt="&gt;"

n = 4

mygroup = DragDropGroup()
mygroup.set_labels({"lt": lt, "gt": gt})

numbers = []
for i in range(n):
    [a,b] = rd.sample(range(10,100),2)
    numbers.append([a,b])
    mygroup.append_drop("")
    if a < b:
        mygroup.add_match_by_content(i,lt) 
    else:
        mygroup.add_match_by_content(i,gt) 
==

text==
Comparer les nombres suivants avec les symboles {{ mygroup.labels['lt'] | component }} et {{ mygroup.labels['gt'] | component }}.
==

form==
<ul>
{% for i in range(4) %}
<li> {{ numbers[i][0] }} {{ mygroup.drop[i] |component }} {{ numbers[i][1] }} </li>
{% endfor %}
</ul>
==

settings.feedback = lightscore

evaluator==
grade=mygroup.eval()
==

extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 4em;
        }
</style>
==




