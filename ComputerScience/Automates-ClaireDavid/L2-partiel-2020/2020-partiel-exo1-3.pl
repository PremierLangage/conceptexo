extends = ../templates/new_editor-L2.pl

#* titre de l'exercice
title = exo regex

#* Ajouter ici l'automate solution et autres variables de l'exo
generate== #|py|

#pour definir le type de réponse attendue (automaton par défaut)
answer_type = "simple-regex"

alphabet = "a,b"

#langage solution -- le nom solution est forcé par le template
solution = Automaton.parse('(a|b)*(bab|bb)(a|b)*')

alphabet = "a,b"
message = "l’ensemble des mots qui contiennent le facteur bab ou le facteur bb."
==

title = Partiel 2020 Exo1-3
text ==
On considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez une expression reconnaissant le langage correspondant à {{ message }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) !
</p>
{% endif %}
==
























