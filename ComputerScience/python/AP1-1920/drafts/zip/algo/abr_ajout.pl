
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


extends= /ComputerScience/Algo/Tree/templates/zipsprogCwithtree.pl

#author=Marc Zipstein
title=Ajouter dans un arbre binaire de recherche
tag=recherche

editor.height=300px

text== 
Écrire une fonction C **ajoute** qui ajoute une valeur à un **arbre binaire de recherche**.
La fonction renvoie 1 en cas d'ajout réussi ou si la valeur est déjà dans l'arbre, et 0 sinon
On utilisera le type 
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

==

editor.code==#|c|


int ajoute(Tree *t,int valeur){
  if (*t == NULL){
    if ((*t=allocate_node(valeur))==NULL)
     return 0;
    return 1;
  }
  if ((*t)->value >valeur)
    return ajoute(&((*t)->left),valeur);
  if ((*t)->value <valeur)
   return ajoute(&((*t)->right),valeur);

  return 1;
} 


==

solution==#|c|


int ajoute(Tree *t,int valeur){
  if (*t == NULL){
    if ((*t=allocate_node(valeur))==NULL)
     return 0;
    return 1;
  }
  if ((*t)->value >valeur)
    return ajoute(&((*t)->left),valeur);
  if ((*t)->value <valeur)
   return ajoute(&((*t)->right),valeur);

  return 1;
} 


==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

Node * allocate_node(int val){
  Node * n = malloc(sizeof(Node));

  if (!n){
    fprintf(stderr, "problème allocation mémoire\n");
    return NULL;
  }
  n->left = NULL;
  n->right = NULL;
  n->value = val;
  return n;
}

==

code_after==#|c|

int build_tree(Tree* t){
    int val;
   
    while(1==    scanf("%d", &val))   {
      /* fprintf(stderr,"%d\n",val);*/
      if (0==ajoute(t,val)){
      fprintf(stderr, "problème allocation mémoire\n");
      return 0;
      }
    }
    return 1;
}
void arbre_vers_code_aux(Tree t,char* s){ 
      char c;
      if(t->left !=NULL && t->right!=NULL)  c='d';
  else if(t->left !=NULL && t->right==NULL) c='l';
  else if(t->left ==NULL && t->right!=NULL) c='r';
  else c='f';
  sprintf(s+strlen(s),"%c",c);
  sprintf(s+strlen(s),"%d",t->value); 
  /* fprintf(stderr,"*->%s\n",s); */
  if(t->left) 
       arbre_vers_code_aux(t->left,s+strlen(s));
 if(t->right)
       arbre_vers_code_aux(t->right,s+strlen(s));
}

char *arbre_vers_code(Tree t){
  static char s[300]={0} ;
  if(NULL!=t)
    arbre_vers_code_aux(t,s);
  s[strlen(s)]= 0;
  return s;
}
   
int main(int argc, char* argv[]){
  Tree t=NULL;
char *code;

  build_tree(&t);

  code=arbre_vers_code(t);
  fprintf(stderr,"%s",code)    ;
  return 0;
}
==

checks_args_stdin==#|python|
[["Arbre feuille", [], "4"],
 ["Abre à 3 nœuds", [], "4 2 5"],
 ["Peigne gauche", [], "12 10 9 8 7 0"],
 ["Peigne droit", [], "7 8 9 10 12 55"],
 ["Arbre aléatoire ", [],choice (["42 22 52 5 66 70","1 2 3 1 7 42 12"])],
  ["Arbre aléatoire II", []," ".join([ str(randint(1,100)) for i in range(10) ])]
]
==


