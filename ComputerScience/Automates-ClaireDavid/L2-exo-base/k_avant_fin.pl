extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = TD1 exo3 L4

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|

alphabet = "a,b"

#langage solution -- le nom solution est forcé par le template
solution = Automaton.parse('(a|b)*a(a|b)(a|b)(a|b)')


#message de l'énoncé décrivant le langage
message = "l'ensemble des mots dont la 4ème lettre à partir de la droite est un a"
==

#* Texte de l'énoncé
# ---
# ajouter {{ solution_view|component }} dans ce qui suit pour l'afficher
# l'automate minimisé du langage solution
text==
On considère l'alphabet $!\Sigma= \\{ {{ alphabet }} \\}!$ .<br/>
Donnez un automate reconnaissant {{ message }} .<br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==

























