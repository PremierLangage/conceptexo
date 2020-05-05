# Test d'une fonction composantes_fortement_connexes.
@ /utils/sandboxio.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Composantes fortement connexes.
text==
Écrivez une fonction composantes_fortement_connexes(graphe), renvoyant les composantes fortement connexes d'un graphe orienté sous la forme d'un itérable d'itérables de sommets.
==

# Les tests:
testname0 = Vérifications de composantes_fortement_connexes sur l'exemple du cours
pltest0==
>>> from corrlib_graphes import CFC_INSTANCE_COURS #
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_COURS) # initialisation de l'instance du cours
>>> cfc = composantes_fortement_connexes(G)
>>> sorted(map(sorted, cfc))
[[0, 1, 4], [2, 3], [5, 6], [7]]
==

testname1 = Vérifications de composantes_fortement_connexes sur l'exemple du TD
pltest1==
>>> from corrlib_graphes import CFC_INSTANCE_TD #
>>> G = GrapheOriente(); G.ajouter_arcs(CFC_INSTANCE_TD) # initialisation de l'instance du cours
>>> cfc = composantes_fortement_connexes(G)
>>> sorted(map(sorted, cfc))

==

# TODO
testname2 = Vérifications de acpm_kruskal sur une instance aléatoire
pltest2==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10))) # initialisation d'une instance aléatoire
>>> poids_solution_optimale = poids_fcpm(G.aretes())
>>> arbre = acpm_kruskal(G); poids_obtenu = sum(poids for *_, poids in arbre.aretes())
>>> if poids_obtenu != poids_solution_optimale:
...     print("poids obtenu =", poids_obtenu, "; poids optimal =", poids_solution_optimale)
>>> if not est_arbre_couvrant(arbre, G):  # Le résultat est-il bien un arbre couvrant?
...     print("l'arbre trouvé d'arêtes", arbre.aretes(), "n'est pas un arbre couvrant pour le graphe G de sommets", sorted(G.sommets())) #
...     if not est_arbre(arbre): # Le résultat est-il bien un arbre?
...         print("l'arbre trouvé n'est pas un arbre") #
...         if any(v not in G.sommets() for v in sum((arete[:2] for arete in arbre.aretes()), ())): #
...             print("certaines extrémités d'arêtes ne sont pas des sommets") #
==


# Vérifications de acpm_kruskal sur un graphe non connexe
testname3 = Vérifications de acpm_kruskal sur un graphe non connexe
pltest3==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS); G.ajouter_aretes(PRIM_INSTANCE_TD); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10)))  # initialisation du graphe
>>> poids_solution_optimale = poids_fcpm(G.aretes())
>>> foret = acpm_kruskal(G); poids_obtenu = sum(poids for *_, poids in foret.aretes())
>>> if poids_obtenu != poids_solution_optimale:
...     print("poids obtenu =", poids_obtenu, "; poids optimal =", poids_solution_optimale)
>>> if not est_foret_couvrante(foret, G):  # Le résultat est-il bien une forêt couvrante?
...     print("la forêt calculée n'est pas couvrante") #
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
















