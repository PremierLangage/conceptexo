
extends = /model/mathinput2.pl


title= Balise de titre 

text==
Un exercice de saisie d'un calcul.
Donner le produit et somme de {{a}} et {{b}}. 

{{input1.value }}


==

# Avant que ce soit présenté à l'élève 
before==


a=3
b=6


==


form ==
la somme    
{{ input1|component}}
le produit
{{ input2|component}}
==


# évaluer la réponse 
evaluator==
bof=" ici un commentaire sur le bof "



if input1.value == a+b and input2.value == a*b :
    grade=(100,"Bravo ")
else:
    grade=(0," Raté recommencez ")
==


