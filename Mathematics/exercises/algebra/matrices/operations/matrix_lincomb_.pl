extends = /model/mathmatrix.pl

title==
Produit de matrices
==

before==
if isinstance(param['size'][0], list):
    n, m = randitem(param['size'])
else:
    n, m = param['size']
    
coeffbound = param['coeffbound']

mat.setmatrix([m * [0] for _ in range(n)])

a,b = list_randint_norep(2,-2,2,[0])
var('A B')
expr = simplify(a*A + b*B)
MA = rand_int_matrix(n, m, coeffbound)
MB = rand_int_matrix(m, p, coeffbound)
Msol = a*MA+b*MB
==

text==
Soit les matrices
$$ A = \left( {{A.latex}}\right) \text{ et } B = \left({{B.latex}}\right) $$ 
Calculer $!{{expr.latex}} !$.
==


evaluator ==
score, _, feedback = eval_matrix(mat.getmatrix(), Msol)
==

solution ==
La solution est $$\left( {{Msol.latex}} \right).$$
==

