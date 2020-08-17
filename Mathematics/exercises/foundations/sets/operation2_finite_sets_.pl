extends = /model/mathinput.pl

title = Opérations sur les ensembles

input.virtualKeyboards = sets

before ==
A=rand_finiteset(randint(3,7),list(range(10)))
B=rand_finiteset(randint(3,7),list(range(10)))
CC=rand_finiteset(randint(3,7),list(range(10)))
case=randitem(eval(param['cases']))
if case==1:
    expr=r"(A \cap B) \cup CC"
    sol=Union(Intersection(A,B),CC)
elif case==2:
    expr=r"(A \cup B) \cap CC"
    sol=Intersection(Union(A,B),CC)
elif case==3:
    expr=r"A \cap (B \cup CC)"
    sol=Intersection(Union(B,CC),A)
elif case==4:
    expr=r"A \cup (B \cap CC)"
    sol=Union(Intersection(B,CC),A)

elif case==5:
    expr=r"(A \cup B) \setminus CC"
    sol=CC.complement(Union(A,B))
elif case==6:
    expr=r"(A \setminus B) \cup CC"
    sol=Union(CC,B.complement(A))
elif case==7:
    expr=r"A \cup (B \setminus CC)"
    sol=Union(A,CC.complement(B))
elif case==8:
    expr=r"A \setminus (B \cup CC)"
    sol=Union(B,CC).complement(A)

elif case==9:
    expr=r"(A \cap B) \setminus CC"
    sol=CC.complement(Intersection(A,B))
elif case==10:
    expr=r"(A \setminus B) \cap CC"
    sol=Intersection(CC,B.complement(A))
elif case==11:
    expr=r"A \cap (B \setminus CC)"
    sol=Intersection(A,CC.complement(B))
elif case==12:
    expr=r"A \setminus (B \cap CC)"
    sol=Intersection(B,CC).complement(A)


A_tex=latex(A)
B_tex=latex(B)
CC_tex=latex(CC)
sol_tex=latex(sol)
sol=list(sol)
==

text == 
On considère les ensembles suivants :
$$ A= \\{ {{A_tex}} \\},\ B= \\{ {{B_tex}} \\},\ CC= \\{ {{CC_tex}} \\}.$$
Déterminer $! {{expr}} !$.
==

evaluator ==
score,_,feedback = eval_set (input.value, sol)
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==
