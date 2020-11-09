extends = /model/math/frac.pl

title = Calcul d'une expression numérique

before ==
a = randint(2, 5)
b = randint(2, 5)
c = randitem(2, 5)
s = randitem("+", "-")

expr0 = f"({a}**2 {s} {b})/{c}"
expr = str2latex(expr0)
sol = str2sympy(expr0)

==

text ==
Calculer l'expression $! \displaystyle {{expr}} !$ en l'écrivant sous la forme d'un entier ou d'une fraction irréductible.
==


