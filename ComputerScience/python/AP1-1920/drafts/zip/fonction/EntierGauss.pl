


# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title =Entiers de Gauss
text==  

On appelle "entier de Gauss" un nombre complexe $%z=a+\mathrm{i}b , a,b \in \mathbb{R} %$

Ecrire une fonction *nb_carre_Gauss(r)* qui renvoie le nombre d'entiers de Gauss de module inférieur à $%r%$
dont le carré est également un entier de Gauss de modulle inférieur à $%r%$.


==
before==
def carre_complexe(x,y):
    return 0 


import random, sys

n=random.randint(4,12)

pltest3=""">>> coefficients_binome({})\n'{}'""".format(n, coefficients_binome(n))

after=before
==



pltest0==
>>> factoriel(3)==6 and combinaison(3,2)==3 and coefficients_binome(2)=="1 2 1"
True
==
pltest1==
#negatif
>>> coefficients_binome(-9)
'non défini'
==

pltest2==
>>> coefficients_binome(5)
'1 5 10 10 5 1'
==




