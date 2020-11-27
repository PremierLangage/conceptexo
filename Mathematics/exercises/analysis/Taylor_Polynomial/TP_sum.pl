extends = /model/mathinput.pl

title = Développer une expression polynomiale

before ==
var('x') # crée le symbole x
P = randitem([exp(x), ln(1+x)])
Q = randitem([cos(x), sin(x)])
P1 = P(x).series(0, 1)
Q1 = Q(x).series(0, 1)
expr_poly = P1*Q1 # version non développée
sol = (P1 * Q1).expand() # version développée
==

text ==
Développer $${{ expr_poly|latex }}.$$
==

evaluator ==
score, error = eval_poly(input.value, sol, var="x", form="expanded")
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

