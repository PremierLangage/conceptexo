extends = ../templates/AMC_TXT_claire.pl

author = Claire David
title = QCM - régulier / non régulier ?

randomize_questions = on

#pour changer le nombre de questions
nbstep = 10

intro ==
Ce QCM contient {{ nbstep }} questions tirées aléatoirement parmi 20.

Les langages suivants sont-il réguliers ou non réguliers?
==

#questions=@test.txt
questions=@ q-reg-nonreg-langages.txt






