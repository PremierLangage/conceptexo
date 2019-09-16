extends = basic.pl

title = Checkbox

checkbox =: CheckboxGroup

right % ["Paris","Amsterdam","Londres","Berlin","Madrid"]

wrong % ["New-York","Pékin","Le Caire","Buenos-Aires","Tokyo"]

nchoices % 5

nright % [2,3]

before ==
import random as rd
nright0=rd.choice(nright)
nwrong0=nchoices-nright0
choices = rd.sample(right,nright0)+rd.sample(wrong,nwrong0)
rd.shuffle(choices)

checkbox.items=([{"id":str(id),"content":content} for id,content in enumerate(choices)])
==

text ==
Sélectionner les villes européennes dans la liste suivante.
==

form ==
{{ checkbox | component }}
==

evaluator ==
n=len(checkbox.items)
ansright,answrong=0,0
for i in range(n):
    if checkbox.items[i]['content'] in right and checkbox.items[i]['checked']:
        checkbox.items[i]['css'] = 'success-state anim-fade'
        ansright+=1
    elif checkbox.items[i]['content'] in right and not checkbox.items[i]['checked']:
        checkbox.items[i]['css'] = 'success-state anim-fade'
        answrong+=1
    elif not (checkbox.items[i]['content'] in right) and checkbox.items[i]['checked']:
        answrong+=1

score=max([int((ansright-answrong)/ansright*100),0])
==

