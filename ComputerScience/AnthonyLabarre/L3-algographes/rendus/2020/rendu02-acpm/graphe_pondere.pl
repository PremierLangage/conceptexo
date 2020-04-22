# Test d'une classe Graphe implémentant un graphe pondéré non orienté.
@ /utils/sandboxio.py
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
builder= /builder/before.py

author = Anthony Labarre
title = Graphes pondérés
text = Écrivez une classe Graphe implémentant un graphe pondéré non orienté.

# création de l'éditeur de code
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==
editor1.theme = light


# le formulaire de l'exercice contient uniquement l'éditeur
form==
{{editor1|component}}
==

#@ /grader/evaluator.py [grader.py]
evaluator==


grade=(100,"bravo")
==

pltest0==
>>> import networkx
>>> G = Graphe()
>>> G.ajouter_aretes([(0, 2, -2), (1, 0, 4), (1, 2, 3), (2, 3, 2), (3, 1, -1)])
>>> sorted(G.sommets())
[0, 1, 2, 3]
>>> sorted(G.aretes())
[(0, 2, -2), (1, 0, 4), (1, 2, 3), (2, 3, 2), (3, 1, -1)]
==





