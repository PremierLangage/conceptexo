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

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponse
inputbox.maxlength = 2
inputbox.appearance = outline

before==#|python|

==

title==
Quel est le système d'exploitation ?
==

text==
Essayer de determiner quel est le système d'exploitation utilisé dans les sandbox docker de PLaTon. 
==

form==
{{ inputbox|component}}
==

evaluator==
if r == inputbox.value:
    grade = (100, '<span class="success-state">Good 👏👏👏</span>')
else:
    grade = (0, '<span class="error-state">Bad answer 👎👎👎</span>')
==


