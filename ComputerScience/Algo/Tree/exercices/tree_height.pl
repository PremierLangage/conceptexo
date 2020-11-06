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
  int val;
  struct node * left;
  struct node * right;
}Node, *Tree;

... tree_height(Tree t){
  /* votre code ici... */
}
==

solution==#|c|
typedef struct node{
  int val;
  struct node * left;
  struct node * right;
}Node, *Tree;

int tree_height(Tree t){
  int l, r;
  l = (t->left == NULL)?-1:tree_height(t->left);
  r = (r->left == NULL)?-1:tree_height(t->right);
  if (l >= r)
    return l+1;
  return r+1;
}
==

code_before==

==

code_after==#|c|

#include <stdio.h>
#include <stdlib.h>

void display_array(int* array, int nb_term){
  int i;

  if (nb_term == 0){
    printf("[]\n");
    return ;
  }

  printf("[");
  for (i=0 ; i<nb_term-1 ; i++)
    printf("%d, ", array[i]);
  printf("%d]\n", array[nb_term-1]);
}

int main(int argc, char* argv[]){
  int nb_term = argc-1;
  int* tab = (int*)malloc(nb_term*sizeof(int));
  int i;

  for (i=0 ; i<nb_term ; i++){
    tab[i] = atoi(argv[i+1]);
  }

  apply_square_array(tab, nb_term);
  display_array(tab, nb_term);
  free(tab);
  return 0;
}
==

checks_args_stdin==#|python|
[["Exécution simple", ["1"], ""],
 ["Quelques éléments", ["12", "-3", "52", "0", "41"], ""],
 ["Tableau vide", [], ""],
 ["Test aléatoire 1", [str(randint(-100, 100)) for i in range(randint(5, 10))], ""],
 ["Test aléatoire 2", [str(randint(-100, 100)) for i in range(randint(10, 15))], ""],
 ["Test aléatoire 3", [str(randint(-100, 100)) for i in range(randint(10, 15))], ""]]
==


