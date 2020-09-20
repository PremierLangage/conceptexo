extends = /model/basic.pl

headerbefore ==
import random as rd
from io import StringIO
from csv import DictReader

reader = None

try:
    file = open('data.csv', newline='')
    reader = DictReader(file, delimiter=delimiter)
except:
    pass

if 'data' in globals():
    reader = DictReader(StringIO(data), delimiter=delimiter)

if reader is not None:
    for name in reader.fieldnames:
        globals()[name] = []
    nbrows = 0
    for row in reader:
        nbrows += 1
        for name in reader.fieldnames:
            globals()[name].append(row[name])
    rand = rd.randint(0, nbrows)

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

if any([input.value.casefold() == item.casefold() for item in lstsol]):
    score = 100
else:
    score = 0
==
