extends = /model/mathinput.pl

title = Développement limité d'une puissance.

before ==
var('x') # crée le symbole x
n = 3 # Ordre du DL


f = exp(1+x)

DLn = f.series(x,0,n+1) # Attention +1 sur l'ordre (notation O par défault).

sol = DLn.subs(O(x**(n+1)),0) # Solution

# Remarque générale : Sympy sait calculer avec les "O", mais je ne sais pas si il connait les "o"...
==

text ==
Calculer la partie régulière du développement limité à l'ordre $!{{ n |latex }}!$ en 0 de la fonction ci-dessous.
$${{ PQ|latex }}$$
==

evaluator ==
score, error = eval_expr(input.value, sol)
feedback = message[error]
==

solution ==
La solution est $! {{ sol|latex}} !$.
==

