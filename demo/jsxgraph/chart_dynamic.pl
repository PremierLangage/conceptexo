extends = /template/basic.pl

title = Histogramme

jxg =: MathDrawer

jxg.attributes %=
{"boundingbox" : [-1,10,5,-1],
"showNavigation" : false,
"keepaspectratio" : false}
==

script ==
var a = board.create('chart', [{{series}}] , {chartStyle:'bar',color:'blue',width:0.6});
==


before ==
import random as rd
from jinja2 import Template

series=[random.randint(1,4) for _ in range(4)]

jxg.script = Template(script).render(locals())
==

text ==
{{ jxg | component }}
==

