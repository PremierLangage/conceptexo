
extends = /model/basic.pl
title = Shuffle déconne

before==#|python|
from random import shuffle

a = {1:1,2:2,3:3,4:4}
b = list(a.items())
shuffle(b)
a = dict(b)
s = str(a)
==

text ==
{{s}}
<br>
{% for key in a %}
{{key}}
{% endfor %}
<br>

==

form ==
<br>
{% for key in a %}
{{key}}
{% endfor %}
</br>
==

settings.feedback = lightscore

evaluator==#|python|
grade = (100,'')
==






