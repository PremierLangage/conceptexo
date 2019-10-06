# author=OCE
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/loopsoluce.pl

before== #|python|
import random
lval1=[True,False,1,0,67]
lval2=[False,True,0,2,0]
lexp=["not var","not var","1 - var","2-var","67-var"]
N= random.randint(0,4)
val1=lval1[N]
val2=lval2[N]
exp=lexp[N]
soluce="var = "+exp
sval1 = str(val1)
sval2 = str(val2)
==

title== #|html|
Bascule
==

text==
Le but de cet exercice est d'avoir une ligne de code de la forme :

    var = expression

telque la valeur de *var* passe successivement de la valeur **{{val1}}** à la valeur **{{val2}}** 
puis de la valeur **{{val2}}** à la valeur **{{val1}}**, a chaque fois que l'on exécute la ligne.

Ecrivez l'expression qui permet de faire cela.

==

code== 
# écrivez votre code ici
==

taboo=while
needed=for

soluce==
a=input("Entrez un nombre : ")
for i in range(X):
    print(i+1,a)
    a = a * R
==

plsoluce==
test1 | 5
test2 | 3
==


