
@ /utils/sandboxio.py
@ /builder/before.py [builder.py]
@ /grader/evaluator.py [grader.py]

extends = QCU.pl



@ presentation.md

title= CA COMMENCE
before==
with open ("presentation.md" , "r") as f:
    t=f.readlines()

slides=("\n".join(t)).split("***\n")
numero=0

#text=slides


==


evaluator==
numero += 1
if numero < len(slides):
    text=slides[numero]
    title= f"{numero}/{len(slides)-1}"
    grade=(0,"continuez")
        

else:
    grade=(100,"Bonne continuation")
==

text= ou est mon exo sinon

dummy.extracss==
<style>
.exercise__header {
background: center no-repeat url("https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/PanoMontBlancHDR_edit_1.jpg/800px-PanoMontBlancHDR_edit_1.jpg");
background-size: contain;
}
</style>
==



