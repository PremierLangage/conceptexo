extends = /model/mathinput.pl

title = Développement

before ==
var('x')

P = rand_int_poly(1, 2, 5, x)
Q = rand_int_poly(1, 2, 5, x)
expr = P * Q
==

text = Développer $${{expr.latex}}.$$

evaluator==
var('x')
score, _, feedback = eval_poly(input.value, expr, x, form="expanded")
==

