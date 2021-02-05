

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
title=Extraire l'extremum dans un arbre binaire de recherche
tag=recherche

editor.height=300px

text== 
Écrire une fonction C **extraire_minimum** qui extrait le eminimumun d'un **arbre binaire de recherche**.
La fonction renvoie 1 en cas d'extraction réussie et 0 sinon;
On utilisera le type 
typedef struct node{
  int value;
  struct node * left;
  struct node * right;
}Node, *Tree;

==

editor.code==#|c|

int extraire_minimum(Tree *t,int *min){
  Tree a,tmp;
  if(*t==NULL)
    return 0;
  a=*t;
  if(a->left==NULL){
    *min=(*t)->value;
    *t=(*t)->right;
    free(a);
    return 1;
  }
  while(a->left->left!=NULL)
    a=a->left;
  *min=a->left->value;
  tmp=a->left;
  a->left=a->left->right;
  free(tmp);
  return 1;
}

==

solution==#|c|
int extraire_minimum(Tree *t,int *min){
  Tree a,tmp;
  if(*t==NULL)
    return 0;
  a=*t;
  if(a->left==NULL){
    *min=(*t)->value;
    *t=(*t)->right;
    free(a);
    return 1;
  }
  while(a->left->left!=NULL)
    a=a->left;
  *min=a->left->value;
  tmp=a->left;
  a->left=a->left->right;
  free(tmp);
  return 1;
}


==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define TCODE 300
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


int ajoute(Tree *t,int valeur){
  if (*t == NULL){
    if ((*t=allocate_node(valeur))==NULL)
     return 0;
    return 1;
  }
  if (((*t)->value >valeur))
    return ajoute(&((*t)->left),valeur);
  if (((*t)->value <valeur))
    return ajoute(&((*t)->right),valeur);

  return 1;
} 

int construit_abr(Tree *t,char * val[]){
int i=1;
for(i=1;val[i]!=NULL;i+=1)
  if(0=ajoute(t,strtod(val[i ],NULL)))}
      
      if (0==ajoute(t,val)){
      fprintf(stderr, "problème allocation mémoire\n");
      return 0;
      }
    }
    return 1;
}
int build_tree(Tree* t){
    int val;
   
    while(1==    scanf("%d", &val))   {
      
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
  
       arbre_vers_code_aux(t->left,s+strlen(s));
 if(t->right)
       arbre_vers_code_aux(t->right,s+strlen(s));
}

char *arbre_vers_code(Tree t){
  static char s[300] ;
int i;
    s[i]='\0';
  if(NULL!=t)
    arbre_vers_code_aux(t,s);
  s[strlen(s)]= 0;
  return s;
}
   
int main(int argc, char* argv[]){
  Tree t=NULL;
char *code;
int x;
  construit_tree(&t,argv);
extraire_minimum(&t,&x);
  code=arbre_vers_code(t);
  fprintf(stderr,"%d\n",x);
  fprintf(stderr,"%s",code)    ;
  return 0;
}
==

checks_args_stdin==#|python|
[["Arbre feuille", "4","f4"],
 ]
==

