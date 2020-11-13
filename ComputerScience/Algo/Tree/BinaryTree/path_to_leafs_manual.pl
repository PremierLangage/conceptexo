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

@ ../templates/utils_binary_tree.py
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

viewer =: GraphDrawer

editor =: CodeEditor
editor.theme = dark
editor.language = text
editor.code ==
==



before==#|python|
from random import choice, randint
from utils_binary_tree import random_binary_tree

Tree_exo = random_binary_tree(randint(8, 12), max_height=4)[0]
viewer.graph = Tree_exo.to_dot_code_BST_point()

soluce = Tree_exo.path_to_leafs()
==

author=Nicolas Borie
title=Lister de manière ordonnée les chemins racine-feuilles

text==
<style>
 .graph-viewer-component {
 pointer-events: none;
}
</style>

Voici un arbre binaire. L'arbre vide est représenté par un point, les feuilles 
sont donc les nœuds ayant à la fois un point pour fils gauche et fils droit.

<center>
{{ viewer|component }}
</center>



==

form==
{{ editor|component}}
==

evaluator==#|python|
form = """
<style>
.error-state{
   padding: 10px;
}
.success-state{
   padding: 10px;
}
</style>
"""

soluce_reduced = soluce.replace(' ', '')
while soluce_reduced[-1] == '\n':
    soluce_reduced = soluce_reduced[:-1]
code_student = editor.code.replace(' ', '')
while code_student[-1] == '\n':
    code_student = code_student[:-1]

if soluce_reduced == code_student:
    grade = (100, ''' <span class="success-state">Bravo, c'est exactement cela : </span><br><br>    '''+str(soluce.replace('\n', '<br>    ')))
else:
    grade = (0, ''' <span class="error-state">Désolé, vous avez fait une erreur, la réponse attendue était : </span><br><br>    '''+str(soluce.replace('\n', '<br>    ')))
==

