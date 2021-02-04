#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

group =: RadioGroup

url_phot_1 =$ /ComputerScience/C/examples/barbe/Style_1.jpg
url_phot_2 =$ /ComputerScience/C/examples/barbe/Style_2.jpg
url_phot_3 =$ /ComputerScience/C/examples/barbe/Style_3.jpg
url_phot_4 =$ /ComputerScience/C/examples/barbe/Style_4.jpg
url_phot_5 =$ /ComputerScience/C/examples/barbe/Style_5.jpg

author=Nicolas Borie

tag=simple|humour|style


# GENERATE A RANDOM QUESTION
before==#|python|
import random

group.items = []

simg1 = '<img src="'+str(url_phot_1)+'" alt="le style1"/>'
simg2 = '<img src="'+str(url_phot_2)+'" alt="le style2"/>'
simg3 = '<img src="'+str(url_phot_3)+'" alt="le style3"/>'
simg4 = '<img src="'+str(url_phot_4)+'" alt="le style4"/>'
simg5 = '<img src="'+str(url_phot_5)+'" alt="le style5"/>'

group.items.append({"id": "y1", "content": simg1})
group.items.append({"id": "y2", "content": simg2})
group.items.append({"id": "y3", "content": simg3})
group.items.append({"id": "y4", "content": simg4})
group.items.append({"id": "y5", "content": simg5})

# shuffle the items
random.shuffle(group.items)
==

title=Évolution des modes

text==#|markdown|
Votre enseignant ayant 30 années d'avance sur la méta. Déterminer quelle sera 
la dernière manière à la mode pour la barbe durant l'année 2056.

<br>

==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==#|python|
feedback = '''<span class="success-state animated pulse infinite" style="padding: 10px">Mais oui, ce style est si insane!</span>'''

grade = (100, feedback)
==


