
extends = editor.pl

maxattempt = 5

generate== #|py|
from generator import Generator
alphabet, suffix, automaton = Generator.suffix(3, 3)
==

title = Automates Suffixes
text ==
Pour cette question, on considère l'alphabet **Σ** = **{{ '{' }} {{ alphabet }} {{ '}' }}** .<br/>
Donnez un automate reconnaissant le langage **L1** = {{ '{' }}  mots se terminant par **{{ suffix }}** {{ '}' }} <br>
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}
==



