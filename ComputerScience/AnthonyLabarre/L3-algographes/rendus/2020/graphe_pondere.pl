# Test d'une classe Graphe implémentant un graphe pondéré non orienté.
@ /utils/sandboxio.py
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
builder= /builder/before.py

author = Anthony Labarre
title = Graphes pondérés
text = Écrivez une classe Graphe implémentant un graphe pondéré non orienté.

# Les tests:

before==
print("yo")
==

pltest0==
>>> G = Graphe()
>>> G.ajouter_aretes([(0, 2, -2), (1, 0, 4), (1, 2, 3), (2, 3, 2), (3, 1, -1)])
>>> sorted(G.sommets())
[0, 1, 2, 3]
>>> sorted(G.aretes())
[(0, 2, -2), (1, 0, 4), (1, 2, 3), (2, 3, 2), (3, 1, -1)]
>>> sorted(map(G.poids_arete, (u, v) for u, v, *_ in G.aretes()))
[-2, -1, 2, 3, 4]
==


# Le grader:
#@ /grader/evaluator.py [grader.py]
evaluator==


grade=(100,"bravo")
==

#
# création de l'éditeur de code
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==

