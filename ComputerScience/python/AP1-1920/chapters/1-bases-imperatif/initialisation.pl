
# OCE : test 11/09/2019 OK
extends=../../templates/pltest.pl
@ /builder/before.py [builder.py]

tag=Programmation|Python|Initialisation|Variable
author = CC + DR

title = Initialisation et constantes 


before== #|python| 
import random 
random.seed(seed)
type_var = random.choice(["int","str","float","bool",None])
var = random.choice(["a", "b", "c", "X", "Y","PIERRE","feuille","ciseaux"])

pltest0="""
>>> "{}" in globals() # La variable {} est elle définie ?
True
""".format(var, var)

if type_var is None:
    pltest1="""
>>> type({}) is None # La variables est elle du bon type ({}) ?
True
""".format(var, type_var, type_var)
else:
    pltest1="""
>>> type({})=={} # La variables est elle du bon type ({}) ?
True
""".format(var, type_var, type_var)




==



text==
 Initialisez la variable **{{var}}** avec une valeur quelconque
 de type **{{type_var}}** 
==



