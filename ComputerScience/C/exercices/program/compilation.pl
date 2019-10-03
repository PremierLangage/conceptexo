@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# FORM
title = Étape durant la compilation avec **gcc**

text== 
Remettre en ordre toutes les étapes transformant les sources d'un programme C 
en un éxécutable fonctionnel à l'aide du compilateur **gcc**.
==

form = {{ sortlist|component }}

# DECLARATION
sortlist =: SortList
sortlist.items %= #|json|
[
    { "id": "1", "content": "Préprocession" },
    { "id": "2", "content": "Analyse lexicale" },
    { "id": "3", "content": "Analyse syntaxique" },
    { "id": "4", "content": "Analyse sémantique" },
    { "id": "3", "content": "Génération de code intermédiaire" },
    { "id": "3", "content": "Optimisation de code" },
    { "id": "3", "content": "Génération de code machine" },
    { "id": "3", "content": "Édition de liens" }
]
==

# RANDOMIZATION
before== #|python|
import random
answer = []
for e in sortlist.items:
    answer.append(e["id"])
random.shuffle(sortlist.items)
==

# EVALUATION
evaluator== #|python|
errors = 0
for i, e in enumerate(sortlist.items):
    e['css'] = 'success-state anim-fade'
    if e['id'] != answer[i]:
        e['css'] = 'error-state anim-fade'
        errors += 1

if errors == 0:
    grade = (100, 'GOOOOOOOD')
else:
    grade = (0, '%s wrong answers' % errors)
==

