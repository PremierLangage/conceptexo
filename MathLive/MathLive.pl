@ lib:/utils/sandboxio.py
@ lib:/builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

title = Démo MathLive

mathfield=latex

before =

text =

form=@ form_MathLive.html

evaluator ==
ast=eval(answer['1'])
grade=(100,ast)
==



