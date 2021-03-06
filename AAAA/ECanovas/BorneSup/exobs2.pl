
extends = /model/mathinput.pl

title= Borne Sup 2

@ bornesup.csv
@ genQuest.py


before ==#|python|

from genQuest import initDonnees, question

uneLigne=initDonnees()

# nombre de bonnes réponses
nbbr=0

intituleQuestion, indicQuestion, bReponse = question(2,uneLigne)

==

text==#|markdown|

<span>{{intituleQuestion}}</span> 
<span>{{indicQuestion}}</span> 
==
form==
{{ input|component}}
==

evaluator==
from genQuest import *

if testReponse(bReponse ,input.value):
    nbbr += 1 
    kback = f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr} </span>'
    grade = (100, kback)
else:
    kback =  f'<span class="error-state">la bonne réponse $%{bReponse}%$ est différente de  {input.value} </span>'
    grade = (0,kback)

==
