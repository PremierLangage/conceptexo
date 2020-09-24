#*****************************************************************************
#  Copyright (C) 2017 Dominique Revuz
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

title=Écrire une fonction qui calcule les valeurs d'un polynome
tag=function|return|polynome|evaluation

extends=/ComputerScience/C/template/stdsandboxC.pl

editor.code==
double polynome(...){
  ...
}
==


code_before==

==

code_after==

#include <stdio.h>
#include <stdlib.h>    
    
int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);
  int c = atoi(argv[3]);

  printf("%f\n", polynome(a, b, c));
  return 0;
}
==


before ==#|python|
from random import randint, choice

nb_attempt=0
compiler="gcc"
cflags=["-Wall", "-ansi"]
libflags=[]

def codeandtextpoly():
    """
    je veux une fonction de 3 variables a,b,c
    qui calcule une polynome en trois variables
    disont que il y a 3 éléments de la forme 
        + coef * puissance(a,x) * puissance(b,x) * puissance(c,x)
    avec somme des x  varriant de 0 à 4

    Elle retourne deux strings qui sont la version code et text du même polynome 
    code,text
    coe doit être utilisée dans la solution
    et text dans l'énoncé 
    """
    l=[("(12 - (2 + a)*b*b*b + 7*b*c*c)" , "12 - (2 + a)b^3 + 7bc^2"),
    ("(3*a*b*c - b*b*b + 5*a*a*c*c)", "3abc - b^3 +5a^2c^2"),
    ("(b*b-4*a*c)"," b^2-4ac"),
    ("(a*a*b*b*c*c+1)"," a^2b^2c^2 + 1"),
    ("(5*a*a*a + 6*a*b - 7*c + 21)", "5a^3 + 6ab - 7c + 21"),
    ("(a-3)*(b*b+2)*(c-8)","(a - 3)(b^2 + 2)(c - 8)"),
    ]
    return choice(l)

code, text = codeandtextpoly()

solution="\ndouble polynome(int a, int b, int c){\nreturn "+code+";\n}\n"
text="""Écrire une function *polynome* qui prend en argument 3 entiers *a*, *b* et *c* et qui retourne l'évaluation du polynome:\n\n\t $%{}%$ """.format(text)

text+="\n\n <br /> {{ editor|component }} "
==

checks_args_stdin==
[["Test basique", ["0", "0", "0"], ""],
 ["Test aléatoire", [str(randint(-10, 10)) for i in range(3)], ""],
 ["Test aléatoire", [str(randint(-10, 10)) for i in range(3)], ""],
 ["Test aléatoire", [str(randint(-10, 10)) for i in range(3)], ""],
 ["Test aléatoire", [str(randint(-10, 10)) for i in range(3)], ""]]
==




