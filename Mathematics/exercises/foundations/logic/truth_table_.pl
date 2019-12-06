extends = /Mathematics/template/mathinput.pl

title = Table de vérité

extracss==
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table {
    margin: auto;
}
th, td {
  padding: 0.5em;
  text-align:center;
}
</style>
==


before ==
drop=[]
for i in range(4):
    globals()[f"drop{i}"] = DragDrop(id=f"drop{i}",droppable=False)
    drop.append(globals()[f"drop{i}"])

P=[True,True,False,False]
Q=[True,False,True,False]

case=0

if case==0:
    expr= "$!P!$ et non ($!Q!$)"
    R = [P[i] and not Q[i] for i in range(4)]
elif case==1:
    expr= "$!P!$ ou non ($!Q!$)"
    R = [P[i] or not Q[i] for i in range(4)]
if case==0:
    expr= "$!P!$ et non ($!Q!$)"
    R = [not P[i] and Q[i] for i in range(4)]
elif case==1:
    expr= "$!P!$ ou non ($!Q!$)"
    R = [not P[i] or Q[i] for i in range(4)]

row1 = ["V" if P[i] else "F" for i in range(4)]
row2 = ["V" if Q[i] else "F" for i in range(4)]

==

text ==
{{R}}

<table>
<tr>
<td> $! P !$ </td>
<td> $! Q !$ </td>
<td> {{expr}} </td>
</tr>
{% for i in range(4) %}
<tr>
<td> {{row1[i]}} </td>
<td> {{row2[i]}} </td>
<td> {{ drop[i] | component }} </td>
</tr>
{% endfor %}
</table>
==

evaluator==
score,_,feedback=ans_struct_expr(input.value,imA,"composite")
==

solution ==
La solution est $! {{imA_tex}} !$
==


