extends = /model/basic.pl

headerbefore ==
import random as rd
from io import StringIO
from csv import DictReader

all_rows = None

try:
    with open('data.csv', newline='') as file:
        all_rows = list(DictReader(file, delimiter=delimiter))
except:
    pass

if 'data' in globals():
     all_rows = list(DictReader(StringIO(data), delimiter=delimiter))

if all_rows is not None:    
    row = rd.choice(all_rows)
    for key, value in row.items():
        globals()[key] = value

from jinja2 import Environment, BaseLoader
Env = Environment(loader=BaseLoader())
sol = Env.from_string(sol).render(globals())
==

delimiter % ","

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
elif isinstance(sol, lst):
    lstsol = sol

if input.value == lstsol[0]:
    score = 100
else:
    score = 0
==
