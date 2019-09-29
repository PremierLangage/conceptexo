extends = /Mathematics/template/mathinput.pl

title = Définition d'un ensemble en compréhension

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="sets"
input.config = keyboards_JSON

S=randitem(["N","N*","Z","Z*"])
cond=randitem(["square","square2"])

if S=="N":
    S_tex==r"\mathbb{N}"
    lstS=list(range(n))
elif S=="N*":
    S_tex==r"\mathbb{N}^*"
    lstS=list(range(1,n))
elif S="Z":
    S_tex==r"\mathbb{Z}":
    lstS=list(range(-n+1,n))
elif S="Z*":
    S_tex==r"\mathbb{Z}^*":
    lstS=list(range(-n+1,0))+list(range(1,n))

symb=["<","\leq"]

if cond=="square":
    a=anditem([4,6,9,15,16,19,21,25,27])
    ka=randint(0,1)
    globals()['aa']=a+ka
    lstA=[x for x in lstS if x**2 < aa]
    cond=r"n^2 %s %d" % (symb[ka],a)
elif cond=="square2":
    ka=randint(0,1)
    kb=randint(0,1)
    a=randitem([1,4,6,9,15,16,19,21])
    b=randitem([27,36,49,50,64,70,81,90,100,110])
    globals()['aa']=a-ka
    globals()['bb']=a+kb
    lstA=[x for x in lstS if aa < x**2 < bb]
    cond=r" %d %s n^2 %s %d" % (a,symb[ka],symb[kb],b)


sol=FiniteSet(*lstA)
sol_tex=latex(sol)
==

text == 
Ecrire en extension l'ensemble $!\\left \\{ n \in {{S}} \:|\: {{cond}} \\right \\}!$.
==

evaluator ==
score,_,feedback=ans_struct_expr(input.value,sol,"set")
==

solution ==
La solution est $! { {{sol_tex}} } !$.
==




