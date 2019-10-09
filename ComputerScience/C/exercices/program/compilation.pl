@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# FORM
title = Étapes durant la compilation avec **gcc**
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
    { "id": "1", "content": "<b>Préprocession</b>" },
    { "id": "2", "content": "<b>Analyse lexicale</b>" },
    { "id": "3", "content": "<b>Analyse syntaxique</b>" },
    { "id": "4", "content": "<b>Analyse sémantique</b>" },
    { "id": "5", "content": "<b>Génération de code</b>" },
    { "id": "6", "content": "<b>Édition de liens</b>" }
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
    grade = (100, '<span class="success-state">Bravo, il se passe effectivement tout cela lors d\'une passe complête de <b>gcc</b></span>.')
else:
    grade = (0, '<span class="error-state">%s étapes sont mal positionées.</span>' % errors)
==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}
</style>
==

