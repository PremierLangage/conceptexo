# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Les règles de malloc à Marne la vallée

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==
import random
group.items = []

group.items.append({"id": "1", "content": "Caster les retours de **malloc** pour rigidifier votre code." })
group.items.append({"id": "2", "content": "Utilisez sizeof sur les types." })
group.items.append({"id": "3", "content": "Vérifier que les retours de **malloc** sont non nuls." })
group.items.append({"id": "4", "content": "Remonter les erreurs quand **malloc** ne donne plus de mémoire." })

group.items.append({"id": "21", "content": "Caster les retours de **malloc** car sinon ça ne compile pas." })
group.items.append({"id": "22", "content": "Utilisez sizeof sur des expressions." })
group.items.append({"id": "23", "content": "Quand **malloc** retourne NULL, tuer le programme immédiatement." })
group.items.append({"id": "24", "content": "Bien initialiser à zéro les zones retournées par **malloc**." })

random.shuffle(group.items)
==

author = Nicolas Borie

title =Règles de bonne utilisation de malloc.

text==
Sélectionnez les règles d'utilisation de **malloc** que vous demande de 
respecter vos enseignants à Marne-la-Vallée.
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==
right = 0
total = 0
error = 0
for item in group.items:
    checked = item['checked']
    id_int = int(item['id'])
    if id_int < 20:
        total += 1
        item['css'] = 'error-state'
        if checked:
            right += 1
            item['css'] = 'success-state'
    elif checked:
        error += 1
        item['css'] = 'error-state'

nb_error = error + (total - right)
note = 100*((max([0, total-nb_error])) / total)

if nb_error == 0:
    feedback = '<span class="success-state">Bravo, ces quatres éléments caractérisent et décrivent entièrement une variable C.</span>'
else:
    feedback = '<span class="error-state">Tout n\'est pas correct, il y a %d erreur(s).</span>' % nb_error

grade = (note, feedback)
==



