
@ /utils/sandboxio.py
@ /ComputerScience/python/AP1-1920/templates/generic/builder.py
@ /ComputerScience/python/AP1-1920/templates/generic/grader.py
@ /ComputerScience/python/AP1-1920/templates/generic/utils/test.py
@ /ComputerScience/python/AP1-1920/templates/generic/utils/mockinput.py
@ /grader/utils/testgroup.html
@ /grader/utils/testitem.html

title = <em>(Pas de titre défini)</em>
text = <em>(Pas d'énoncé défini)</em>

# création de l'éditeur de code
editor1 =: CodeEditor
editor1.language = python
editor1.cid = py_editor_0
editor1.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==

# le formulaire de l'exercice contient uniquement l'éditeur
form==
{{editor1|component}}
==

# définition de la procédure de validation
grader==
begin_test_group("L'exercice n'a pas défini de procédure de validation.")
==



