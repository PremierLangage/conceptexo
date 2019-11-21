#author = WFang

extends = /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Réserver un bon hôtel

text==
Vous allez prendre une vacances à Marseille, et vous devez réserver un hôtel. 

Vous avez un ensemble d'hôtels préférés, mais maintenant vos amis vous transmettent une liste d'hôtels à éviter.

Écrire une fonction `hotel_acceptable` qui prendre votre ensemble d'hôtels acceptable et la liste d'hôtel à éviter, 
puis renvoyer un ensemble d'hôtels acceptables, c'est-à-dire les hôtels acceptables pour vous mais pas à éviter.

Voici un exemple :

>>> hotel_acceptable({'Accor', 'Mercure', 'Hôtel de la Gare', 'ibis', 'Hôtel Saint-Jacques'}, ['ibis', 'Accor', 'ibis']) # Exemple
{'Hôtel Saint-Jacques', 'Mercure', 'Hôtel de la Gare'}
==

pltest==
>>> hotel_acceptable({'Accor', 'Mercure', 'Hôtel de la Gare', 'ibis', 'Hôtel Saint-Jacques'}, ['ibis', 'Accor', 'ibis']) # Exemple
{'Hôtel Saint-Jacques', 'Mercure', 'Hôtel de la Gare'}
==

pltest1==
>>> hotel_acceptable({'A', 'B'}, []) # Tous contents
{'A', 'B'}
==

pltest2==
>>> hotel_acceptable(set(), ['A', 'B']) # Tu n'aimes rien
set()
==

cache==
def hotel_acceptable(s, l):
    return s - set(l)
==

