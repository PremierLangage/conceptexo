extends=../../templates/generic/generic.pl

@ interval.py

title=Intervales test_reload

text==
Ecrivez un programme qui prend en entrée un entier et affiche "Vrai" si l'entier est dans l'interval $%{{ latex }}%$ et "Faux" sinon.
==


before==
import interval

_interval = interval.makeinterval()
latex = _interval[0]
solution = _interval[1]
==

grader==
from itertools import permutations

begin_test_group("Groupe de tests pour tester les tests")
set_inputs(["5"])
run()
assert_output(pl_context["solution"])
assert_no_global_change()
end_test_group()


==



