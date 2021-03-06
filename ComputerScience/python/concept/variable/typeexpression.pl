
extends=/model/AMC_TXT.pl

@ buildquestions.py 

title = Le type de quelques expressions

before == #|python|
import random as rd
from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from AMC import parse_AMC_TXT
from buildquestions import buildquestion

questions = buildquestion(8)

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



