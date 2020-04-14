extends = /model/basic.pl

title = Comparaison de nombres (DragDrop)

before==#|python|
import random as rd
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong

lt="$%\lt%$" # latex for "less than"
gt="$%\gt%$" # latex for "greater than"

n = 4

mygroup = DragDropGroup()
mygroup.set_label({"lt": lt, "gt": gt})

numbers = []
for i in range(n):
    [a,b] = rd.sample(range(10,100),2)
    numbers.append([a,b])
    mygroup.add_drop({i:"coucou"}) 
    if a < b:
        mygroup.add_match_by_content(i,lt) 
    else:
        mygroup.add_match_by_content(i,gt) 
==

text==
{% for label in mygroup.labels.values() %} {{ label|component }} {% endfor %}
==

form==
{% for i in range(n) %} {{ mygroup.drops[i]|component }} {% endfor %}
==

settings.feedback = lightscore

evaluator==#|python|
from customdragdrop import CustomDragDrop, DragDropGroup, right_minus_wrong


grade = mygroup.eval(grading_function = right_minus_wrong)
==

extracss == #|html| 
<style>
    .myclass{
        #padding: 1em;
        min-width: 4em;
        }
</style>
==


