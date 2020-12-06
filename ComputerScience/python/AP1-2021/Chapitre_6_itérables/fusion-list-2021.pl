# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Fusion d'une liste de liste

text==
On manipule les listes de liste, et on en a marre !

Ecrire une fonction ``fusion(lst)`` qui prend en paramètre une liste de listes, puis retourner une nouvelle liste qui est une concaténation successive de chaque élément de ``lst``. On voit alors que la valeur retournée sera une liste.

Par exemple, si on a

    lst = [[1, 2, 3], [4, 5], [], [6, 7, 8, 9]]

alors l'appel ``fusion(lst)`` doit retourner la liste

    [1, 2, 3, 4, 5, 6, 7, 8, 9]
==

tag=listoflist|extend

samplesol==
def fusion(l):
    res = []
    for e in l:
        res.extend(e)
    return res
==

before==
from random import randint

pltest2 =">>> fusion([])\n[]\n"

after = before
==

pltest0==
>>> fusion([])
[]
>>> fusion([[]])
[]
>>> fusion([[1, 2, 3], [4, 5], [], [6, 7, 8, 9]])
[1, 2, 3, 4, 5, 6, 7, 8, 9]
==

pltest1==
>>> fusion([[1, 2, 3]])
[1, 2, 3]
>>> fusion([[], [], ['string', 'int', 'list'], ['dict', 'range']])
['string', 'int', 'list', 'dict', 'range']
>>> fusion([[[]], [[1, 2], [3, 4]], [[]]])
[[], [1, 2], [3, 4], []]
==
