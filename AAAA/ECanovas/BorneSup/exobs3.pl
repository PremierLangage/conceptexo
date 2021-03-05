
extends = /gift/templates/qtruefalse.pl
extends = /model/mathinput.pl

title= Borne Sup 3

@ bornesup.csv
@ genQuest.py

before ==#|python|

from genQuest import initDonnees, question

uneLigne=initDonnees()

intituleQuestion, indicQuestion, bReponse = question(2,uneLigne)

==

text==#|markdown|

<span>{{intituleQuestion}}</span> 
<span>{{indicQuestion}}</span> 
==

# Expected answer (T or F)
answer = {bReponse}

# Feedback shown when the student gives the right answer
feedback_correct==
Bonne réponse !  👏👏👏 
==

# Feedback shown when the student gives the wrong answer
feedback_wrong==
Non la réponse était $%{bReponse}%$
==

#form==
#{{ input|component}}
#==

#evaluator==
#from genQuest import *

#if testReponse(input.value,bReponse):
#    nbbr += 1 
#    kback = f'<span class="success-state">Good 👏👏👏 </span> <span > {nbbr} </span>'
#    grade = (100, kback)
#else:
#    kback =  f'<span class="error-state">la bonne réponse $%{bReponse}%$ est différente de  {input.value} </span>'
#    grade = (0,kback)

#==

