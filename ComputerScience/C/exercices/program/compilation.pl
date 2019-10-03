@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# FORM
title = Étapes durant la compilation avec <b>gcc</b>
author = Nicolas Borie

text== 
Mettre en ordre toutes les étapes transformant des sources en langage C 
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
    { "id": "5", "content": "Génération de code" },
    { "id": "6", "content": "Édition de liens" }
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
    grade = (100, 'Bravo, il se passe effectivement tout cela lors d\'une passe complête de <b>gcc</b>.')
else:
    grade = (0, '%s étapes sont mal positionées.' % errors)
==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}
</style>
==
