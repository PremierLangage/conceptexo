


# UNE ACTIVITÉ PLA FORMAT JSON 
# ce json est utilisé pour la fonction load 
# EXECUTER CE CODE PYTHON FOURNIS UNE ACTIVITÉ AU FORMAT JSON SUR SDTOUT

## 
pla= {} # Dictionnaire à sauvegarder

# Commande a executer sur la sandbox dans l'environement de l'activité 
# pour l'appel de start 
# python3 start.py input.json  output.json RESULTAT.json 
# le fichier input.json est les données de l'activité 
# le fichier output.json est le fichier de donnée après l'exécution du script
# le fichier resultat.json est envoyé par la sandbox à l'appelant

for name in ["start.py","next.py","end.py"]:
    with open(name,"r") as f:
        pla[name]= f.read()


# 


for name in ["plid","plid2"]
    with open(name+".json","r") as f:
            pla[name] = json.load(f)


# les settings suivants sont les settings par défaut
pla["settings"]={ 'nbtry':0, 'reroll':True, 'syntactic':True, 'feedback':False, 'evaluation':False, 'validation':True }


pla["start"]="""
# ceci est le script fait dans l'appel à start 
# la variable main suivante est utilisée par l'activité 
# pour avoir l'identification de l'exercice sur la sandbox (envid)
main= platon.buildExo(plid,settings,{})

step = 1
==
"""

pla["plid2"]=2  # cette valeur  est retournée par la fonction load de l'exercice 
              # appelé par une référence d'exercice format ?


pla["next"]="""
# ceci est le script fait dans l'appel à next 
# la variable main suivante est utilisée par l'activité 
# pour avoir l'identification de l'exercice sur la sandbox (envid)
if step == 1:
    main= platon.buildExo(plid2,settings,{})
    step += 1
else:
    # C'est fini y a plus d'exos 
    main= None 

==
"""

pla["end"]="""
# ceci est le script fait dans l'appel à next 
# la variable main suivante est utilisée par l'activité 
# pour avoir l'identification de l'exercice sur la sandbox (envid)
main= None
end_feedback=" c'est fini "

==
"""





import json
import sys

with open("pla.json","w") as f:
    json.dump(pla,f)


