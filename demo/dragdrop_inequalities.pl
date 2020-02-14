@ /utils/sandboxio.py [sandboxio.py]
grader  =@ /grader/evaluator2.py
builder =@ /builder/before2.py
@ /utils/dragdrop.py [dragdrop.py]

title = 

before==
from dragdrop import Drop,Label
chiffres= [(2,4),(7,6),(5,3),(6,9)]
label1 = Label(content="f")
label2 = Label(content="g")

drops = [Drop(content=str(i)) for i in range(4)]
==

text==

==

form==
{{ label1 | component }} {{ label2 | component }}

<br/>

<ul>
    {% for i in range(4) %}
    <li>
        {{ chiffres[i][0] }}
        {{ drops[i]|component }}
        {{ chiffres[i][1] }}
    </li>
    {% endfor %}
</ul>
==

evaluator==
f=str([drop.content for drop in drops])
grade=(100,f)
==

