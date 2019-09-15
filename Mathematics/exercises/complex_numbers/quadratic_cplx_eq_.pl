extends = /Mathematics/template/mathinput.pl

title = Equation quadratique

lang = fr

param.roots = int

before ==
keyboards_JSON['virtualKeyboards']="complexes"
input1.config = keyboards_JSON

a,b=list_randint(2,-4,4,[0])
c=randint(-5,5,[0,1,-1])
s=randitem([-1,1])
var('x')
if param['roots']=='int':
    P=s*(x+a+b*I)*(x+a-b*I)
if param['roots']=='rat':
    P=s*(c*x+a+b*I)*(c*x+a-b*I)
lstsol=list(solveset(P,x,domain=S.Complexes))
P=expand(P)
latexP=latex(P)
solution=r"Les solutions sont $! \displaystyle %s !$ et $! \displaystyle %s !$." % (latex(lstsol[0]),latex(lstsol[1]))
==

text ==
Déterminer les solutions (complexes) de l'équation $! {{latexP}} = 0 !$. Séparer les différentes solutions par une virgule.
==

evaluator==
score,_,feedback=ans_set_complex(input1.value,lstsol,formal=False)
==






