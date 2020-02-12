@ /utils/sandboxio.py
grader  =@ /grader/evaluator2.py
builder =@ /builder/before2.py
@ /utils/dragdrop.py [dragdrop.py]


title = 

before==
from dragdrop import Drop,Label

drag1 = Label(content="$$\in$$")
drag2 = Label(content="$$\subset$$")

sets = [
    ("1", drag1.cid, "{1, 2, 3}"),
    ("{1}", drag2.cid, "{ {1}, 2, 3}"),
    ("{1, 1}", drag2.cid, "{ {1, 2}, 3}"),
    ("3", drag1.cid, "{1, 2, 3}"),
]

drops = [Drop() for i in range(4)]

for drop in drops:
    globals()[drop.id] = drop

s=str(globals())
==

text==
{{s}}
==

form==
{{ drag1|component }}
{{ drag2|component }}
<br/>

<ul>
    {% for e in sets %}
    <li>
        {{ e[0] }}
        {{ drops[loop.index0]|component }}
        {{ e[2] }}
    </li>
    {% endfor %}
</ul>
==

evaluator==
errors = 0
for i, e in enumerate(sets):
    drop = globals()[f'drop{i}']
    drop.css = 'success-state animated rotateIn'
    if drop.droppedId != e[1]:
        drop.css = 'error-state animated pulse infinite'
        errors += 1

n = len(sets)
if errors == 0:
    grade = (100, f'<span class="success-state animated pulse infinite">{n}/{n}</span>')
else:
    grade = (100, f'<span class="error-state animated pulse infinite">{n - errors}/{n}</span>')
==
