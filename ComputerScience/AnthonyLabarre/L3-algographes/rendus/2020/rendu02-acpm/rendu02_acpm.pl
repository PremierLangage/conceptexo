# Test d'une classe Graphe implémentant un graphe pondéré non orienté.
@ /utils/sandboxio.py
@ unionfind.py
@ corrlib_graphes.py 
extends= /ComputerScience/python/template/pltestblonde.pl
builder= /builder/before.py

author = Anthony Labarre
title = Tester tout d'un coup!
text==
Rendu 2 : Arbres (et forêts) couvrants de poids minimum

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
#TODO voir avec Dominique si cela doit être ici ou dans le before
taboo = heapq
# Les tests:

# Vérifications basiques de la classe Graphe
testname0 = Vérifications basiques de la classe Graphe
# Tests d'indices non consécutifs pour les sommets => exclusion des listes et matrices d'adjacence
pltest0== 
>>> G = Graphe()  # Existence d'une class Graphe
>>> G.ajouter_aretes([(0, 2, -2), (1, 0, 4), (1, 2, 3), (2, 3, 2), (3, 1, -1)])  # Ajout d'arêtes pondérées
>>> sorted(G.sommets()) # Vérification de l'ensemble des sommets
[0, 1, 2, 3]
>>> sorted(sorted(_) + [poids] for *_, poids in G.aretes()) # Vérification de l'ensemble des arêtes
[[0, 1, 4], [0, 2, -2], [1, 2, 3], [1, 3, -1], [2, 3, 2]]
>>> sorted(G.poids_arete(u, v) for u, v, *_ in G.aretes()) # Vérification de l'ensemble des poids
[-2, -1, 2, 3, 4]
>>> from corrlib_graphes import PRIM_INSTANCE_TD #
>>> G.ajouter_aretes(PRIM_INSTANCE_TD) # Ajout d'arêtes  (indices non consécutifs)
>>> sorted(G.sommets()) # Vérification des sommets (indices non consécutifs)
[0, 1, 2, 3, 17, 18, 19, 20, 21, 22, 23]
>>> sorted(sorted(_) + [poids] for *_, poids in G.aretes()) # Vérification des arêtes (indices non consécutifs)
[[0, 1, 4], [0, 2, -2], [1, 2, 3], [1, 3, -1], [2, 3, 2], [17, 18, 4], [17, 20, 3], [17, 21, 1], [17, 22, 8], [18, 19, 7], [18, 20, 2], [18, 21, 3], [19, 21, 8], [19, 22, 5], [19, 23, 4], [20, 21, 6], [21, 22, 9], [21, 23, 6], [22, 23, 2]]
>>> sorted(G.poids_arete(u, v) for u, v, *_ in G.aretes())  # Vérification de l'ensemble des poids (indices non consécutifs)
[-2, -1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 6, 6, 7, 8, 8, 9]
==


# Vérifications basiques de la classe Graphe
testname1 = Vérification de l'ajout d'arêtes existantes avec maj du poids
pltest1== 
>>> G = Graphe()  # Existence d'une class Graphe
>>> G.ajouter_aretes([(0, 2, -2), (1, 0, 4), (1, 2, 3), (2, 3, 2), (3, 1, -1)])  # Ajout d'arêtes pondérées
>>> sorted(G.sommets()) # Vérification de l'ensemble des sommets
[0, 1, 2, 3]
>>> sorted(sorted(_) + [poids] for *_, poids in G.aretes()) # Vérification de l'ensemble des arêtes
[[0, 1, 4], [0, 2, -2], [1, 2, 3], [1, 3, -1], [2, 3, 2]]
>>> sorted(G.poids_arete(u, v) for u, v, *_ in G.aretes()) # Vérification de l'ensemble des poids
[-2, -1, 2, 3, 4]
>>> G.ajouter_aretes([(0, 2, -4), (0, 1, 20)])  # Ajout d'arêtes pondérées existantes
>>> sorted(G.sommets()) # Vérification de l'ensemble des sommets
[0, 1, 2, 3]
>>> sorted(sorted(_) + [poids] for *_, poids in G.aretes()) # Vérification de l'ensemble des arêtes
[[0, 1, 20], [0, 2, -4], [1, 2, 3], [1, 3, -1], [2, 3, 2]]
>>> sorted(G.poids_arete(u, v) for u, v, *_ in G.aretes()) # Vérification de l'ensemble des poids
[-4, -1, 2, 3, 20]
==

# Vérification de la classe Tas sur des entiers
testname2 = Vérification de la classe Tas sur des entiers
pltest2== 
>>> # création d'un tas d'entiers aléatoires
>>> from random import randint; donnees = [randint(-100, 100) for _ in range(10)] #
>>> try:
...     T = Tas()  # initialisation sans paramètre
... except TypeError:
...     T = Tas([])  # initialisation avec un itérable
>>> for elem in donnees:
...     T.inserer(elem)
>>> for elem in sorted(donnees):
...     extraction = T.extraire_minimum()
...     if extraction != elem:
...         print("attendu:", elem, ", obtenu:", extraction)
==

