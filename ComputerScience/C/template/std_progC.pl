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
# This is a re-implementation of the standard template of programming exercice 
# of C language implemented after the experience of 2019-2020 during 
# summer 2020
#
# Change :
#    * tests has been renamed to checks_args_stdin
#    * use subprocess instead of use directly os and sys
#    * better use of css/javascript to display/hide feedback
#
#*****************************************************************************

@ std_progC_utils.py
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
from random import randint

# Some globals variables
nb_attempt=0

# Place here your favorite C compiler
compiler="gcc"
# PLace here the compilation flags
cflags=["-Wall", "-ansi"]
# Place here library flags
libflags=[]

# Place the construction of your tests inside the builder please 
# (that avoids an another call to eval or exec inside the grader)
# tests are placed inside a list stored in variable : checks_args_stdin
# each test must have the following shape :
# ["name of the test", [list of arguments of the test], stdin of the test ]
# During the test execution, subprocess will execute :
# ./prog [list of argument]  
# and a tube will place the content stdin inside the standard input of the
# process...
checks_args_stdin = [["Premier test exemple (1 et 1)", ["1"], "1"],
 ["Second test exemple (12 et -7)", ["12"], "-7"],
 ["Troisième test aléatoire", [str(randint(-100,100))], str(randint(-100,100)) ],
 ["Quatrième test aléatoire", [str(randint(-100,100))], str(randint(-100,100)) ],
 ["Cinquième test aléatoire lui aussi", [str(randint(-100,100))], str(randint(-100,100)) ] ]
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
    scanf("%d", &j);

    printf("Le carré de i = %d est %d\n", i, carre(i));
    printf("Le carré de j = %d est %d\n", j, carre(j));
    return 0;
}
==

evaluator==#|python|
import subprocess
from std_progC_utils import make_hide_block_on_click, terminal_code, subnlbybr

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

# Compile the teacher solution
compile_source("src_teacher.c", "teacher_prog", compiler, cflags, libflags)
# Compile the student proposition
returncode, spout, errout = compile_source("src_student.c", "student_prog", compiler, cflags, libflags)

# Compilation ok
if len(spout) + len(errout) == 0:
    grade_compil = 100
    text_compil = 'Compilation réussie'
    compil_state = 'success'
else:
    # Compilation Aborted
    if "error:" in errout:
        grade_compil = 0
        text_compil = 'Compilation échouée'
        compil_state = 'error'
    # So there must have some warning
    else:
        nb_w_compil = (spout+errout).count('warning')
        grade_compil = max(0, 100 - (nb_w_compil*10) )
        text_compil = 'Compilation réussie avec ' + str(nb_w_compil) + ' warning'
        if nb_w_compil > 1:
            text_compil += 's'
        compil_state = 'warning'

# begin of feedback
feedback = '<p style="margin-bottom: 5px;"><b><u>Compilation :</u> ' + str(grade_compil) + '%</b> '
if compil_state != 'success':
    feedback += '(cliquer au dessous pour dérouler les détails)</p>'
feedback += '<div class="' + compil_state + '-state" style="padding: 5px; border: 1px solid #155724 transparent;">'
if compil_state != 'success':
    feedback += make_hide_block_on_click("compil_ans", text_compil + ' avec flags ' + ' '.join(cflags), terminal_code(spout+errout), "")
else:
    feedback += make_hide_block_on_click("compil_ans", text_compil + ' avec flags ' + ' '.join(cflags), "C'était parfait, le compilateur n'a rien dit...", "")
feedback += '</div>'

# Tests
nb_good = 0
nb_bad = 0
grade_checks = 0

feedback_checks = ""

if compil_state != 'error':
    for test_c in checks_args_stdin:
        f_in=open("stdin_content", "w")
        f_in.write(test_c[2])
        f_in.close()
        # Use the teacher solution to generated expected output of the test
        command_args = ["./teacher_prog"] + test_c[1]
        sp = subprocess.run(command_args, stdin=open("stdin_content", "r"), stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=1)
        expected_ouput = sp.stdout.decode() + sp.stderr.decode() 
        rc_teacher = sp.returncode
        # Now execute the student programm
        command_args = ["./student_prog"] + test_c[1]
        sp = subprocess.run(command_args, stdin=open("stdin_content", "r"), stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=1)
        spout = sp.stdout.decode() + sp.stderr.decode()
        rc_student = sp.returncode

        if spout == expected_ouput:
            nb_good += 1
            feedback_checks += '<div class="success-state" style="margin: 2px;padding: 5px; border: 1px solid #155724 transparent;">'
            terminal_log = "Platon@debian~$> ./a.out " + " ".join(test_c[1]) + "\n"
            terminal_log += expected_ouput
            if len(test_c[2]) > 0:
                stdin_explain = "Contenu de l'entrée standard durant l'exécution : <br />"
                stdin_explain += subnlbybr(test_c[2])
                if test_c[2][-1] != '\n':
                    stdin_explain += "<br />"
            else:
                stdin_explain = ""
            feedback_checks += make_hide_block_on_click("details_check"+str(nb_good+nb_bad), test_c[0], stdin_explain + terminal_code(terminal_log), "")
            feedback_checks += '</div>'
        else:
            nb_bad += 1
            feedback_checks += '<div class="error-state" style="margin: 2px;padding: 5px; border: 1px solid #155724 transparent;">'
            term_tot = "Attendu : <br />"
            terminal_log = "Platon@debian~$> ./a.out " + " ".join(test_c[1]) + "\n"
            terminal_log += expected_ouput
            if len(test_c[2]) > 0:
                stdin_explain = "Contenu de l'entrée standard durant l'exécution : <br />"
                stdin_explain += subnlbybr(test_c[2])
                if test_c[2][-1] != '\n':
                    stdin_explain += "<br />"
            else:
                stdin_explain = ""
            term_tot += terminal_code(terminal_log)
            term_tot += "Obtenu : <br />"
            terminal_log = "Platon@debian~$> ./a.out " + " ".join(test_c[1]) + "\n"
            terminal_log += spout
            term_tot += terminal_code(terminal_log)
            feedback_checks += make_hide_block_on_click("details_check"+str(nb_good+nb_bad), test_c[0], stdin_explain + term_tot, "")
            feedback_checks += '</div>'

    grade_checks = (nb_good * 100) // (nb_good + nb_bad)
feedback += '<p style="margin-bottom: 5px; margin-top: 5px;"><b><u>Tests :</u> ' + str(grade_checks) + '%</b> (cliquer sur les tests pour afficher/réduire leurs détails)</p>'

feedback += feedback_checks

grade=((grade_compil*nb_good) // (nb_good + nb_bad), feedback)
==

tests %=
{
    "correct" : {
        "response" : {
            "editor.code" : "solution"
        },
        "grade" : 100,
    },
}
==
