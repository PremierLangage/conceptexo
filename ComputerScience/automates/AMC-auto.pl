
extends = /model/multistep.pl

@ /utils/format/AMC.py

settings.cumulative % false

before == #|python|
import random as rd
from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from AMC import parse_AMC_TXT

list_questions = parse_AMC_TXT(questions)

if 'nbstep' in globals():
    list_questions = rd.sample(list_questions, nbstep)
else:
    nbstep = len(list_questions)

comp = []
statement  = []

for i, q in enumerate(list_questions):
    if q['type'] == "Radio":
        comp.append(CustomRadio())
    elif q['type'] == "Checkbox":
        comp.append(CustomCheckbox())
    statement.append(q['text'])
    comp[i].setitems(q['items'])
    comp[i].setsol_from_index(q['index'])
    if 'ordered' not in q['options']:
        comp[i].shuffle()
==

title = Automaton exo test
intro ==
Ce quiz contient {{nbstep}} questions.
==

textstep ==
<strong> Question {{ step + 1 }}. </strong> 
{{ statement[step] }}
==

formstep ==
{{ viewer|component }}
{{ comp[step]|component }}
==

evaluatorstep ==
score = comp[step].eval()
==

viewer =: AutomatonDrawer
viewer.automaton ==
#states
s0
s1
s2
#initials
s0
#accepting
s2
#alphabet
a
b
#transitions
s0:a>s1
s1:a>s1
s1:b>s2

==
