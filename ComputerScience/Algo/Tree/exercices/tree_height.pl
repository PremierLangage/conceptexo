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

title=Calculer la hauteur d'un arbre
tag=arbre|algo|hauteur|feuille|récursivité

editor.height=250px

text==
Écrire une fonction C **tree_height** qui prend en argument un **arbre** (un pointeur 
vers le `Node` racine de l'arbre) et retourne un entier qui devra 
être la **hauteur de l'arbre**. 

<br>

Pour rappel, une feuille a pour 
hauteur `0` par définition. La hauteur d'un nœud interne est 
le maximum des hauteurs de ces enfants plus un. En utilisant ces 
conventions et définition, la hauteur d'un arbre est aussi la 
longueur maximal en nombre d'arrêtes des chemins de la racine 
aux feuilles de l'arbre.
==

editor.code==#|c|
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

... tree_height(Tree t){
  /* votre code ici... */
}
==

solution==#|c|
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

int tree_height(Tree t){
  int l, r;
  l = (t->left == NULL)?-1:tree_height(t->left);
  r = (t->right == NULL)?-1:tree_height(t->right);
  if (l >= r)
    return l+1;
  return r+1;
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
    char c;
    
    scanf("%c", &c);
    scanf("%d", &val);
    if ((*t = allocate_node(val)) == NULL){
      fprintf(stderr, "problème allocation mémoire\n");
      return 0;
    }
    printf("%c --> %d\n", c, val);
    switch(c) {
    case 'd': return build_tree(&((*t)->left)) && build_tree(&((*t)->right));
    case 'l': return build_tree(&((*t)->left));
    case 'r': return build_tree(&((*t)->right));
    case 'f': return 1;
      break;
    default :
      fprintf(stderr, "Arbre mal formé\n");
      return 0;
    }
    return 1;
}

int main(int argc, char* argv[]){
  Tree t=NULL;

  build_tree(&t);
  
  printf("La hauteur de l'arbre transmis est : %d\n", tree_height(t));
  return 0;
}
==

checks_args_stdin==#|python|
[["Arbre feuille", [], "f0"],
 ["Abre à 3 nœuds", [], "d1f0f0"],
 ["Peigne gauche", [], "l5l4l3l2l1f0"], ]
==


