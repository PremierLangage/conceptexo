# Boris Jabot 10/09/2019 OK


extends=/ComputerScience/python/template/qcm_template.pl

title= 8 pommes

enonce.1==
n=5
while n >0:
    print(n)
print('Fini')
==
rep.1=La Boucle est infinie

enonce.2==
n=5
while n > 0
    print(n)
    n += 1
print(’Fini’)
==
rep.2= Il devrait y avoir un ’:’ à la fin de l’instruction while.

enonce.3==
n=5
when n > 0:
print(n)
         n += 1
     print(’Fini’)
==
rep.3= L'instruction when n’est pas un mot clé du language Python.


mybuild==
import random
chaine= random.choice(['pomme','banana','banane','poire','ananas'])
entier= random.randint(5,8)

text=""" Qu'affiche le programme suivant :

    print(len('{}')*{})""".format(chaine,entier)

good=str(len(chaine)*entier)
bad=chaine*entier
bad+='\n'
bad += chaine+str(entier)
bad += '\n0'
==
text= Indiquez les lignes qui sont des commentaires en python :



nb=4
nbtrues=1
uncrosedfalse=
good==
# Ceci est un commentaire 
==

bad==
==

feedback=show




