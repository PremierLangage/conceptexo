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

title=Trouver l'index d'un élément
tag=array|fonction|tableau|recherche

text==
Écrire une fonction C **find_index** qui prend en paramètre un tableau
d'entiers, le nombre d'éléments contenu dans le tableau ainsi qu'un
entier recherché.   


La fonction recherchera l'index le plus petit tel que le tableau
contienne l'élément recherché à cet index. Si la fonction ne trouve
pas l'entier recherché dans le tableau, la fonction retournera -1.   

==

editor.code==
... find_index(...){
    /* Votre code ici */
}

==

solution==

int find_index(int* tab, int size, int e){
  int i;	

  for (i=0 ; i<size ; i++)
    if (tab[i] == e)
    return i;

  return -1;
}

==

codeafter==

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int nb_term = argc-1;
  int* tab = (int*)malloc(nb_term*sizeof(int));
  int i;

  for (i=0 ; i<nb_term ; i++){
    tab[i] = atoi(argv[i+1]);
  }
  nb_term -= 1;

  printf("Index de %d : %d\n", tab[nb_term], find_index(tab, nb_term-1, tab[nb_term]));
  free(tab);
  return 0;
}

==

tests==
[ ["Exécution simple", "0 1 2 3 4 5 6 5", ""],
  ["Quelques éléments", "12 -3 52 0 41 52", ""],
  ["Tableau vide", "0 1 2 3 4 5 6 -3", ""],
  ["Aléatoire", " ".join([str(random.randint(-5, 5)) for i in range(random.randint(10,20))]), ""],
  ["Aléatoire", " ".join([str(random.randint(-5, 5)) for i in range(random.randint(10,20))]), ""],
  ["Aléatoire", " ".join([str(random.randint(-5, 5)) for i in range(random.randint(10,20))]), ""],
  ["Aléatoire", " ".join([str(random.randint(-5, 5)) for i in range(random.randint(10,20))]), ""],
  ["Aléatoire", " ".join([str(random.randint(-5, 5)) for i in range(random.randint(10,20))]), ""] ]
==




