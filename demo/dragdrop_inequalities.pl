@ /utils/sandboxio.py [sandboxio.py]
grader  =@ /grader/evaluator2.py
builder =@ /builder/before2.py
@ /utils/dragdrop.py [dragdrop.py]

title = 

before==
from dragdrop import Drop,Label,Drops,Labels
chiffres= [(2,4),(7,6),(5,3),(6,9)]
lt="\<"
gt="\>"
sol=[lt,gt,gt,lt]
label=Labels([lt,gt])
drop10=Drop()
drops = Drops(4)
==

text==

==

form==
{{ label[0] | component }} {{ label[1] | component }}

{{ drop10| component }} 
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
f=str([e.content for e in drops])
grade=DragDropeval(drop,
==

