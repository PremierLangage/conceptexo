
# THIS EXAMPLE IS DEPRECATED SINCE THE COMPONENT WILL BE RENAMED SOON

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py


selectable =: Text
selectable.text = The quick brown fox jumps over the lazy dog.
selectable.mode = word
# le caractère séparateur devrait êêtre espace par défaut.

before==
selectable.separator = ' '
==

title==
Text Select Component
==

text==
Select the words containing **o**
==

form==
{{ selectable|component}}
==

evaluator==
textslected=''
for e in selectable.selections:
    textslected +=  e['content']
    e['css'] = "error-state"
    if e['index'] in indices:
        e['css'] = "success-state"
        indices = [i for i in indices if i != e['index']]
    else:
        indices.append(e['css'])

if len(indices) == 0:
    score = 100
    msg = '<span class="success-state animated pulse infinite">Good answer<span>'
else:
    score = 0
    msg = '<span class="error-state animated pulse infinite">Bad answer</span>'

msg+= textselected
grade = (score, msg)
==
