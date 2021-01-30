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
tag=système|gcc|Unix|terminal|version

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Votre réponse
inputbox.maxlength = 2
inputbox.appearance = outline

before==#|python|

==

title==#|markdown|
Quelle est la version de gcc ?
==

text==#|markdown|
On voudrait connaitre le numéro de version complet de l'utilitaire **gcc** 
installé sur les sandbox. Comme cet utilitaire est très sérieux et que son 
développement est assuré par des experts, ce numéro de version est composé 
de trois nombre séparés par des points. Le premier nombre est numéro de 
**version majeure**, le second est le numéro de **version mineure** et enfin 
le dernier entier désigne le **numéro de correctif**.

<br>

Pour cela, utiliser 
<a href="https://pl.u-pem.fr/filebrowser/demo/38096/" target="blank">
l'émulateur de terminal sur sandbox
</a>.

<br>

*Si le bouton valider ne fait rien, copier votre réponse dans le presse-papier, 
actualiser et recoller votre réponse avant de revalider.*

==

form==#|markdown|

<br>

{{ inputbox|component}}
==

evaluator==#|python|
import subprocess
from utils_bash import display_as_shell_this, frame_message

cmd = '''gcc --version | head -1'''
sp = subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
solution = sp.communicate()[0].decode().split(' ')[-1]
# errout = sp.stderr.decode()
# returncode = sp.returncode
student_ans = (inputbox.value).replace(' ', '').replace('\n', '')

if student_ans == solution:
    grade = (100, frame_message("C'est bien cela !", "ok"))
else:
    grade = (0, frame_message("Ce n'est pas la bonne réponse..."+solution, "error"))
==


