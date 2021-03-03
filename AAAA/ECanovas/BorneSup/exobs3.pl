


extends = /model/mathinput.pl

title= Borne Sup 3

@ bornesup.csv
@ genQuest.py



before ==#|python|

from genQuest import initDonnees, question

uneLigne=initDonnees()

# ENCHAINEMENT Exercice à 3 questions puis reboucle

iQuestion=1
# nombre de bonnes réponses
nbbr=0

intituleQuestion, indicQuestion, bReponse = question(3,uneLigne)

==

text==#|markdown|


{{intituleQuestion}} 
{{indicQuestion}}
==
form==
{{ input|component}}
==

evaluator==
from genQuest import bonneRepQ3,testReponse

if testReponse(input.value,bReponse) == True:
    nbbr += 1 
    kback = f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr} </span>'
    grade = (100, kback)
else:
    kback =  f'<span class="error-state">la bonne réponse $%{bReponse}%$ est différente de {input.value} </span>'
    grade = (0,kback)

==

