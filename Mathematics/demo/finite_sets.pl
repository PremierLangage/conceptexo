extends = model/math/finite_sets.pl

before ==
items = list(range(10))

A = rand_finiteset(randint(3, 7), items)
B = rand_finiteset(randint(3, 7), items)
C = rand_finiteset(randint(3, 7), items)

expr = r"A \cup (B \cap C)"
sol = Union(Intersection(B, C), A)
==

text == 
On considère les ensembles suivants :
$$ A= \\{ {{ A|latex }} \\},\ B= \\{ {{ B|latex }} \\},\ C= \\{ {{ C|latex }} \\}.$$
Déterminer $! {{expr}} !$.
==

