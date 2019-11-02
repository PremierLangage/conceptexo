extends = /Mathematics/template/mathinput.pl

title = Antécédent

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

n,m=list_randitem_norep(2,symbols("n,m,p,q,r"))
expr=randitem([n**2+m,n+m**2,n**2-m,n-m**2])
nn=latex(n)
mm=latex(m)
expr=randint(-3,3,[0])*(n+randint(-2,2))*(m+randint(-2,2))
expr_tex=latex(expr)
f = Lambda ( (n,m) , expr)

E = [(x,y) for x in range(-3,4) for y in range(-3,4)]
A=FiniteSet(*list_randitem_norep(3,E))
imA=FiniteSet(*[f(*x) for x in A])
A_tex=latex(A)
imA_tex=latex(imA)
==

text ==
On considère la fonction $! f : \mathbb{Z} \times \mathbb{Z} \rightarrow \mathbb{Z} !$ telle que
$$f({{nn}},{{mm}})= {{expr_tex}}$$
Déterminer un antécédent de $! f(\\{ {{A_tex}} \\}). !$ par  $! f !$
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==

solution ==
La solution est $! {{imA_tex}} !$
==

