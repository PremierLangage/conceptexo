# Copyright 2017 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 
name=sisi002.pl
title= Si Sinon
tag= input|else|if|elif
extends=/ComputerScience/python/template/soluce.pl
text==
Ecrire un programme qui demande à l’utilisateur un entier grace au texte:
	**Saisissez un entier?**  
	Remarque le code de la question précédente.

Si l'entier est **positif** affiche 
	Positif.

Sinon si l'entier est **négatif** affiche
	Négatif.

Sinon affiche
	Nul.
==

plsoluce==
Une entrée Positive | 13
Une entrée Négative | -66
Une entrée Nulle | 0
==

code==
n=int(input("Saisissez un entier?"))

print("Positif.")
print("Négatif.")
print("Nul.")
==

soluce==
n=int(input("Saisissez un entier?"))
if n >0:
	print("Positif.")
elif n< 0:
	print("Négatif.")
else:
	print("Nul.")
==


