
# Test d'une classe Graphe implémentant un graphe pondéré non orienté.
@ /utils/sandboxio.py
@ unionfind.py
@ corrlib_graphes.py
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Arbres (et forêts) couvrants de poids minimum
text==
Écrivez: 
<ul>
<li>une classe Graphe implémentant un graphe pondéré non orienté
<li>une classe Tas implémentant une file à priorité
<li>une classe UnionFind
<li>acpm_prim(graphe, sommet), qui prend en paramètres un graphe et un sommet de départ et renvoie un ACPM pour la composante connexe du sommet donné en suivant l'algorithme de Prim;
<li>acpm_kruskal(graphe), qui prend en paramètre un graphe et renvoie la forêt couvrante de poids minimum pour ce graphe en suivant l'algorithme de Kruskal;
<li>fcpm_prim(graphe), qui prend en paramètre un graphe et renvoie la forêt couvrante de poids minimum pour ce graphe en suivant l'algorithme de Prim.
</ul>
==

for_dr_dont_touch==
class Graphe:
    def sommets(dummy):
        return [0, 1, 2, 3]
==

# Mon code
before==
import corrlib_graphes
==

# Les tests:


# Vérifications de acpm_kruskal sur un graphe connexe
testname0 = Vérifications de acpm_kruskal sur l'exemple du cours
pltest0==
>>> from corrlib_graphes import PRIM_INSTANCE_COURS #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS) # initialisation de l'instance du cours
>>> arbre = acpm_kruskal(G)
>>> sum(poids for *_, poids in arbre.aretes())
23
==

testname1 = Vérifications de acpm_kruskal sur l'exemple du TD
pltest1==
>>> from corrlib_graphes import PRIM_INSTANCE_TD #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_TD) # initialisation de l'exemple du TD
>>> arbre = acpm_kruskal(G)
>>> sum(poids for *_, poids in arbre.aretes())
18
==

testname2 = Vérifications de acpm_kruskal sur une instance aléatoire
pltest2==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10)) # initialisation d'une instance aléatoire
>>> poids_solution_optimale = poids_fcpm(G.aretes())
>>> arbre = acpm_kruskal(G); poids_obtenu = sum(poids for *_, poids in arbre.aretes())
>>> if poids_obtenu != poids_solution_optimale:
...     print("poids obtenu =", poids_obtenu, "; poids optimal =", poids_solution_optimale)
==


# Vérifications de acpm_kruskal sur un graphe non connexe
testname3 = Vérifications de acpm_kruskal sur un graphe non connexe
pltest3==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS); G.ajouter_aretes(PRIM_INSTANCE_TD); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10))  # initialisation du graphe
>>> foret = acpm_kruskal(G)
>>> sum(poids for *_, poids in foret.aretes())
41
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











