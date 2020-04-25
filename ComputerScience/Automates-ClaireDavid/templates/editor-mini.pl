## A finir -- ça ne marche pas

extends = editor-L2.pl

#* feedback when the automaton is non deterministic or not complete.
feedback_nondet = <p class="warning-state">L'automate correspond au langage mais n'est pas deterministe complet.</p>

#* feedback when the automaton is not minimal.
feedback_mini = <p class="warning-state">L'automate correspond au langage. Il est det complet mais n'est pas minimal.</p>

evaluator== #|py|
from automaton import Automaton

if attempt >= maxattempt: # timeout
    grade = (score, feedback_timeout)
else:
    attempt += 1
    match, error = Automaton.compare(viewer, editor)
    infos_editor , _ = Automaton.editor_properties(editor)
    info_viewer , _ = Automaton.parse(viewer).properties()
    if  attempt >= maxattempt and (error or not match): # error or no match after timeout
        grade = (score, feedback_timeout)
    elif error:
        grade = (-1, feedback_syntax_error.format(error))
    elif match is True :
    ## ça a l'air de planter ici
        if not (infos_editor["deterministic"] and infos_editor["complete"]):
            score = 0 
            grade(score, feedback_nondet)
    ## ou bien c'est ici...
        elif len(viewer["states"]) == len(editor["states"]) :
            score = 0
            grade = (score, feedback_non_mini)
        else :
            score = 100
            grade = (score, feedback_nomatch)
    else:
        score = 0
        grade=(score, feedback_nomatch)
==





