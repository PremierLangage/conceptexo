#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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
@ /ComputerScience/OperatingSystem/templates/utils_bash.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

author=Nicolas Borie
tag=système|Unix|terminal

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponse
inputbox.maxlength = 2
inputbox.appearance = outline

before==#|python|

==

title==#|markdown|
Quel est le nom de l'utilisateur des sandox ?
==

text==#|markdown|
Quand un exercice s'exécute en sandbox, ça lance un programme. 
L'utilisateur **root** par exemple peut exécuter des tâches de fond sur 
les systèmes de type Unix. Comment s'appelle l'utilisateur qui exploite 
les sandbox ? Attention, le `username@PLaTon:~$>` est un leurre graphique
html car les sandbox ne connaissent pas les étudiants. Django, par contre,
sait qui envoie quoi à l'exécution via une API Rest (plutôt étudiée en 
master ces API)...

<br>

Pour cela, utiliser 
<a href="https://pl.u-pem.fr/filebrowser/demo/38096/" target="blank">
l'émulateur de terminal sur sandbox
</a>.

==

form==#|markdown|

<br>

{{ inputbox|component}}
==

evaluator==#|python|
import subprocess
from utils_bash import display_as_shell_this, frame_message

cmd = '''whoami'''
sp = subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
solution = sp.communicate()[0].decode().replace(' ', '').replace('\n', '')
# errout = sp.stderr.decode()
# returncode = sp.returncode
student_ans = (inputbox.value).replace(' ', '').replace('\n', '')

if student_ans == solution:
    grade = (100, frame_message("C'est bien cela !", "ok"))
else:
    grade = (0, frame_message("Ce n'est pas la bonne réponse...", "error"))
==


