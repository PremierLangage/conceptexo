

# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title =suite croissante


text==  

Ecrire un programme qui lit une suite de valeurs strictement croissantes. 
Lorsque la suite n'est plus croissante, la saisie s'arrête entiers et 
le programme affiche la longuer de la suite croissante.
code==



print("Vous avez entré",nb,"valeur(s) en ordre croissant")
==
soluce==
nb=1
prec=int(input())
suiv=int(input))
while suiv> prec:
    nb+=1
    prec=suiv
    suiv=int(input))
print("Vous avez entré",nb,"valeur(s) en ordre croissant")
==
mplsoluce0==
essai1
2 
3
5
14
77
0
==
mplsoluce1==
essai2
4
1
==
