extends = /ComputerScience/automaton/templates/base.pl

maxattempt = 3

before== #|py|
from automaton import Automaton
score = -1
attempt = 0
maxattempt = int(maxattempt)
deterministic = True

if 'generate' not in globals():
    raise Exception('You must define a script "generate"')

exec(generate)

editor = Automaton.editor()
viewer = Automaton.viewer(automaton)
alphabet = ', '.join(list(alphabet))
==

evaluator== #|py|
from automaton import Automaton
if attempt >= maxattempt:
    grade = (score, '<p class="warning-state">L\'automate attendu était le suivant:</p>')
else:
    attempt += 1
    match, error = Automaton.compare(automaton, editor)
    if (error or not match) and attempt >= maxattempt:
        grade = (score, '<p class="warning-state">L\'automate déterministe suivant était une réponse possible à cette question.</p>')
    elif error:
        grade = (-1, f'<p class="warning-state">{error}</p>')
    elif match is True:
        score = 100
        infos, _ = Automaton.informations(editor)
        deterministic = infos['deterministic']
        grade = (score, ' ')
    else:
        score = 0
        grade=(score, '<p class="error-state">L\'automate que vous avez construit ne correspond pas à une réponse attendue.</<p>')
==

form ==
{% if attempt >= maxattempt %}
{{ viewer|component }}
{% endif %}

{% if score == 100  %}
    <p class="success-state">Bravo l'automate que vous avez construit est une réponse acceptable.</p>
    {% if not deterministic %}
         <p class="success-state">L'automate déterministe suivant était aussi une réponse acceptable :</p>
        {{ viewer|component }}
    {% endif %}
{% endif %}

{{ editor|component }}

<script>
    function onReadyPL(nodes) {
        const submit = nodes.submit;
        submit.attr("disabled", ({{ attempt }} >= {{ maxattempt }}) || {{ score }} == 100);
    }
</script>
==




