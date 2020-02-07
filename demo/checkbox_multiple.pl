extends = /template/basic.pl

title = QCM : Multiples de 3

before ==
import random as rd
mult3 = [str(n) for n in range(50,100) if n % 3 == 0]
other = [str(n) for n in range(50,100) if n % 3 != 0]
checkbox.load_right_wrong(mult3,other,5,rd.randint(1,4))
==

text ==
Parmi les nombres suivants, lesquels sont des multiples de 3 ?
==

@ /utils/checkbox.py [checkbox.py]

checkbox =: CheckboxGroup
checkbox.decorator = Checkbox

settings.feedback = lightscore

form ==
{{ checkbox | component }}
==

evaluator ==
grade = checkbox.eval()
==


