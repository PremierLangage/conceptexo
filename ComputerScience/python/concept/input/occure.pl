

author=Marc  & Dominique 
title= lecture d'un caractère

tag=input|print|variable

extends=/ComputerScience/python/template/soluce.pl
 

@ /builder/before.py [builder.py]

soluce==
a=input()
if a in {{MOT}}:
    print(a,"apparait dans {{MOT}} .")
else:
  print(a,"n'apparait pas dans {{MOT}} .")

==

code==
# lecture au clavier, affectation
lettre=input()

==



text==
Ecrivez un programme utilisant une unique variable **lettre** qui lit un seul caractère au clavier 
et affiche s'il appartienr ou non à une suite de cractères donnee

==

before==

import random 
lst=("aeiou","treza","abcxyz","oreille")
MOT= random.choice(lst)

import jinja2
soluce= jinja2.Template(soluce).render(globals())
code=  jinja2.Template(code).render(globals())
==


plsoluce==
Test 1 |a
Test 2 |i
Test 3 |m
==




