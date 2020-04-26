#*****************************************************************************
#  Copyright (C) 2020 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ utils_diagram.py

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

before==#|python|
from utils_diagram import generate_random_diagram, diagram_to_string
from components import GraphDrawer

diagram = generate_random_diagram(4, 5)

viewer = GraphDrawer(graph = diagram_to_string(diagram))
==

title=Table de vérité d'un circuit logique

text==
Remplir le tableau de Karnaugh associé au circuit logique suivant :
==

form==
<style>
 .graph-viewer-component {
 pointer-events: none;
}
.karnaugh{
 border: solid black 1px;
 padding: 3px;
}
.karnaugh td{
 text-align: center;
 font-style: blod;
}
</style>

<center>
<table>
<tr><td>
{{ viewer | component }}
</td><td>&nbsp;&nbsp;&nbsp;</td><td>
<table class="karnaugh">
  <tr>
    <td></td><td></td><td colspan="4">AB</td>
  <tr>
  <tr>
    <td></td><td></td><td>00</td><td>01</td><td>11</td><td>10</td>
  </tr>
  <tr>
    <td rowspan="4" style="vertical-align: middle;">CD</td>
    <td>00</td>
    <td class="karnaugh"><input id="form_0000" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_0001" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_0011" type="text" value="0" size="1"/></td>
    <td class="karnaugh"><input id="form_0010" type="text" value="0" size="1"/></td>
  </tr>
  <tr>
    <td>01</td>

  </tr>
  <tr>
    <td>11</td>
  </tr>
  <tr>
    <td>10</td>
  </tr>
</table>

</td></tr></table>
==

evaluator==
grade = (100, "")
==




