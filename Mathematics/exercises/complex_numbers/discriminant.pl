extends = /Mathematics/template/mathinput.pl

title = Discriminant d'une équation quadratique

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="complexes"
input.config = keyboards_JSON

a=rand_complex_int(4)
b=rand_complex_int(4)
c=rand_complex_int(4)
latexP=latex(poly(a*x**2+b*x+c,x))

sol=(b*b-4*a*c).expand()
sol_tex=latex(sol)
==

text ==
Déterminer le discriminant de l'équation $! {{latexP}} = 0 !$.
==


evaluator==
score,_,feedback=ans_complex(input.value,sol,form="cartesian")
==

solution ==
Le discriminant est $! {{sol_tex}} !$.
==
