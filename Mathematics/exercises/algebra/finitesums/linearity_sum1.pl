extends = /Mathematics/template/mathinput.pl

title = Linéarité


before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

v=randitem([Symbol('i'),Symbol('j'),Symbol('k')])
n=randitem([Symbol('n'),Symbol('m'),Symbol('p')])
a=randint(1,4)
b0=randint(-4,4,[0])
b=n+b0
n0=max([0,a-b0])
S = Sum(v, (v, a, b))
E = c1*Sum(p1*v+q1, (v, a, b))+c2*Sum(p2*v+q2, (v, a, b))
S_tex=latex(S)
E_tex=latex(E)
n_tex=latex(n)
sol=(b-a+1)*(a+b)/2
sol_tex=latex(sol)
==


text ==
On pose $! \displaystyle S = {{S_tex}} !$. Exprimer $% \displaystyle {{E_tex}} %$ en fonction de $! S !$ et $! n !$.
==

evaluator==
score,_,feedback=ans_expr(input.value,sol)
==

solution ==
La solution est $! {{sol_tex}} !$.
==