# Vérification de la classe Tas sur des triplets (premier élément = critère pour le minimum)

testname3 = Vérification de la classe Tas sur des triplets (premier élément = critère pour le minimum)
pltest3==
>>> from random import randint; donnees = [(randint(-100, 100), randint(-100, 100), randint(-100, 100)) for _ in range(10)] #
>>> try:
...     T = Tas()  # initialisation sans paramètre
... except TypeError:
...     T = Tas([])  # initialisation avec un itérable
>>> for elem in donnees:
...     T.inserer(elem)
>>> for elem in sorted(donnees):
...     extraction = T.extraire_minimum()
...     if extraction[0] != elem[0]:
...         print("attendu: un triplet avec première valeur =", elem[0], ", obtenu: un triplet avec première valeur =", extraction[0])
==

# Vérification de la classe Tas sur des entiers avec doublon
testname4 = Vérification de la classe Tas sur des entiers avec doublon
pltest4== 
>>> # création d'un tas d'entiers aléatoires
>>> from random import randint; donnees = [88,81,41,87,15,34,46,17,64,34] #
>>> try:
...     T = Tas()  # initialisation sans paramètre
... except TypeError:
...     T = Tas([])  # initialisation avec un itérable
>>> for elem in donnees:
...     T.inserer(elem)
>>> for elem in sorted(donnees):
...     extraction = T.extraire_minimum()
...     if extraction != elem:
...         print("attendu:", elem, ", obtenu:", extraction)
==


# Vérifications basiques de la classe UnionFind
testname5 = Vérifications basiques de la classe UnionFind
pltest5==
>>> # initialisation d'un ensemble de singletons
>>> import itertools, random, unionfind; n = 50; ma_structure = unionfind.UnionFind(range(n)); sa_structure = UnionFind(range(n))
>>> # fusions aléatoires
>>> nbr_unions = 20
>>> couples = list(itertools.combinations(range(n), 2)); random.shuffle(couples)
>>> for i in range(nbr_unions):
...     a, b = couples.pop()
...     sa_structure.union(a, b)
...     ma_structure.union(a, b)
>>> sa_partition = sorted(map(sorted, unionfind.unionfind_vers_collection(sa_structure, range(n))))
>>> ma_partition = sorted(map(sorted, unionfind.unionfind_vers_collection(ma_structure, range(n))))
>>> if ma_partition != sa_partition:
...     print("résultat attendu:", ma_partition)
...     print("résultat obtenu:", sa_partition)
==


# Vérifications de acpm_prim sur un graphe connexe
testname6 = Vérifications de acpm_prim sur l'exemple du cours
pltest6==
>>> from corrlib_graphes import *; from random import choice #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS) # initialisation de l'instance du cours
>>> arbre = acpm_prim(G, choice(list(G.sommets()))) # lancement de acpm_prim avec départ aléatoire
>>> sum(poids for *_, poids in arbre.aretes())  # vérification du poids de la solution
23
>>> if not est_arbre_couvrant(arbre, G):  # Le résultat est-il bien un arbre couvrant?
...     print("l'arbre trouvé d'arêtes", arbre.aretes(), "n'est pas un arbre couvrant pour le graphe G de sommets", sorted(G.sommets())) #
...     if not est_arbre(arbre): # Le résultat est-il bien un arbre?
...         print("l'arbre trouvé n'est pas un arbre") #
...         if any(v not in G.sommets() for v in sum((arete[:2] for arete in arbre.aretes()), ())): #
...             print("certaines extrémités d'arêtes ne sont pas des sommets") #
==

testname7 = Vérifications de acpm_prim sur l'exemple du TD
pltest7==
>>> from corrlib_graphes import *; from random import choice #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_TD) # initialisation de l'exemple du TD
>>> arbre = acpm_prim(G, choice(list(G.sommets()))) # lancement de acpm_prim avec départ aléatoire
>>> sum(poids for *_, poids in arbre.aretes())
18
>>> if not est_arbre_couvrant(arbre, G):  # Le résultat est-il bien un arbre couvrant?
...     print("l'arbre trouvé d'arêtes", arbre.aretes(), "n'est pas un arbre couvrant pour le graphe G de sommets", sorted(G.sommets())) #
...     if not est_arbre(arbre): # Le résultat est-il bien un arbre?
...         print("l'arbre trouvé n'est pas un arbre") #
...         if any(v not in G.sommets() for v in sum((arete[:2] for arete in arbre.aretes()), ())): #
...             print("certaines extrémités d'arêtes ne sont pas des sommets") #
==

