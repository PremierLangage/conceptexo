extends = /Mathematics/template/mathexpr.pl

title = Inéquation linéaire

lang = fr

param.otherside1 = constant

param.otherside2 = constant

before ==
a,c=list_randint_norep(2,-6,6,[0,1,-1])
b,d=list_randint(2,-6,6,[0])
var('x')
f=a*x+b
if param['otherside1']=='zero':
    g=0
if param['otherside1']=='constant':
    g=d
if param['otherside1']=='linear':
    g=c*x+d
ineq1=randitem([f>=g,f>g,f<=g,f<g,g>=f,g>f,g<=f,g<f])

a,c=list_randint_norep(2,-6,6,[0,1,-1])
b,d=list_randint(2,-6,6,[0])
var('x')
f=a*x+b
if param['otherside2']=='zero':
    g=0
if param['otherside2']=='constant':
    g=d
if param['otherside2']=='linear':
    g=c*x+d
ineq2=randitem([f>=g,f>g,f<=g,f<g,g>=f,g>f,g<=f,g<f])

sol1=solveset(ineq1,x,domain=S.Reals)
sol2=solveset(ineq2,x,domain=S.Reals)
sol=Intersection(sol1,sol2)

ineq1_tex=latex(ineq1)
ineq2_tex=latex(ineq2)
sol_tex=latex(sol)
==

text ==
{{sol_tex}}
Déterminer l'ensemble des réels $% x %$ tels que $$ {{ineq1_tex}}\quad\text{ et }\quad{{ineq2_tex}}. $$ Ecrire cet ensemble sous la forme d'un intervalle (ou de l'ensemble vide).
==

input.1.virtualKeyboards = sets

evaluator==
score,_,feedback=ans_rset(answer['1'],sol)
==

