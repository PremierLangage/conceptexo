extends = /model/basic.pl

headerbefore ==
import random as rd
import DictReader from csv

with open('data.csv',newline='') as file:
    all_rows = list(DictReader(file,delimiter=','))
    
row = rd.choice(all_rows)

del all_rows
==

input =: Input

form ==
{{ input|component }}
==

settings.feedback = rightwrong

evaluator ==
if isinstance(sol, str):
    if '\n' in sol:
        lstsol = sol.splitlines()
    else:
        lstsol = [sol]
else:
    lstsol = sol

if any([input.value.casefold() == item.casefold() for item in lstsol]):
    score = 100
else:
    score = 0
==

