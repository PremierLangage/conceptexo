# Copyright 2017-2019 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Déclaration d'une structure C pour une personne

author=Nicolas Borie
title=Structure C pour une personne
tag=structure
extends=/ComputerScience/C/template/stdsandboxC.pl

text==
Déclarer et définir une *structure* C nommé *People*. Cette structure
devra contenir deux champs pour des chaînes de caractères C d'au plus
63 caractères. Ces deux champs devront être nommés *first_name* et
*last_name*. Ajouter aussi un champ entier qui devra s'appeler *age*.

==

editor.code==
typedef ...

==

solution==

typedef struct {
  char first_name[64];
  char last_name[64];
  int age; 
}People;

==

codeafter==
 
#include <stdio.h>
#include <stdlib.h>    
#include <string.h>
    
int main(int argc, char* argv[]){
  People P;

  strcpy(P.first_name, argv[1]);
  strcpy(P.last_name, argv[2]);
  P.age = atoi(argv[3]);
  
  printf("Personne reconnue : %s %s %d\n", P.first_name, P.last_name, P.age);
  return 0;
}

==

tests==
[ ["Déclaration et utilisation 1", "John Doe 42",""],
  ["Déclaration et utilisation 2", "Master Yoda 913",""],
  ["Déclaration et utilisation 2", "'Nicolaï Yvanovich' Borisky 12",""] ] 
==

