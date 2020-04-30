extends = /model/mathinput.pl

title = Calcul d'impédance

input.virtualKeyboards = electronics

before ==
var('R,L,omega', real=True, nonzero=True)
X1 = R + I * L * omega
X2 = R
sol = simplify(1/(1/X1 + 1/X2))
# h = expand_complex(X1/X2)
# h = X1/X2
# b = h.is_complex
==

text ==
Quelle est l'imépdance de R en parallèle avec R + L ?
$$ {{sol|latex}} $$
==

form ==
{{ input|component }}
==

evaluator ==
score = 0
score, _, feedback = eval_complex(input.value, sol, imaginary_unit="j", local_dict={"omega": omega, "R": R, "L": L})
==

