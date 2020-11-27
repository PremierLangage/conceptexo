extends = /model/mathinput.pl

title = Développer une expression polynomiale

before ==
var('x') # crée le symbole x
P = randitem([exp(x), ln(1+x)])
Q = randitem([cos(x), sin(x)])
P1 = taylor(P, x, 0, 3)
Q1 = taylor(Q, x, 0, 3)
expr_poly = P*Q # version non développée
sol = (P * Q).expand() # version développée
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

