



title= Nombre de cellules d'une liste circulaire
tag=Nombre de cellules d'une liste simplement chainée circulaire

extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire une fonction `nb_cellules_circ`
qui renvoie le nombre d'éléments d'une liste chainée circulaire 
passée en parametre.  
On utilisera les types:  
typedef struct cel{  
int val;  
struct cel* suivant;  
}CelluleC;  
typedef CelluleC* ListeC  

==

editor.code==
....nb_cellules_circ(...) {
...
  /* votre code ici... */
}

==
solution==
int nb_cellules_circ(ListeC lst){
int compte=0;
ListeC debut=lst;
if(lst!=NULL)
do{
    compte+=1;
    lst=lst->suivant;
}while(lst !=debut){
    
return compte;
}

==

codebefore==

#include <stdlib.h>
#include <stdio.h>
typedef struct cel{  
int val;  
struct cel* suivant;  
}Cellule;  
typedef Cellule* Liste  ;

==

codeafter==
 Cellule* alloue_Cellule(int x){
Liste tmp=NULL;

if((tmp=(Liste)malloc(sizeof(Cellule)))!=NULL){
    tmp->val=x;
    tmp->suivant=NULL;
    }
return tmp;
}
void lire(Liste *lst){
    Liste tmp=NULL;
    int x;
    while(scanf("%d",&x)==1){
        if(*lst==NULL){
            *lst=alloue_Cellule(x);
            tmp=*lst;
            }
        else{
            tmp->suivant=alloue_Cellule(x);
            tmp=tmp->suivant;
            }
    }
    }


int main(void) {
	Liste l=NULL;
    int lg;
    lire(&l);
    lg=nb_cellules(l);
    printf("la liste contient %d element%s\n",lg,lg<2?"":"s");
	return 0;
}
==


tests==
[ ["Basique", "", "10 0 -1"],
  ["Vide", "", ""],
  
  ["Aléatoire", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,20))])+" -1"]
  ]
==











