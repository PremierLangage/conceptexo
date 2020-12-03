extends= /Languages/English/irregular_verbs.pl

title=Irregular verbs

text== 
You need to validate 20 preterit form to win 

Give the preterite of the verb **to {{ verb }} **
==

@ /AAAA/Anna/Irregular_verbs.csv [data]
@ /AAAA/Anna/Irregular_verbs2.csv [data1]

before ==#|python|
import random as rd
import csv

countdown.actions = [
    { "time": 0, "action": autoSubmit }
]
counter = 0

if rd.randint(1,2) == 1 :
    filename= "data1"
else:
    filename= "data"

with open(filename, newline='') as file:
    all_rows = list(csv.DictReader(file, delimiter=','))

good_total = 0
verb_total = 0
validated = []
IR = rd.sample(all_rows, 1)
for row in IR: 
    verb = row['V']
    preterit = row['V-ED']
==

form==
{{ countdown|component }}

{{ inputbox |component}}

{{ good_total }} / {{ verb_total }}
==

evaluator== #|python|
import random

verb_total += 1

if inputbox.value == preterit:
    good_total += 1
    validated.append(verb)
    grade = (0, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">No, it is <b>' + preterit + '</b>, Bad answer 👎👎👎</span>')

if good_total == 20:
    countdown.hidden = True
    score = 2000 // verb_total
    grade = (score, '<center><span class="success-state">Your final score '+ str(score) + '%</span></center>')
    form = ""
    text = "You validated 20 different irregular preterite forms !"
    countdown.actions = []
else:
    inputbox.value = ""
    countdown.time = 15

    IR = rd.sample(all_rows, 1)
    for row in sample_rows : 
        verb = row['V']
        preterit = row['V-ED']
    while verb in validated:
        IR = rd.sample(all_rows, 1)
        for row in sample_rows : 
            verb = row['V']
            preterit = row['V-ED']

    IR = rd.sample(all_rows, 1)
    for row in sample_rows : 
        verb = row['V']
        preterit = row['V-ED']

    countdown.actions = [ { "time": 0, "action": autoSubmit } ]
==
