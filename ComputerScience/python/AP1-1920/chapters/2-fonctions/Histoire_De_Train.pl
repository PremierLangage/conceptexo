#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


title = Histoire de trains

text==  
Un train roulant à vitesse constante est parti de la gare d'Ouceti
et se dirige vers Arras.<br>

Moi, je suis ligoté sur les rails à 1km de l'entrée de la gare d’Arras...<br> 

Alerté par mes cris, Superman, qui trainait à quelques kilomètres de la
se dirige vers moi à vitesse constante.<br>

Serai-je sauvé* ?<br>
<br>

*   Écrire une fonction `temps_de_parcours` qui reçoit en paramètre
    une vitesse `v` en kilomètre par heure et une distance `d` en kilomètre
    et qui renvoie le temps necéssaire pour parcourir la distance `d``
    à vitesse constante égale à `v`.<br>
    <br>

*   Écrire une fonction `sauvetage` qui renvoie un booléen indiquant
    si Superman arrive à temps pour me sauver. Cette fonction reçoit
    les quatre floattants, la vitesse de circulation du train, la distance
    entre Ouceti et Arras, la vitesse de vol de Superman, ainsi que
    sa distance au lieu où je suis ligoté.
<br>
==
Xeditor.code==

def temps_mis(v,d):
    """retourne le temps en heure mn pour parcourir km à la vitesse v."""
    heure =int(d/v)
    minute= (60 * d//v) % 60
    return heure,minute

def sauvetage(vt,dt,vs,ds):
    ht,mt=temps_mis(vt,dt)
    hs,ms=temps_mis(vs,ds)
    if ht<hs or (ht==hs and mt<ms):
        return False
    else:
        return True
    

==
before==
#pourquoi passerpar les heurs et minutes.
def temps_mis(v,d):
    """retourne le temps en heure mn pour parcourir km à la vitesse v."""
    heure =int(d/v)
    minute= (60 * d//v) % 60
    return heure,minute

def sauvetage(vt,dt,vs,ds):
    ht,mt=temps_mis(vt,dt)
    hs,ms=temps_mis(vs,ds)
    if ht<hs or (ht==hs and mt<ms):
        return False
    else:
        return True
import random
vt=random.randint (14,250)
dt=random.randint(20,300)
vs=random.randint (200,350)
ds=random.randint (100,500)
pltest3=""">>> sauvetage({},{},{},{})\n{}""".format(vt,dt,vs,ds,sauvetage(vt,dt,vs,ds))
after=before
==
pltest0==
>>> sauvetage(2,2,1,1)==False
False
==
pltest1==
>>> sauvetage(100,20,20,100)
False
==



pltest2==
>>> sauvetage(20,100,200,10)
True
==






