#*****************************************************************************
#  Copyright (C) 2017 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
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

# author=Nicolas Borie

title=Assistant générateur de rapport de review de code
tag=review|code|relecture|validation|correction|évaluation|pairs

before==#|python|

# step index 
step = 0

# Les énoncés
texts=["## **Bienvenu sur l'assistant online d'aide à la génération de rapport pour la review "
       "de code en langage C.**\n<br />\n"
       "Commencez par vous présenter, précisez l'auteur du code reviewé ainsi qu'une description pour "
       "la production évaluée. Prennez votre temps pour valider pas à pas votre rapport mais "
       "n'actualiser la page à aucun moment, vous perdriez votre début de rapport et cela "
       "réinitialiserait le générateur à la première étape.",
       "## **Concision et propreté des productions en programmation**\n<br />\n"
       "<u>Objectifs :</u>"
       "<ul>"
       "<li>Concevoir des packages propres, les plus légers possibles et complets.</li>"
       "<li>Adopter des organisations de sources favorisant les recherches.</li>"
       "</ul><br />"
       "<b>Comment sont les productions transmises en terme de qualité, taille, "
       "structuration, organisation des répertoires et fichiers transmis pour "
       "la revue ?</b>",
       "## Avez-vous des derniers commentaires ou informations supplémentaires à donner ?"]

forms=['<table style="border-spacing: 30px; border-collapse: separate;">'
       '<tr><td>Votre <b>nom</b> (en tant que relecteur) </td><td> <input type=text id="form_nom" /> </td></tr>'
       '<tr><td>Nom de l\'<b>auteur</b> de la production </td><td> <input type=text id="form_author" /> </td></tr>'
       '<tr><td>Nom du code ou <b>projet</b> relu </td><td> <input type=text id="form_code" /> </td></tr>'
       '</table>',
       '<input type="radio" id="form_fail" name="crit1" value="fail1">'
       '<label for="fail1"> L\'auteur a laissé des éléments inutiles ou des fichiers mal identifiés dans ses contenus.</label><br>',
       'Commentaires ouverts : <br /> '
       '<textarea id="form_comments" rows="6" cols="80" ></textarea>']

report=""

text='<b><span style="color: darkred;">Étape '+str(step+1)+'/9</span></b><br/><br />\n\n'+texts[step]
form=forms[step]
==

evaluator==#|python|
from datetime import date

mois=["janvier", "février", "mars", "avril", 
      "mai", "juin", "juillet", "août", 
      "septembre", "octobre", "novembre", "décembre"]

if step == 0:
    report += "# Rapport de relecture de code\n\n"
    if len(response['code']) > 0:
        report += "Production soumise à la relecture : **"+response['code']+"**\n"
    if len(response['author']) > 0:
        report += "Projet/code produit par **"+response['author']+"**\n"
    report += "Relecture opérée"
    if len(response['nom']) > 0:
        report += " par **"+response['nom']+"**"
    report += " le "+str(date.today().day)+" "+mois[date.today().month - 1]+" "+str(date.today().year)
    report += "\n\n"
    step += 1
    text='<b><span style="color: darkred;">Étape '+str(step+1)+'/9</span></b><br/><br />\n\n'+texts[step]
    form=forms[step]
    grade=(-1, " ")
elif step == 1:
    step += 1
    text='<b><span style="color: darkred;">Étape '+str(step+1)+'/9</span></b><br/><br />\n\n'+texts[step]
    form=forms[step]
    grade=(-1, " ")
else:
    if len(response['comments']) > 0:
        report += "## derniers commentaires :\n\n" + response['comments']
    text=""
    form=""
    grade=(100, "C'est fini !<br /><br /><u><b>Rapport généré en markdown :</b></u><br /><br /><pre>"+report+"</pre>")

==

# the two following keys will be overwriten over and over...
text=""
form=""

