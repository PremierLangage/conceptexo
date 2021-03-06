# Copyright 2017 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 
name=condbool.pl


title= Condition booléenne  # N'oubliez pas de remplir ce champs svp
tag= input|boolean|if # N'oubliez pas de remplir ce champs svp


text==
# Super Fly 
Super Fly est une compagnie aerienne a bas cout qui fait payer un supplement
en cas de bagages trops lourds.

Ecrire un programme qui demande à l’utilisateur le poids de son bagage en kilos.  
```
{{prompt}}
```

Si son bagage pèse plus de {{poid}} kilos, le programme affichera le message :  
```
Il y a un supplément de {{supplement}} euros pour un bagage de plus de {{poid}} kilos.
```
==

before== #|python| 
import random 
random.seed(seed)
prompt="Entrez le poid entier du bagage :"
poid=random.choice([10,20,30,40])
supplement=random.choice([10,20,30,40])
==

extends=/ComputerScience/python/template/soluce.pl
@ /builder/before.py [builder.py]
