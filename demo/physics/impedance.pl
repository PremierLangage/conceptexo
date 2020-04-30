extends = /model/mathinput.pl

title = Calcul d'impédance

input.virtualKeyboards = electronics

before ==
var('R L omega', real=True)
X1 = R + I * L * omega
X2 = R*I
sol = simplify(1/(1/X1 + 1/X2))
h = X2.is_complex
==

text ==
{{h}}
$$ {{sol|latex}} $$
==

form ==
{{ input|component }}
==

evaluator ==
score = 0
feedback = str(latex2sympy(input.value, local_dict={"omega": omega}))
score, _, feedback = eval_complex(input.value, sol, imaginary_unit="j", local_dict={"omega": omega})
==

