
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/none.py

editor =: CodeEditor
editor.theme = dark
editor.language = python
editor.code ==
# write your code here
==



title = Tester votre code 

text==
Saisissez dans l'éditeur un code avec un doctest.
L'évaluation vous donnera le resulta du test.

exemple de code :
"""# n'oublier pas une chaine multiligne est inspectée par doctest pour y trouver des tests
>>> import math # Ici le test c'est pour savoir si il y a l'import math sur PlaTon :)
>>> math.pi 
3 
"""
Biensur ce test vas vous retourner un test incorrect. 
Quand cela ce passe bien rien n'est affiché !!!! 

==

form==
{{ editor|component }}
==

evaluator==
import doctest
import io
import sys

with open("student.py","w") as f:
    print(editor.code,file=f)
import student 

oldout=sys.stdout 
sys.stdout=io.StringIO()
doctest.testmod(student)
text= sys.stdout.getvalue()
sys.stdout = oldout 

grade = (100, f"Test result\n"+text)

==

