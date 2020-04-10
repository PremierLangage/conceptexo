extends = /model/mathinput.pl

title = Inéquation produit

before ==

var('x')
b,d=list_randint_norep(2,-6,6,[0])
P,Q=(x+b),(x+d)
expr=P*Q

ineq = randitem([expr>=0,expr>0,expr<=0,expr<0])

sol=solveset(ineq,x,domain=S.Reals)
==

text ==
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ineq.latex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle ou d'une réunion d'intervalles.
==

evaluator==
score,feedback,_=eval_rset(input.value, sol)
==

solution ==
La solution est $% {{sol.tex}} %$.
==




