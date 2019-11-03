extends = finite_map_.pl

title = Image réciproque d'une application

drop1 =: DragDrop
drop1.droppable = True

before ==
n=5
drag=[]
for i in range(1,n+1):
    name="drag"+str(i)
    globals()[name] = DragDrop()
    globals()[name].content = str(i)
    drag.append(globals()[name])

drop=[]
for i in range(1,n+1):
    name="drop"+str(i)
    globals()[name] = DragDrop()
    globals()[name].droppable = True
    drop.append(globals()[name])


from jinja2 import Template

row1=list(range(1,n+1))
row2f=list_randint_norep(n,1,n)
row2g=list_randint_norep(n,1,n)
tablef = Template(tpltable).render(row1=row1,row2=row2f,fx="$! f(x) !$")
tableg = Template(tpltable).render(row1=row1,row2=row2g,fx="$! g(x) !$")
==

text ==
On considère les applications  $! f:\\{1,\ldots,{{n}} \\}\rightarrow \\{1,\ldots,{{n}} \\} !$ définie par le tableau ci-dessous.
<br>
{{tablef|safe}}
<br>
{{tableg|safe}}
<br>
==

form ==
<table>
<tr>
<th> $! x !$ </th>
{% for item in row1 %}
<td> {{item|safe}} </td>
{% endfor %}
</tr>
<tr>
<th> $! f(x) !$ </th>
{% for e in drop %}
<td> {{e|component}} </td>
{% endfor %}
</tr>
</table>

{% for e in drag -%}
{{ e|component }}
{%- endfor %}
==

evaluator==
drop=[]
for i in range(1,n+1):
    name="drop"+str(i)
    drop.append(locals()[name])

feedback=""
score=100
for i in range(n):
    if drop[i].content==sol[i]:
        drop[i].css = "success-state"
    else:
        score=0
        drop[i].css = "error-state" 
==

