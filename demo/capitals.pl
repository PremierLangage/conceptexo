@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

@ country_data2.csv [data.csv]

title = Capitales d'Europe

before ==
import random as rd
import csv

with open('data.csv',newline='') as file:
    rows=list(csv.DictReader(file,delimiter=','))

item=rd.choice(rows)
country=item['country']
article=item['article']
capital=item['capital']

partitif={"le":"du ","la":"de la ","les":"des ","l":"de l'"}
ofcountry = partitif[article] + country
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
if input.value==capital:
    grade=(100,"")
else:
    grade=(100,"")
==
