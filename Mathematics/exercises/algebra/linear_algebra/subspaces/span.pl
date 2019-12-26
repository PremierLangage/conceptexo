extends = /Mathematics/template/mathinput.pl

title = Représentation paramétrique des sous-espaces

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="elementary"
input.config = keyboards_JSON

n=1
m=3
d=m-n
coeffbound = 4
A=rand_int_matrix_fullrank(n,m,coeffbound)
B=zeros(n,1)
sys_tex=latexsys(A,B)
lstvec=["u","v","w"]
==

text ==
On considère l'ensemble des vecteurs $! (x,y,z) !$ tels que
$$ {{sys_tex}} $$
Trouver un vecteur qui engendre cet ensemble.
==

evaluator ==
try:    
    ans=str2struct("("+input.value+")")
    if not all([len(v)==m for v in L]):
        grade=(0,"")
    else:
        M=Matrix(ans).transpose()

        if not A*M==zeros(n,d):
            grade=(0,"")
except:
    grade=(-1,"")

score,feedback=grade
==

