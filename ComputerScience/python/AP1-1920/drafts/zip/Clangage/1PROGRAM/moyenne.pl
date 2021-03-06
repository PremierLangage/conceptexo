

title= moyenne d'une suite
tag=boucle,tests


extends=/ComputerScience/C/template/stdsandboxC.pl


text==  

Ecrire un programme qui lit une  suite d'entiers positifs terminée par un négatif puis affiche leur somme et 
leur moyenne.<br
Si la suite commence par un négatif, on indiquera "suite vide".
**Exemples :**
-Entrer une suite d'entiers positifs:

1 4

3

3

-1
 somme= 11 moyenne=2.750000
-Entrer une suite d'entiers positifs:

Suite vide.
==

editor.code==
int main(void) {
...
printf("Entrer une suite d'entiers positifs:\n");
  /* votre code ici... */
}

==


codebefore==

#include <stdlib.h>
#include <stdio.h>

==

solution==



int main(void) {
	int n ;
    int somme=0;
    int nb=0;
    float moy;
    printf("Entrer une suite d'entiers positifs:\n");
    scanf("%d",&n);
    if(n<0) 
        printf("Suite vide.\n" );
    else{
        while (n>=0){
             somme+=n;
             nb+=1;
             scanf("%d",&n);
           }
        moy=somme;
        moy/=nb;
	    printf("somme=%d moyenne=%f diviseurs\n",somme,moy);
        }
	return 0;
}
==


tests==
[ ["Basique", "", "10 0 -1"],
  ["Vide", "", "-1"],
  ["Grand", "", "100 1 2 3 4 5 6 7 8 9 10 -2"],
  ["Aléatoire", "", " ".join([str(random.randint(-0,100)) for i in range(random.randint(5,10))])+" -1"]
  ]
==




