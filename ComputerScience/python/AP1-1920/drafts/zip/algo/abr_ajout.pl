
#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

extends=/ComputerScience/Algo/Tree/templates/std_progC_with_tree.pl

author=Nicolas Borie
title=Ajouter dans un arbre binaire de recherche
tag=arbre binaire de recherche

editor.height=300px

text== 
Écrire une fonction C **ajoute** ajoute une valeur à un **arbre bianaire de recherche**.
La fonctio renvoie 1 en cas d'ajout réussit ou si la valeur est déjà dans l'arbre, et 0 sinon
==

editor.code==#|c|
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

... ajoute(...){
  /* Votre code ici... */
}
==

solution==#|c|
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

int ajoute(Tree *t,int valeur){
  if (*t == NULL){
    if ((*t=allocate_node(valeur))==NULL)
     return 0;
    return 1;
  }
  if (((*t)->value <valeur))
    return ajoute(t,valeur);
if (((*t)->value >valeur))
    return ajoute(t,valeur);

  return 1;
}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

code_after==#|c|
Node* allocate_node(int val){
  Node* n = malloc(sizeof(Node));

  if (!n){
    fprintf(stderr, "problème allocation mémoire\n");
    return NULL;
  }
  n->left = NULL;
  n->right = NULL;
  n->value = val;
  return n;
}

int build_tree(Tree* t){
    int val;
   
    while(1==    scanf("%d", &val);
    if (0=ajoute(t,val){
      fprintf(stderr, "problème allocation mémoire\n");
      return 0;
    }
 
    return 1;
}

int main(int argc, char* argv[]){
  Tree t=NULL;
  int n;

  build_tree(&t);
  
;
  return 0;
}
==

checks_args_stdin==#|python|
[["Arbre feuille", [], "f1"],
 ["Abre à 3 nœuds", [], "d2f1f3"],
 ["Peigne gauche", [], "l5l4l3l2l1f0"],
 ["Arbre aléatoire à 6 nœuds", [], random_binary_tree(6)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 8 nœuds", [], random_binary_tree(8)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 10 nœuds", [], random_binary_tree(10)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 12 nœuds", [], random_binary_tree(12)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 14 nœuds", [], random_binary_tree(14)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 100 nœuds", [], random_binary_tree(100)[0].to_string_code().replace(' ', '')],
 ["Arbre aléatoire à 500 nœuds", [], random_binary_tree(500)[0].to_string_code().replace(' ', '')] ]
==


