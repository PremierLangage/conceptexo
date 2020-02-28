extends = /model/math.pl

title = Calcul de dérivée

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="functions"
input.config = keyboards_JSON

var('x')
n=randint(1,4)
g=randitem([sin(x),cos(x),exp(x),ln(x)])
h=randitem([x,x**2])
f=g*h
sol=diff(f,x)
==

text ==
Calculer la dérivée de la fonction
$$ f : x \mapsto {{f.tex}} .$$
==

input =: MathInput

form ==
{{input|component}}
==

evaluator==
score,_,feedback=ans_limit(input.value,sol)
==




