extends = ../../../templates/generic/generic.pl

title = Fonctions : appartenance à un intervalle
# author = Antoine Meyer

text==
# Liste des mots binaires {.exo}

On souhaite écrire une fonction récursive `affiche_binaires(n)` permettant
d'afficher tous les nombres binaires écrits sur `n` chiffres. Par exemple :

    >>> affiche_binaires(2)
    00
    01
    10
    11

Pour résoudre ce problème plus aisément, on introduit une fonction auxiliaire
`affiche_binaires_prefixe(n, prefixe)` permettant d'afficher tous les nombres
binaires à `n` chiffres commençant par la chaîne `prefixe` (chaîne supposée
contenir uniquement des caractères `'0'` et `'1'`). Par exemple :

    >>> affiche_binaires_prefixe(4, '01')
    0100
    0101
    0110
    0111

Un algorithme possible est le suivant :

-   Si `prefixe` est de taille `n`, on l'affiche ;
-   Sinon, on affiche tous les nombres binaires de longueur `n` commençant par
    `prefixe + '0'`, puis tous ceux commençant par `prefixe + '1'`.

Le travail demandé est d'écrire la fonction récursive 
`affiche_binaires_prefixe(n, prefixe)` décrite ci- dessus, ainsi que la 
fonction `affiche_binaires(n)`.
==

grader==#|python|

#import sys
#print(pl_context, file=sys.stderr)

def affiche_binaires_aux_sol(n):
    if n > 0:
        affiche

def affiche_binaires_sol(n):

def tests(cases):
    for n, a, b in cases:
        run(f'dans_intervalle({n!r}, {a!r}, {b!r})', 
            title = f'Appartenance de {n!r} dans l\'intervalle [{a!r}, {b!r}]',
            result = a < n < b)

run(title='Évaluation du code', 
    output='')

tests([
    (4, 1, 12), 
    (40, 1, 12), 
    ("oui", "non", "peut-être"),
    ("certainement", "non", "peut-être")
])
==





