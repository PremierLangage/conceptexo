
# OCE : test 11/09/2019 OK
extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

tag=Programmation|Python|Initialisation|Variable
author = Christophe Callé

title = Initialisation et constantes 


before== #|python| 
import random 
random.seed(seed)
type_var = random.choice(["int","str","float","bool"])
var = random.choice(["a", "b", "c", "X", "Y","PIERRE","feuille","ciseaux"])

pltest0="""
>>> "{}" in globals() # La variable {} est elle définie 
True
""".format(var, var)

pltest1="""
>>> type({})=={} # La variables est elle du bon type: {}
True
""".format(var, type_var, type_var)
==

text==
 Initialisez la variable **{{var}}** avec une valeur quelconque
 de type **{{type_var}}** 
==



