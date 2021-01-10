# Author : D. Doyen
# Last update : 09/01/21
# Keywords : linear systems

extends = /model/math/math.pl
extends = /model/basic/radio.pl

shuffle % false

choices ==
Une unique solution
Une infinité de solutions
Aucune solution
==

title = Nombre de solutions d'un sytème 3x3

before ==
n = 3
bound = 3
A = randint_matrix_givenrank(3, 2, 2, magnitude=2)


vec = list_randint(2, -3, 3)
B = A*Matrix(vec)


sys_tex = latex_linsys(A, B)

==

text ==
On considère le système suivant (d'inconnues $!x, y, z !$) :
$$ {{sys_tex}} $$
==

