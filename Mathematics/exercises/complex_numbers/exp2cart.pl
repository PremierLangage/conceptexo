extends = /Mathematics/template/mathinput.pl

title = Conversion

lang = fr

before ==
keyboards_JSON['virtualKeyboards']="complexes"
input1.config = keyboards_JSON

with evaluate(False):
    z=exp(I*pi/4)
latexz=latex(z)
==

text = Ecrire sous forme cartésienne le nombre complexe $%\\large z= {{latexz}} %$.

evaluator==
score,_,feedback=ans_complex(input1.value,z,form="cartesian")
==



