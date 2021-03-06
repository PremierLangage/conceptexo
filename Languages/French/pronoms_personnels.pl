@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

title==
Reconnaître les pronoms personnels
==

text==
Sélectionner tous les pronoms personnels apparaissant dans cet extrait des 
paroles de la chanson *Toi + moi* de *Grégoire*.

---

==


selectable =: Text
selectable.text== 
Toi plus moi, plus eux plus tous ceux qui le veulent.
Plus lui plus elle plus tous ceux qui sont seuls. 




Allez venez et entrez dans la danse. 
Allez venez, laissez faire l'insouciance. 
A deux a mille je sais qu' on est capable. 
Tout est possible tout est réalisable. 
On peut s' enfuir bien plus haut que nos rêves. 
On peut partir bien plus loin que la grève. 
==
selectable.selectable % true

before==
==

form==
{{ selectable|component}}
==

evaluator==

pronoms = ['Toi', 'moi,', 'eux', 'lui', 'elle', 'je', 'on', 'On', 's\'']
found = 0
error = 0

for e in selectable.selections:
    if e['content'] in pronoms:
        e['css'] = "success-state"
        found += 1
    else:
        e['css'] = "error-state"
        error += 1

if found == 10 and error == 0:
    score = 100
    msg = '<span class="success-state">Bravo, vous avez trouvé tous les pronoms personnels !</span>'
else:
    score = max([0, 10*(found - error)])
    nb_error = (10 - found) + error
    if nb_error > 1:
        msg = '<span class="error-state">Il y a {} erreurs...</spam>'.format(nb_error)
    else:
        msg = '<span class="error-state">Il y a 1 seule erreur...</spam>'

grade = (score, msg)
==

extracss==
<style>
.exercise__instructions, .exercise__feedback {
    margin-bottom: 16px;
}
</style>
==








