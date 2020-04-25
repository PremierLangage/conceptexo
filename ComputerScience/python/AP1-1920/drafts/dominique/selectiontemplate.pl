
@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

#! linter:title:str

#! linter:text:
#! linter:textdelaselection:

text= Choisir les pronoms 
title=


selectable =: Text
selectable.selectable % true 


mots = ['toi', 'moi', 'eux', 'lui', 'elle', 'je', 'on', 's\'']


textdelaselection==
Toi plus moi, plus eux plus tous ceux qui le veulent.  <br/>
Plus lui plus elle plus tous ceux qui sont seuls. 




Allez venez et entrez dans la danse. 
Allez venez, laissez faire l'insouciance. 
A deux a mille je sais qu' on est capable. 
Tout est possible tout est réalisable. 
On peut s' enfuir bien plus haut que nos rêves. 
On peut partir bien plus loin que la grève. 
==




before==

selectable.text=textdelaselection

matching=0
for m in textdelaselection.split(" "):
    if m in mots:
        matching += 1

text +=str( textdelaselection.split(" "))
==

form==
{{ selectable|component}}
==

evaluator==

def cleanIt(s):



found = 0
error = 0

for e in selectable.selections:
    clean = cleanIt( e['content'])
    if clean in mots:
        e['css'] = "success-state"
        found += 1
    else:
        e['css'] = "error-state"
        error += 1

if found == matching and error == 0:
    score = 100
    msg = '<span class="success-state">Bravo, vous avez trouvé tous les pronoms personnels !</span>'
else:
    score = max([0, matching*(found - error)])
    nb_error = (matching - found) + error
    if nb_error > 1:
        msg = '<span class="error-state">Il y a {} erreurs...</spam>'.format(nb_error)
    else:
        msg = '<span class="error-state">Il y a 1 seule erreur...</spam>'
    msg = '<span class="error-state">Il y a {} erreurs...</spam>'.format(nb_error)
grade = (score, msg)
==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}
</style>
==









