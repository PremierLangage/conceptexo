#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

title=Initialisation d'un tableau à 2 dimensions
tag=fonction|boucle|matrice

text==

Écrire une fonction **init_tab_2d** qui prend en paramètre un tableau de
caractère à deux dimensions **tab** ainsi que deux entiers **n** et
**m**. Le tableau comporte ainsi **n** lignes et **m** colonnes. Vous devrez
initialiser ce tableau avec des lettres minuscules, en commançant par
'a' et de manière croissante en ligne et en colonne. Quand on arrive
au 'z', on boucle en revenant sur la lettre 'a'.

<br />

Voici un exemple du contenu de la variable *tab* pour 11 lignes et 19 colonnes.

    a b c d e f g h i j k l m n o p q r s
    b c d e f g h i j k l m n o p q r s t
    c d e f g h i j k l m n o p q r s t u
    d e f g h i j k l m n o p q r s t u v
    e f g h i j k l m n o p q r s t u v w
    f g h i j k l m n o p q r s t u v w x
    g h i j k l m n o p q r s t u v w x y
    h i j k l m n o p q r s t u v w x y z
    i j k l m n o p q r s t u v w x y z a
    j k l m n o p q r s t u v w x y z a b
    k l m n o p q r s t u v w x y z a b c

==

editor.code==
... init_tab_2d(char** tab, int n, int m){
  ...
}
==

solution==

void init_tab_2d(char** tab, int n, int m){
  int i, j;

  for(i=0 ; i<n ; i++){
    for(j=0 ; j<m ; j++){
      tab[i][j] = 'a' + ((i+j) % 26);
    }
  }
}


==

code_before==

==

code_after==#|c|

#include <stdlib.h>
#include <stdio.h>

void print_tab_2d(char** tab, int n, int m){
  int i, j;

  for(i=0 ; i<n ; i++){
    for(j=0 ; j<m ; j++){
      printf("%c ", tab[i][j]);
    }
    printf("\n");
  }
}

int main(int argc, char* argv[]){
  int n = atoi(argv[1]);
  int m = atoi(argv[2]);
  int i;

  char** tab = malloc(n*sizeof(char*));
  for (i=0 ; i<n ; i++)
    tab[i] = malloc(m*sizeof(char));

  init_tab_2d(tab, n, m);
  print_tab_2d(tab, n, m);

  for (i=0 ; i<n ; i++)
    free(tab[i]);
  free(tab);

  return 0;
}

==


checks_args_stdin==#|python|
[ ["Test basique", ["1", "1"], ""],
  ["Tableau vide", ["0", "0"], ""],
  ["Tableau ligne", ["1", "6"], ""],
  ["Tableau colonne", ["7", "1"], ""],
  ["Grand tableau", ["19", "31"], ""],
  ["Test aléatoire 1", [str(randint(1, 20)), str(randint(1, 40))], ""],
  ["Test aléatoire 2", [str(randint(1, 20)), str(randint(1, 40))], ""],
  ["Test aléatoire 3", [str(randint(1, 20)), str(randint(1, 40))], ""],
  ["Test aléatoire 4", [str(randint(1, 20)), str(randint(1, 40))], ""] ]
==



