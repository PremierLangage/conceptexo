extends = /model/math.pl


before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON
n = 2
case = 3
d = 3
if case == 1:
    A = rand_int_matrix_givenrank(2, d, 2, magnitude=2)
elif case == 2:
    A = rand_int_matrix_givenrank(2, d, 2, magnitude=2)
elif case == 3:
    A = rand_int_matrix_givenrank(3, d, 1, magnitude=1)
elif case == 4:
    A = rand_int_matrix_givenrank(3, d, 2, magnitude=1)

n = A.shape[0]
family = ', '.join([str(tuple(A.row(i))) for i in range(n)])
==

text ==
On se place dans le $!\mathbb{R}!$-espace vectoriel $! \mathbb{R}^{{n}} !$. La famille de vecteurs suivante est-elle libre ?

$$ \mathcal{F} = \\{ {{ family }} \\}.$$
==

evaluator ==
score, error, feedback = eval_tuple(input.value, sol, checksize=True)
if error == "NotTuple" or error == "WrongSize":
    feedback = f"Votre réponse n'est pas un {tuple_name} de nombres."
==

solution == 
La solution est $! {{sol_tex}} !$.
==

