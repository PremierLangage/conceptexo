# OCE : test 11/09/2019 OK

langage=python
tag=value|expression|operator

title= Appariement d'expressions et de valeurs 

# si vous vouler spécifier les opérateurs autorisés
# TODO à vérifier 
# ops=['+','-','']
# DONE ce qui serais bien c'est que l'on tire des expressions au hazard qui ne donne pas les mêmes valeurs 
# si vous souhaiter utiliser aussi les opérateurs unaires - et ~
douops=True
# si vous souhaiter utiliser aussi des opérateurs de comparaison 
docops=True
# logiques 
dolops=True



build=@ randomexpbuild.py

num=3

evaluator==
def evaluator(reponse, dic):
    if (reponse == dic['pairs']): # comparaisons de deux dictionnaires
        return True, "Bien joué"
    print("reponse",str(reponse))
    print("dicpairs",str(dic['pairs']))
    return False, "Mauvais matching"
==


extends=/ComputerScience/python/plbank:/gift/template/match.pl
type=direct


