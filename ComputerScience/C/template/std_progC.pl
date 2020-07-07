#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

#*****************************************************************************
#
# This is a re-implementation of the standard standard template of programming 
# exercice of C language.
#
# Change :
#    * tests has been renamed to checks_args_stdin
#    * use subprocess instead of use directly os and sys
#
#*****************************************************************************

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title=Standard C Programming exercise template (summer 2020)

text==
**This text shoud be overwrited when inheriting from the Standard C 
Programming exercise template.**


In this template example, we ask the user to programm a squarre function.
==

editor =: CodeEditor
editor.theme=dark
editor.language=c
# editor.height=350px

editor.code==#|c|
/* write your code here */
/* For testing purpose, we did place here a square function on integers... */
int carre(int n){
    return n*n;
}
==

before ==#|python|
# Some globals variables
nb_attempt=0

# Place here your favorite C compiler
compiler="gcc"
# PLace here the compilation flags
cflags=["-Wall", "-ansi"]
# Place here library flags
libflags=[]
==


form==
{{ editor|component }}
==

code_before==#|c|
#include <stdio.h>
#include <stdlib.h>
==

solution==#|c|
int carre(int p){
    return p*p;
}
==

code_after==#|c|
int main(int argc, char* argv[]){
    int i, j;
    
    i = atoi(argv[1]);
    scanf(%d, &j);

    printf("Le carré de i = %d est %d\n", i, carre(i));
    printf("Le carré de j = %d est %d\n", j, carre(j));
    return 0;
}
==

evaluator==#|python|
import subprocess

# Pre-process before executing the checks
def prepare_code_to_file(src_code, filename):
    """
    Place inside file named `filename`
    """
    src_final = code_before
    src_final += "\n\n"
    src_final += src_code
    src_final += "\n\n"
    src_final += code_after
    src_final += "\n\n"
    with open(filename, 'w') as f:
        f.write(src_final)

# The two file to proceed the checks
prepare_code_to_file(editor.code, "src_student.c")
prepare_code_to_file(solution, "src_teacher.c")

def compile_source(src_name, prog_name, compiler, cflags=["-Wall", "-ansi"], libflags=[]):
    """
    compile the source in argument and return 
    """
    command_args = [compiler, src_name, "-o", prog_name] + cflags + libflags
    sp = subprocess.run(command_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    spout = sp.stdout.decode()
    errout = sp.stderr.decode()
    returncode = sp.returncode
    return (returncode, spout, errout)

compile_source

grade=(100,"<code><pre>" + code_before + editor.code + code_after + "</code></pre>")
score, feedback = grade
==

checks_args_stdin==#|python|
[["Premier test exemple (1 et 1)", "1", "1"],
 ["Second test exemple (12 et -7)", "12", "-7"]]
==



