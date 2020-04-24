
# CONTRACTS FOR FILES WHICH EXTENDS THIS TEMPLATE
#! linter:require:generate::str

extends = base.pl

@ /utils/sandboxio.py

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Answer
inputbox.maxlength = 50
inputbox.appearance = outline

#* Maximum number of attempts before showing the right answer.
maxattempt = 3

#*
#*  This script must define the following variables:
#*   
#*  **viewer** => an automaton in one of the accepted formats (string, regex, object...)
#*               This automaton is considered as the answer and it will be presented to the student at the end.
#*  Example
#*```python
#*  generate==
#*  viewer = '''
#*      #states
#*       S0
#*       S1
#*       #initials
#*       S0
#*       #accepting
#*       S1
#*       #alphabet
#*       a
#*       b
#*       #transitions
#*       S0:a>S1
#*       S1:a>S1
#*       S1:b>S0
#*  '''
#*  ==
#*  ```
#*
generate % null


#* feedback shown after a good answer.
feedback_match = 
#* feedback shown after a bad answer.
## XXX
feedback_nomatch = <p class="error-state">L'expression que vous avez donnéé ne correspond pas à une réponse attendue.</p>
#* feedback shown after a timeout.
feedback_timeout = <p class="warning-state">L'automate suivant était une réponse possible à cette question.</p>
#* feedback shown for a syntax error. {0} is replaced by the occured error
feedback_syntax_error = <p class="warning-state">{0}</p>


#* override this key to change the text shown after a good answer.
## XXX
form_success== #|html|
<p class="success-state">Bravo l'expression que vous avez donnée est une bonne réponse.</p>
== 

#* override this key to change the instructions at the bottom of the editor.
form_instructions== #|html|
<p>
Syntaxe: Ne mettez pas les . de concaténation mais seulement + et *
</p>
==

# HTML FORM

title= PLEASE OVERRIDE THE KEY **title=** TO CHANGE THIS TEXT

text= PLEASE OVERRIDE THE KEY **text=** TO CHANGE THIS TEXT

form== #|html|
<!-- TIMEOUT VIEW -->
<!--{% if attempt >= maxattempt %}
{{ viewer|component }}
{% endif %}
-->

<!-- SUCCESS VIEW -->
{% if score == 100  %}
{{ form_success }}
{% endif %}

<!-- INPUT BOX -->
{{ inputbox|component}}

<br>

<!-- INSTRUCTIONS VIEW -->
{{ form_instructions }}

<script>
    /**
    * This function is called by the platform once the exercice is loaded.
    * @param nodes an object containing a reference to the nodes of the page (title, text, form, actions, submit...)
    */
    function onReadyPL(nodes) {
        const submit = nodes.submit; // a reference to the submit button
        // hide submit button if needed.
        submit.attr("disabled", ({{ attempt }} >= {{ maxattempt }}) || {{ score }} == 100);      
    }
</script>
==

before== #|py|
import random

from automaton import Automaton
from generator import Generator

score = -1
attempt = 0
maxattempt = int(maxattempt)

# CREATION OF THE AUTOMATON EDITOR
# THE PROPERTIES OF THE EDITOR CAN BE CHANGED INSIDE 'generate' SCRIPT
editor = Automaton.editor()
editor.debug = False
editor.editorHeight = "500px"

if 'generate' not in globals():
    raise Exception('You must define a script "generate"')

exec(generate)

if 'viewer' not in globals():
    raise Exception('The script "generate" must define a variable "viewer" which is an automaton')

viewer = Automaton.viewer(viewer)
==

evaluator== #|py|
from automaton import Automaton
from generator import Generator

student_answer = Generator.regex(inputbox.value, True)

if attempt >= maxattempt: # timeout
    grade = (score, feedback_timeout)
else:
    attempt += 1
    match, error = Automaton.compare(viewer, student_answer)
    if  attempt >= maxattempt and (error or not match): # error or no match after timeout
        grade = (score, feedback_timeout)
    elif error:
        grade = (-1, feedback_syntax_error.format(error))
    elif match is True:
        score = 100
        grade = (score, feedback_match)
    else:
        score = 0
        grade=(score, feedback_nomatch)
==





