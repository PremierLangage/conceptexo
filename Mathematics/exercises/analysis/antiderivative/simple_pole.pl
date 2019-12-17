extends = /Mathematics/template/mathinput.pl

title = Calcul de primitive

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="functions"
input.config = keyboards_JSON

var('x')
a=randitem([Rational(1,2),Rational(1,3),Rational(1,4),2,3,4])
b=randint(-5,5,[0])
c=randint(-5,5,[0])

s=randitem([-1,1])
b0=Rational(-c,b)
if (b>0 and s>0) or (b<0 and s<0):
    dom=r"\rbrack \b0,+\infty\lbrack"
else:
    dom=r"\rbrack -\infty,\b0\lbrack"

if s>0:
    sol=a/b*ln(b*x+c)
else:
    sol=-a/b*ln(-b*x-c)

f=a/(b*x+c)
latexf=latex(f)
==

text ==
Calculer une primitive de la fonction
$$ f : x \mapsto {{latexf}} $$
==

evaluator==
var('x')
score,_,feedback=ans_antiderivative(input.value,sol,x)
==

