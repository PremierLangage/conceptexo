extends = /model/math.pl

title = Graphique

input.virtualKeyboards = functions

before ==
import matplotlib.pyplot as plt
import numpy as np
    
t = np.arange(0.0, 2.0, 0.01)
s = 1 + np.sin(2*np.pi*t)
plt.plot(t, s)
plt.xlabel('time (s)')
plt.ylabel('voltage (mV)')
plt.title('About as simple as it gets, folks')
plt.grid(True)

source = mplfig2svg(plt.gcf())
==

text ==
Calculer la dérivée de la fonction
$$ f : x \mapsto {{f.latex}} .$$
==

form ==
==

evaluator ==
score, _, feedback = eval_function(input.value, sol)
==


