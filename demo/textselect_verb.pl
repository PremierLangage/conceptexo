@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

title = Repérage des verbes

text ==
Identifier le verbe conjugué la phrase ci-dessous.
==

txtsel =: Text
@ /utils/textselect.py [customtext.py]
txtsel.decorator = CustomText

txtsel.selectable % true

before==
txtsel.load("Artur a horreur de la marche à pied.")
==

form==
{{ txtsel|component}}
==
