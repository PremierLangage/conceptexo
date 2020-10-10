title=Décalage circulaire

tag=Tableau|Fonction|DeclarationFonction|TransmissionParametre|ParcoursTableau|ComparaisonContigues

extends=/ComputerScience/C/template/stdsandboxC.pl

author= 

text==
Écrire une fonction `void decaleDG(int tab1 [], tab2 [], int taille)` qui reçoit deux tableaux, `tab1` et `tab2`, 
ainsi que leur taille et effectue un d'écalage circulaire d'une case vers la droite pour `tab1`, et d'une case vers la gauche pour `tab2`.
<p>
Exemple
avec taille 5 : <br>
- si tab1 contient $%1,2,3,4%$ et tab2 contient $%1,2,3,4%$ , après l'éxécution de decalDG(tab1,tab2,5), tab1 contiendra $%4,1,2,3%$ et tab2 $%2,3,4,1%$

<p>
(*) MAX est une constante symbolique définie par #define MAX XXXXX, où XXXXX est un entier positif.
==
codebefore==

#include <stdio.h>
#include <stdlib.h>
#define MAX 5

==

editor.code==
/* Retour */ est_croissante(/* Paramètres */){

}
==

solution==
int est_croissante(int tab[]){
  int i=1;
for(;i<MAX;i+=1){
    if (tab[i-1] >= tab[i])
      return 0;
      }
  return 1;
}
==

codeafter==
int main(int argc, char* argv[]){
  int tab[MAX];
  int lu;
  int i;
  for (i = 0; i < MAX; i++) {
    scanf("%d",&lu);
    tab[i] = lu;
  }
  printf("-->%d\n",est_croissante(tab));

  return 0;
}
==

# MAX était donné comme valeur comme en C dans les tests, ça faisait tout planter, il faut le mettre à la main
tests==
[ ["croissante 1", "","-1 2 5 8 78"] ,
["pas croissante", "","-1 2 8 5 78"] ,
["croissante 2", ""," ".join([str(0) for i in range(15)]) ],
["croissante 3", ""," ".join([str(i) for i in range(5)]) ],
["aléatoire 1 ", ""," ".join([str(random.randint(-20,20)) for i in range(5)])], 
["aléatoire 2 ", ""," ".join([str(random.randint(0,20)) for i in range(3)])],

]
==























