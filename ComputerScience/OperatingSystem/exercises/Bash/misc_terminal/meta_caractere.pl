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
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

author=Nicolas Borie
title=Méta-caractères * et ? en terminal

group =: RadioGroup

# GENERATE A RANDOM QUESTION
before==#|python|
import random
import subprocess

alphabet_size=5
max_len_word=8
nb_words=8

def aleaword(alphabet, max_len):
    w = ""
    len_word = random.randint(1, max_len)
    for i in range(len_word):
        w += chr(ord('a')+random.randint(0, alphabet-1))
    return w

def aleapattern(alphabet, max_len):
    w = ""
    len_word = random.randint(1, max_len-2)
    letters = [chr(ord('a')+i) for i in range(alphabet)] + ['*']*alphabet + ['?']*alphabet
    for i in range(len_word):
        w += random.choice(letters)
    return '*'+w+'*'

pattern = aleapattern(alphabet_size, max_len_word)

list_word = []
while len(list_word) < nb_words:
    w = aleaword(alphabet_size, max_len_word)
    if w not in list_word:
        list_word.append(w)

group.items = []
for w in list_word:
    group.items.append({"id": w, "content": w})

cmd1 = 'touch '+' '.join(list_word)
sp = subprocess.Popen(cmd1, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
cmd2 = 'ls '+pattern
sp = subprocess.Popen(cmd2, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
output = sp.communicate()[0].decode().replace(' ', '\n')

solution = []
if not 'cannot' in output:
    for w in output.strip('\n'):
        if w not in solution:
            solution.append(w)

# shuffle the items
random.shuffle(group.items)
==

text==#|markdown|
On se trouve dans un répertoire contenant les fichiers suivants:

<br>


    nborie@PLaTon:~$ ls
    {% for w in list_word %}{{ w }} {% endfor %}
    nborie@PLaTon:~$ ls {{ pattern }}

<br>

{% for w in solution %}
{{ w }} 
{% endfor %}
==

# PRESENT THE QUESTION TO THE STUDENT
form==
{{ group|component }}
==

# EVALUATE THE STUDENT ANSWER
evaluator==
S = group.selection
score = 0
feedback = '<span class="error-state animated pulse infinite">Bad answer</span>'

for item in group.items:
    item['css'] = ''
    if item['id'] == S:
        if S == R:
            item['css'] = 'success-border'
            score = 100
            feedback = '<span class="success-state animated pulse infinite">Good answer</span>'
        else:
            item['css'] = 'error-border'
    elif item['id'] == R:
        item['css'] = 'success-border animated pulse infinite'

grade = (score, feedback)
==
