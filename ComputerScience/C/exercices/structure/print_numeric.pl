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

extends=/ComputerScience/C/template/std_progC.pl

author=Nicolas Borie

title=Structure contenant une autre structure
tag=structure|imbriquées|complexe|polymorphe|générique

editor.height=400px

text==


==

editor.code==#|c|
#include <stdio.h>

typedef enum {integer, real, complex} NumType;

typedef struct{
  NumType type;
  union{
    int integer;
    float real;
    float complex[2];
  };
}Numeric;

void print_numeric(Numeric* n){
  /* Votre code ici... */
}
==

solution==#|c|
#include <stdio.h>

typedef enum {integer, real, complex} NumType;

typedef struct{
  NumType type;
  union{
    int integer;
    float real;
    float complex[2];
  };
}Numeric;

void print_numeric(Numeric* n){
  if (n->type == integer)
    printf("%d", n->integer);
  else if (n->type == real)
    printf("%f", n->real);
  else
    printf("%f+%f*i", n->complex[0], n->complex[1]);
}
==

code_before==#|c|
==

code_after==#|c|
#include <stdlib.h>

int main(int argc, char* argv[]){
  Numeric n;

  n.type = atoi(argv[1]);
  if (n.type == integer)
    n.integer = atoi(argv[2]);
  else if (n.type == real)
    n.real = strtof(argv[2], NULL);
  else{
    n.complex[0] = strtof(argv[2], NULL);
    n.complex[1] = strtof(argv[3], NULL);
  }

  printf("Affichage de la donnée numérique générique : ");
  print_numeric(&n);
  putchar('\n');
  return 0;
}
==

checks_args_stdin==#|python|
[ ["Entier simple", ["0", "42"], ""] ] 
==

