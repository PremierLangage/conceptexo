#*****************************************************************************
#  Copyright (C) 2019 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Matrice carrée d'entiers
tag=malloc|fonction|matrice|allocation|initialisation

text==
Écrire une fonction qui alloue et initialise une **matrice carrée d'entiers** dont 
la taille sera donnée en argument.

Pour `n=7`, votre fonction devra allouer et initialiser une matrice comme il suit :

    1 2 3 4 5 6 7
    1 2 3 4 5 6 7
    1 2 3 4 5 6 7
    1 2 3 4 5 6 7
    1 2 3 4 5 6 7
    1 2 3 4 5 6 7
    1 2 3 4 5 6 7

==

editor.code==#|c|
#include <stdio.h>
#include <stdlib.h>

int** square_matrix(int size){
  /* ... votre code ici ... */
}
==

solution==#|c|
#include <stdio.h>
#include <stdlib.h>

int** square_matrix(int size){
  int** ans;
  int i, j;

  ans = malloc(size * sizeof(int*));
  for(i=0 ; i<size ; i++){
    ans[i] = malloc(size * sizeof(int));
    for(j=0 ; j<size ; j++)
      ans[i][j] = j+1;
  }
  return ans;
}
==

code_before==#|c|
==

code_after==#|c|
int main(int argc, char* argv[]){
  int i, j;
  int n = atoi(argv[1]);
  int** ans;

  ans = square_matrix(n);

  for (i=0 ; i<n ; i++){
    for (j=0 ; j<n ; j++){
    printf("%2d ", ans[i][j]);
    }
    putchar('\n');
    free(ans[i]);
  }
  free(ans);

  return 0;
}
==

checks_args_stdin==#|python|
[["Sinple", "1", ""],
 ["Moyen", "5", ""],
 ["Aléatoire", str(randint(5, 10)), ""],
 ["Aléatoire", str(randint(11, 15)), ""],
 ["Aléatoire", str(randint(16, 20)), ""]]
==

