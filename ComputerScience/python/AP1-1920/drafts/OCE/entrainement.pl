# author=OCE
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/loopsoluce.pl

title = Suite géométrique de raison X

text==  
En utilisant une boucle de type "for...in...range", écrire un programme qui affiche une suite de X nombres dont chaque terme soit 
égal à Y fois le terme précédent.
==

code== 
# écrivez votre code ici
==

before==
==

taboo=while
needed=for

soluce==
a=input("Entrez un nombre : ")
for i in range(12):
    print(i+1,a)
    a = a * 3
==

plsoluce==
test1 | 5
test2 | 3
==


