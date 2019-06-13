# Copyright 2017 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 
name=sisi003.pl
title= Si  Sinon / IF ELIF ELSE
tag= input|else|if|elif
extends=/ComputerScience/python/template/soluce.pl
text==

Ecrire un programme qui demande à l’utilisateur deux entiers a et b par exemple:

	3  
	4  

Et qui affiche  

		a plus grand que b  
	ou  
		a plus petit que b  
	ou  
		a est égal à b  

Dans l'exemple cela affiche :

	3 est plus petit que 4

==

code==
# ne pas modifier
a,b=input().split(' ')
a=int(a)
b=int(b)
# Ecrire a partir d'ici 

==


plsoluce==
Grand |12 66
Egaux |77 77
Petit |66 23
==


soluce==
a,b=input().split(' ')
a=int(a)
b=int(b)

if a > b:
	forma="%d est plus grand que %d" 
elif a < b :
	forma="%d est plus petit que %d" 
else:
	forma="%d est égal à %d" 

print(forma % (a,b))
==


