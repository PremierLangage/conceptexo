
#author=Zip


# Heritaged'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = approximation de Pi
code==
?? = int(input("Entrez un nombre : "))




print(??,"terme(s) inférieur(s) à",nb)

==

text==  

on veut comparer des séries permettant de calcuer 

\pi. On considère les trois séries :


u<sub>0</sub>=3

u<sub>n+1</sub>=2u<sub>n</sub>+1

 Ecrire un programme qui:
 
 lit un entier

 affiche le nombre de termes de la suite inférieurs à cet entier 

Exemple  :

Entrez un nombre : 7

1 terme(s) inférieur(s) à 7
==

soluce==
u0=2
nb=int(input("Entrez un nombre : "))
nbtermes=0
while u0<nb:
    print(u0)
    u0=2*u0+3
    nbtermes+=1

print(nbtermes,"terme(s) inférieur(s) à",nb)

==

plsoluce==
Exemple| 7
Aucun terme| 1
Grand | 32456
==

