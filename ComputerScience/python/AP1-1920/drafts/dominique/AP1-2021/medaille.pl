@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = markdown
editor.code ==
# write your code here
==


title= Une médaille 

text==

La fonction metal fournis le niveau sportif "Or","Argent", "Bronze", et "Neige" de participant avec
 les règles suivantes , il y a trois épreuves ou l'on optient de 0 à 6 points

Niveau Or : 4 ou plus a chaque épreuves et au moins  13 au total.
Niveau Argent : 3 ou plus a chaque épreuves et au moins  10 au total.
Niveau Bronze : 2 ou plus a chaque épreuves et au moins  7 au total.
Niveau Neige : pas de conditions. 

Exemple de doctest :

    ‘‘‘
    >>> metal(5,6,4)
    'Or'
    ‘‘‘

==


