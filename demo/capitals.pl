@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

@ country_data.csv [data.csv]

title = Capitales de pays

before ==
import random as rd
import csv
essai=1
with open('data.csv','r') as file:
    row=rd.choice(list(csv.reader(file,delimiter=',')))

country,article,capital=row

if article=="le":
    ofcountry = "du " + country
elif article=="l":
    ofcountry = "de l'" + country
elif article=="la":
    ofcountry = "de la " + country
elif article=="les":
    ofcountry = "des" + country
==

text ==
Quelle est la capitale {{ofcountry}} ?
==

input =: Input
input.type = text

form ==
{{ input | component }}
==

evaluator ==
essai+=1
if input.value==capital:
    grade=(100,"Bravo !")
else:
    if essai >3:
        exec(before)
    grade=(0,"Raté !")
==


