
# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Vecteurs
text==
 On décide de représenter un vecteur de $%\mathbb{R}^n %$ par une liste de longueur n.<br>
 Ecrire les fonctions de manipulation de vecteurs:<br>
 - `add(u,v)` qui reçoit deux vecteurs et renvoie le vecteur somme <br>
 - `produit(r,,v)` qui reçoit un reel et un vecteur et renvoie leur produit<br>
 - `produit_scalaire(u,v)` qui reçoit deux vecteurs et renvoie leur produit scalaire<br>
 - `combinaison_lineaire(coef,generateur)` une liste de coefficients (*coef*) et une liste de vecteurs
 et renvoie le vecteurs combinaisons linéaire des vecteurs de *générateur* avec les scalaires de *coef*<br>
 Pour toutes les fonctions on supposera que les données sont correctes: <br>
 les vecteurs reçus on la même dimension, <br>
 il y a autant de scalaires dans *coef* que de vecteurs dans *générateur*
 Exemples :<br>
 - `add([0,1,2,3],[5,5,5,5])` renvoie [5,6,7,8]<br>
 - `produit(4,[0,1,2,3,-2])` renvoie [0,4,8,12,-8]
 - `produit_scalaire([0,1,2],[1,-1,1])` renvoie 1<br>
 - `combinaison_lineaire([2, 2, -1],[[0, 1, 2, 3], [5, 5, 5, 5], [-1, -2, -1, 0]])` renvoie [11, 14, 15, 16]<br>
==
