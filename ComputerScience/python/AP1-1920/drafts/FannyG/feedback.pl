
# récupère toutes les éval d'une copie et donne un retour


@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]


enonce = Quel âge avez-vous ?
title = Feedback evaluation {{enonce}}
text  = 


before ==#|python|
evals ={
    {
        "note": 50
    },
    {
        "note": 25
    },
    {
        "note": 75
    },
}
==


form  == #|html|

==


evaluator ==#|python|
grade = (100, "")
==
