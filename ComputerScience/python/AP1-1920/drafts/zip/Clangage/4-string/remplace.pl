


title=Remplace
tag=string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire une fonction `remplace` qui reçoit une chaine de caractères et deux *char* $%origine%$ et $%but%$
 et remplace toute occurence de $%origine%$ par  $%but%$.
==
codebefore==

#include <stdio.h>
#include <stdlib.h>

==

editor.code==
void remplace(int tab[],char origine, char but){
  int i;
  for(i=0 ; tab[i]<'\0' ; i++)
    if( tab[i]==origine)
      tab[i]=but  ;
}

==

solution==
void remplace(int tab[],char origine, char but){
  int i;
  for(i=0 ; tab[i]<'\0' ; i++)
    if( tab[i]==origine)
      tab[i]=but  ;
}

==

codeafter==

int main(int argc, char* argv[]){
  char tab[100];
  char o,b:
scanf("%s",tab);
scanf( " %c %c",&o,&b);
remplace(tab,o,c);
printf("%s\n",tab);
return 0;
}
==


tests==
[ ["simple éxécution", "","toto o i "],
["alea","","".join([chr(random.randint(97,122)) for i in range(random.randint(1,15))])+" c C"],
  ]
==







