#author=OCE

# Heritage d'un type d'exercice 
extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl
@ /ComputerScience/python/AP1-1920/templates/utils/pltestgrader.py

title = Couples (X,Y)

taboo=while
needed=for

text==  
Écrivez un script qui affiche tous les couples ( x , y ), x étant un entier positif compris entre 1 et p et y un entier positif 
compris entre 1 et q ; <br>
p et q sont deux entiers acquis au clavier. <br>
L’affichage doit se faire comme sur l’exemple suivant, qui correspond à p = 3 et q = 5:

( 1, 1 ) ( 1, 2 ) ( 1, 3 ) ( 1, 4 ) ( 1, 5 )<br>
( 2, 1 ) ( 2, 2 ) ( 2, 3 ) ( 2, 4 ) ( 2, 5 )<br>
( 3, 1 ) ( 3, 2 ) ( 3, 3 ) ( 3, 4 ) ( 3, 5 )<br>
==

grader== #|python|

import random
import pltestgrader

dic = pltestgrader.get_context()
student = pltestgrader.get_answers()['answer']

# Vérification dans le code de l'étudiant de la non présence du taboo
if "taboo" in dic:
    if pltestgrader.checktaboo(dic['taboo'], student):
        pltestgrader.output(0, "ATTENTION : Le mot clef " + dic['taboo'] + " est proscrit.")
        sys.exit(1)
# Vérification dans le code de l'étudiant de la présence du needed
if "needed" in dic:
    if not pltestgrader.checktaboo(dic['needed'], student):
        pltestgrader.output(0, "ATTENTION : Le mot clef " + dic['needed'] + " est demandé.")
        sys.exit(1)

def couple(x,y):
    p=int(input())
    q=int(input())
    chaine=""
    ligne=""
    for i in range(p):
        for j in range(q):
            chaine= "("+str(i+1)+","+str(j+1)+") "
            ligne += chaine
        print(ligne)
        chaine=""
        ligne=""

begin_test_group("1 <= n <= 2")
for i in range(1, 10):
    set_title(f"n = {i}")
    set_globals(n=i)
    run()
    assert_output(f"{fact(i)}\n")
end_test_group()

begin_test_group("Valeurs aléatoires")
for i in range(3):
    i = random.randint(30, 200)
    set_title(f"n = {i}")
    set_globals(n=i)
    run()
    assert_output(f"{fact(i)}\n")
end_test_group()
==

soluce==
p=int(input())
q=int(input())
chaine=""
ligne=""
for i in range(p):
    for j in range(q):
        chaine= "("+str(i+1)+","+str(j+1)+") "
        ligne += chaine
    print(ligne)
    chaine=""
    ligne=""
==








