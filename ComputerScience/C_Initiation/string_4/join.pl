

author=

difficulty=3

title= Simule Join 

tag=string|char|LectureChar|EcritureChar

extends=/ComputerScience/C/template/stdsandboxC.pl

text==

Ecrire une fonction de prototype `int join(char *insert, char sep)` 
qui reçoit l'adresse d'une chaine `insert` et un caractère `sep`.

Cette fonction lit l'entrée standard (ce qui est tapé au clavier en général) et la recopie sur la sortie standard en remplaçant
 les occurrences de `sep` par la chaine `insert`. 
    
    Exemple :  
        "Ceci est l'entrée standard."   
        join("XXX",' ')  
        affiche   
        "CeciXXXestXXXl'entréeXXXstandard."   
    
<b>Indice :</b> 
<ul>
<li>la fonction de prototype `int getchar(void)`, de stdio.h, permet de lire un caractère 
isolé depuis l'entrée standard (ici le clavier) et <b>retourne -1 en fin d'entrée</b>.</li>
<li>la fonction de prototype `int putchar(int c)`, de stdio.h, affiche un caractère sur
la sortie standard (ici l'écran). 
Par exemple putchar('a') entraîne l'affichage de la lettre 'à' à l'écran.</li> 
</ul>
==
codebefore==

#include <stdio.h>

==

editor.code==
void join(char *s, char sep){
/* A compléter */
}


==

solution==
void join(char *s, char sep){
    int c;
    while ((c=getchar()) != -1){
        if (c==sep) printf(s);
        else putchar(c);
    }
}
==

codeafter==

int main(int c, char **argv){
    join(argv[1],argv[2][0]);
    return 0;
}
==


tests==
[ 
["simple éxécution", "XXX o","toto How! How! "],
["Sans occurences", "Hache h","toto How! How! "],
["Que des occuoccurences", "Bing! b","bbbbbb"],
]

==


















