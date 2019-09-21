extends = /Mathematics/template/mathinput.pl

title = Définition d'un ensemble en compréhension

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="sets"
input1.config = keyboards_JSON

A=rand_finiteset(randint(2,3),list(range(10)))
A_tex=latex(A)
sol=A.powerset()
sol_tex=latex(sol)
==

text == 
Ecrire en extension l'ensemble $! \mathcal{P}(\\{ {{A_tex}}\\} ) !$.
==

evaluator ==
score,_,feedback=ans_struct_expr(input1.value,sol,"composite")
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==


