@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# DECLARATION
sortlist =: SortList

sortlist.items %= #|json|
[
    { "id": "", "content": "Analyse" },
    { "id": "", "content": "Design" },
    { "id": "", "content": "Développement" },
    { "id": "", "content": "Implementation" },
    { "id": "", "content": "Evaluation" }
]
==
valeur==
mot 1
mot 2
mot 3
==

# RANDOMIZATION
before== #|python|
import random
import uuid
sortlist.items=[{"content":x}for x in valeur.split("\n")]
answer = []
for e in sortlist.items:
    # generate random id because students can
    # guest the answer if ids like 1, 2, 3 are used
    e["id"] = uuid.uuid4()
    answer.append(e["id"])
random.shuffle(sortlist.items)
==

# FORM
title = Sort List Component
text = *Drag and Drop the items to sort the list*
form = {{ sortlist|component }}


# EVALUATION
evaluator== #|python|
errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state animated fadeIn'
    if e['id'] != answer[i]:
        e['css'] = 'error-state animated fadeIn'
        errors += 1

if errors == 0:
    grade = (100, '<span class="success-state animated pulse infinite">Good answer</span>')
else:
    grade = (0, f'<span class="error-state animated pulse infinite">{ errors } wrong answers</span>')
==

