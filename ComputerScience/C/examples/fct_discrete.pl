@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: CheckboxGroup

# GENERATE A RANDOM QUESTION
before==#|python|
from random import randint, choice

# deux collections de symboles ici (on peut en rajouter à la suite...)
lists_symbols = [ ["a", "b", "d", "e", "f", "g", "h"], [1, 2, 3, 4, 5, 6, 7] ]

# ça va choisir un cardinal puis entre lettres et chiffres
cardinal_defi = randint(4, 7)
ensemble_defi = choice(lists_symbols)[:cardinal_defi]

# Pareil, choix aléatoire des images
cardinal_img = randint(4, 7)
ensemble_img = choice(lists_symbols)[:cardinal_img]

# nom de la fonction 
fct_name = choice(['f', 'g', 'h', 'F', 'G', 'H'])

# images de la fonction : modélisation Python par le vecteurs de toutes les images
img_fct = []
for i in range(cardinal_defi):
    img_fct.append(choice(ensemble_img))

# extraction de sens maintenant
is_injective = (len(set(img_fct)) == cardinal_defi)
is_surjective = (len(set(img_fct)) == cardinal_img)


group.items = []
for i in range(4):
    group.items.append({
        "id": str(i),
        "content": str(randint(0, 100))
    })
==

title = Checkbox Group Component

text==#|markdown|
Soit $%{{ fct_name }}%$
==

form==
{{ group|component }}
==

evaluator==#|python|

grade = (100, 'Right')
==

