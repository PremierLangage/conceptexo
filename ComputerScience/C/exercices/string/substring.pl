# Copyright 2019 Nicolas Borie <nicolas.borie@u-pem.fr>
# Copyright 2017 DR
#

author=NB & DR
title=Sous-chaîne dans une chaîne
tag=function|string
extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Écrire une fonction **substring** qui prend deux chaînes **big** et **sub** en argument. La fonction 
devra chercher si **sub** est contenu quelque part dans **big**. Elle devra retourner 1 si **sub** 
apparait dans **big** et 0 sinon.
==

editor.code==
int substring(... big, ... sub) {
  /* Votre code ici ... */
}
==

solution==

#include <string.h>

int substring(char* big, char* sub) {
  int i, j;
  
  for(i=0 ; big[i]!='\0' ; i++){
    for(j=0 ; sub[j]!='\0' ; j++)
      if(big[i] != sub[j])
        break;
    if(sub[j]=='\0')
      return 1;
  }
  return 0;
}

==

codeafter==

#include <stdlib.h>
#include <stdio.h>


int main(int argc, char* argv[]){

  if (substring(argv[1], argv[2]))
    printf("'%s' contient le mot '%s'",argv[1], argv[2]);
  else
    printf("'%s' ne contient pas le mot '%s'",argv[1], argv[2]);

  return 0;
}
==


tests==
[ ["Basique", "unmotavecunlici l", ""],
  ["Pas présent", "unmotsanslalettre x", ""], 
  ["Anagrame", "Borie Boire", ""],
  ["Aléatoire", "".join([chr(97,122) for i in range(50)]) + " " + "".join([chr(97,122) for i in range(3)]), "" ],
  ["Aléatoire", "".join([chr(97,122) for i in range(50)]) + " " + "".join([chr(97,122) for i in range(3)]), "" ],
  ["Aléatoire", "".join([chr(97,122) for i in range(50)]) + " " + "".join([chr(97,122) for i in range(3)]), "" ],
  ["Aléatoire", "".join([chr(97,122) for i in range(50)]) + " " + "".join([chr(97,122) for i in range(3)]), "" ],
  ["Aléatoire", "".join([chr(97,122) for i in range(50)]) + " " + "".join([chr(97,122) for i in range(3)]), "" ] ]
==


