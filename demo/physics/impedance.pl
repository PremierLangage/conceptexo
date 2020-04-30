extends = /model/mathinput.pl

title = Calcul d'impédance

input.virtualKeyboards = electronics

before ==
var('K,L,omega', real=True, nonzero=True)
X1 = K + I * L * omega
X2 = K
sol = simplify(1/(1/X1 + 1/X2))
sol = K * (I + L)
# h = expand_complex(X1/X2)
# h = X1/X2
# b = h.is_complex
b = srepr(sol)
c = srepr(latex2sympy(latex(sol),  local_dict={"i": I, "omega": omega, "K": K, "L": L}))
==

text ==
{{b}}
Quelle est l'imépdance de R en parallèle avec R + L ?
$$ {{sol|latex}} $$
{{c}}
==

form ==
{{ input|component }}
==

evaluator ==
score = 0
ans = latex2sympy(input.value,  local_dict={"j": I, "omega": omega, "R": R, "L": L})
feedback = str(srepr(ans))
#score, _, feedback = eval_complex(input.value, sol, imaginary_unit="j",)
==