testname8 = Vérifications de acpm_prim sur une instance aléatoire
pltest8==
>>> from corrlib_graphes import *; from random import choice #
>>> G = Graphe(); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10))) # initialisation d'une instance aléatoire
>>> arbre = acpm_prim(G, choice(list(G.sommets()))) # lancement de acpm_prim avec départ aléatoire
>>> poids_solution_optimale = poids_fcpm(G.aretes()) #
>>> poids_obtenu = sum(poids for *_, poids in arbre.aretes()) #
>>> if poids_obtenu != poids_solution_optimale: # Vérification du poids
...     print("poids obtenu =", poids_obtenu, "; poids optimal =", poids_solution_optimale) #
>>> if not est_arbre_couvrant(arbre, G):  # Le résultat est-il bien un arbre couvrant?
...     print("l'arbre trouvé d'arêtes", arbre.aretes(), "n'est pas un arbre couvrant pour le graphe G de sommets", sorted(G.sommets())) #
...     if not est_arbre(arbre): # Le résultat est-il bien un arbre?
...         print("l'arbre trouvé n'est pas un arbre") #
...         if any(v not in G.sommets() for v in sum((arete[:2] for arete in arbre.aretes()), ())): #
...             print("certaines extrémités d'arêtes ne sont pas des sommets") #
==

# Vérifications de acpm_kruskal sur un graphe connexe
testname9 = Vérifications de acpm_kruskal sur l'exemple du cours
pltest9==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS) # initialisation de l'instance du cours
>>> arbre = acpm_kruskal(G)
>>> sum(poids for *_, poids in arbre.aretes())
23
>>> if not est_arbre_couvrant(arbre, G):  # Le résultat est-il bien un arbre couvrant?
...     print("l'arbre trouvé d'arêtes", arbre.aretes(), "n'est pas un arbre couvrant pour le graphe G de sommets", sorted(G.sommets())) #
...     if not est_arbre(arbre): # Le résultat est-il bien un arbre?
...         print("l'arbre trouvé n'est pas un arbre") #
...         if any(v not in G.sommets() for v in sum((arete[:2] for arete in arbre.aretes()), ())): #
...             print("certaines extrémités d'arêtes ne sont pas des sommets") #
==

testname10 = Vérifications de acpm_kruskal sur l'exemple du TD
pltest10==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_TD) # initialisation de l'exemple du TD
>>> arbre = acpm_kruskal(G)
>>> sum(poids for *_, poids in arbre.aretes())
18
>>> if not est_arbre_couvrant(arbre, G):  # Le résultat est-il bien un arbre couvrant?
...     print("l'arbre trouvé d'arêtes", arbre.aretes(), "n'est pas un arbre couvrant pour le graphe G de sommets", sorted(G.sommets())) #
...     if not est_arbre(arbre): # Le résultat est-il bien un arbre?
...         print("l'arbre trouvé n'est pas un arbre") #
...         if any(v not in G.sommets() for v in sum((arete[:2] for arete in arbre.aretes()), ())): #
...             print("certaines extrémités d'arêtes ne sont pas des sommets") #
==

testname11 = Vérifications de acpm_kruskal sur une instance aléatoire
pltest11==
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
testname12 = Vérifications de acpm_kruskal sur un graphe non connexe
pltest12==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS); G.ajouter_aretes(PRIM_INSTANCE_TD); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10)))  # initialisation du graphe
>>> poids_solution_optimale = poids_fcpm(G.aretes())
>>> foret = acpm_kruskal(G); poids_obtenu = sum(poids for *_, poids in foret.aretes())
>>> if poids_obtenu != poids_solution_optimale:
...     print("poids obtenu =", poids_obtenu, "; poids optimal =", poids_solution_optimale)
>>> if not est_foret_couvrante(foret, G):  # Le résultat est-il bien une forêt couvrante?
...     print("la forêt calculée n'est pas couvrante") #
==

# Vérifications de fcpm_prim sur un graphe non connexe
testname13 = Vérifications de fcpm_prim sur un graphe non connexe (union du cours et du td)
pltest13==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS); G.ajouter_aretes(PRIM_INSTANCE_TD) # initialisation
>>> foret = fcpm_prim(G)
>>> sum(poids for *_, poids in foret.aretes())
41
>>> if not est_foret_couvrante(foret, G):  # Le résultat est-il bien une forêt couvrante?
...     print("la forêt calculée n'est pas couvrante") #
==

# Vérifications de fcpm_prim sur un graphe non connexe
testname14 = Vérifications de fcpm_prim sur un graphe non connexe  (union du cours, du td et d'un graphe aléatoire)
pltest14==
>>> from corrlib_graphes import * #
>>> G = Graphe(); G.ajouter_aretes(PRIM_INSTANCE_COURS); G.ajouter_aretes(PRIM_INSTANCE_TD); G.ajouter_aretes(aretes_ponderees(graphe_connexe_aleatoire_pondere(10)))  # initialisation du graphe
>>> poids_solution_optimale = poids_fcpm(G.aretes())
>>> foret = fcpm_prim(G); poids_obtenu = sum(poids for *_, poids in foret.aretes())
>>> if poids_obtenu != poids_solution_optimale:
...     print("poids obtenu =", poids_obtenu, "; poids optimal =", poids_solution_optimale)
>>> if not est_foret_couvrante(foret, G):  # Le résultat est-il bien une forêt couvrante?
...     print("la forêt calculée n'est pas couvrante") #
==

# Le grader:
#@ /grader/evaluator.py [grader.py]
evaluator==


grade=(100,"Tout semble correct. Bravo!!")
==

#
# création de l'éditeur de code
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==

















