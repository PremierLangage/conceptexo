# ***************************************************************************
#                     PATRON D'EXERCICE TROUVE FAUTE 
#
# Des phrases arrivent aléatoirement devant l'apprenant. Ce dernier doit
# localiser la faute d'orthographe ou alors cliquer sur un bouton pour 
# dire qu'il pense que la phrase est correcte.
#
# Pour chaque règle d'orthographe, l'apprenant doit valider son apprentissage
# en appliquant la règle correctement 5 fois d'affiléée (changer la valeur de 
# la variable consecutive_to_validate). Si, au contraire, vous préférez que
# l'apprenant valide un certain nombre de bonne réponse (pas forcément 
# consécutives), il vous faut alors changer la valeur de nb_good_to_validate 
# pour un objectif entier et positif.
#
# Pour toute suggestion et/ou correction, contacter un informaticien ou
# l'auteur à son adresse mail : nicolas dot borie at u-pem dot fr
#
# ***************************************************************************

@ /utils/sandboxio.py
@ /Languages/French/Orthographe/trouve_faute_utils.py
grader =@ /grader/evaluator.py

title=Définissez un titre en héritant de ce template
author=Nicolas Borie

file_list==
[]
==

nb_good_to_validate=-1
consecutive_to_validate=5
recall_rule=False

text==

==

form==
<center>
{{ selectable|component}}
</center>
==

builder==#|python|
import sys
import json
from trouve_faute_utils import parse_file, TrouveFauteExo

if __name__ == "__main__":
    with open(sys.argv[1],'r') as f:
        context = json.load(f)

    list_filename = eval(context['file_list'])
    
    n = len(list_filename)
    text_exo="Vous devrez corriger des phrases illutrant "
    if (n >= 2):
        text_exo += str(n)+" règles orthgraphiques."
    else:
        text_exo += "une règle d'orthgraphe. "
    text_exo += "Pour chacune des phrases, vous devrez selectionner le mot portant "
    text_exo += "l'erreur d'orthographe ou bien cliquer sur le bouton phrase correcte.\n"

    if (eval(context['recall_rule'])):
        if (n >= 2):
            text_exo += "<br /><br /><u>Voici les règles sur lesquelles nous allons travailler :</u><br /><br />"
        else:
            text_exo += "<br /><br /><u>Voici la règle sur laquelle nous allons travailler :</u><br /><br />"
    


    for name in list_filename:
        context['rules'] = []
        rule = parse_file(name)
        context['rules'].append(rule)
        if (eval(context['recall_rule'])):
            text_exo += '<div style="padding:4px; border:4px solid #BBFFBB;">'
            text_exo += '<div style="padding:10px; background-color:#BBFFBB;">'
            text_exo += "<h2>"+rule._name+"</h2><br />"
            text_exo += "<p>"+rule._description+"</p>"
            text_exo += '</div></div><br />'
    
    EXO = TrouveFauteExo(context['nb_good_to_validate'], context['consecutive_to_validate'])

    # for parsing debug
    # for d in context['rules']:
    #     for s in d['sentences']:
    #         text_exo += str(s)+"<br /><br />"

    context['text'] = text_exo

    with open(sys.argv[2], 'w+') as f:
        json.dump(context, f)
    sys.exit(0)

==

selectable =: Text
selectable.text = 
selectable.mode = word

evaluator==#|python|
import random

# Grading time if relevant
if len(text) >= 10:
    text = ""
    nb_question = 0
    nb_good = 0
    nb_consecutive = 0
    validate = False
else:
    # time to grade
    nb_question += 1
    if status == 1:
        if len(selectable.selections) == 0:
            q_result=True
        else:
            q_result=False
    else:
        if [e['index'] for e in selectable.selections] == rules[index_rule]['sentences'][index_sentence][3]:
            q_result=True
        else:
            q_result=False

    selectable.selections = []
    
    if q_result:
        nb_good += 1
        nb_consecutive += 1
        if 'valid_index' in rules[index_rule]:
            rules[index_rule]['valid_index'].append(index_sentence)
    else:
        nb_consecutive = 0

# chose next sentence if relevant else finalize grading
if not validate:

    # rule selection
    index_rule = random.randint(0, len(rules)-1)
    while ('valid' in rules[index_rule]) and (rules[index_rule]['valid']):
        index_rule = random.randint(0, len(rules)-1)

    # good/bad sentences
    if random.randint(0,1) == 1:
        status = 0
    else:
        status = 1

    # sentences selection
    index_sentence = random.randint(0, len(rules[index_rule]['sentences'])-1)
    while ('valid_index' in rules[index_rule]) and (index_sentence in rules[index_rule]['valid_index']):
        index_sentence = random.randint(0, len(rules[index_rule]['sentences'])-1)

    selectable.text = rules[index_rule]['sentences'][index_sentence][status]
    grade = (-1, " ")
else:
    selectable.text = ''
    final_grade = int(nb_good*100.0 / nb_question)
    grade = (final_grade, "Félicitation, vous validez avec " + str(final_grade) + " de réussite.")

==







