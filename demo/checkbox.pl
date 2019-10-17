@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]
@ /utils/checkbox.py [checkbox.py]

title = Question à choix multiples (checkbox)

checkbox =: CheckboxGroup
checkbox.decorator = Checkbox

before ==
checkbox.loadContent(["Paris","Bruxelles","Lyon","Genève"])
checkbox.shuffle()
==

text = Parmi les villes suivantes, lesquelles sont en France ?

form = {{ checkbox|component }}

evaluator ==
grade = checkbox.evalByContent(["Paris","Lyon"])
==

