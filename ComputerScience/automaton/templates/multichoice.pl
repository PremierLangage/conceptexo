extends = base.pl

title= 
text= 
form ==
{{ viewer|component }}
{{ checkbox|component }}
==


before== #|py|
from automaton import Automaton
from generator import Generator

if 'generate' not in globals():
    raise Exception('You must define a script "generate"')

exec(generate)

if 'viewer' not in globals():
    raise Exception('The script "generate" must define a variable "viewer" which is an automaton')

dfa = Automaton.parse(viewer)
viewer = Automaton.viewer(dfa)
checkbox, answers = Generator.multi_choice_question(dfa)
==

evaluator== #|py|

from evaluator import Evaluator

score, max_score = Evaluator.eval_multi_choice_question(
    checkbox,
    answers,
    withanswer=True
)
checkbox.disabled = True

if score == max_score:
    grade = (100, '<p class="success-state">Bonne réponse</p>')
else:
    grade = ((score / max_score) * 100, f"<p class='warning-state'>{score} / {max_score}</p>")
==


