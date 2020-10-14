

extends= testapp2.pl


title=
text= Exécuter votre code sur la sandbox 

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Entrée du programme (stdin)
inputbox.maxlength = 2
inputbox.appearance = outline


# création de l'éditeur de code
editor =: CodeEditor
editor.language = python
editor.cid = py_editor_0
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==

soluce=@ app2dr.py


editor.code==

while True:
        s=input("$ ")
        if s=="v2":
            version=s
            continue
        if s=="v1":
            version=s
            continue
        if s=="version" :
            print(version)
            continue
        if s=="terminer:
            print("Désolé vous n'avez pas doublé votre mise initiale !") 
            break
==

before=

pregrader==
inputstring=inputbox.value
student=editor.code
with open("student.py","w") as f:
    f.write(student)

mplsoluce1="Test perso\n"+inputstring+"\n"

==


form==
{{ inputbox | component }}
{{ editor  | component }}
==

mplsoluce0==
Test Version
version
v1
version
v2
version
terminer
==



