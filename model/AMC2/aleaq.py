
"""
            questions.append({'type': question_type, 
            'text': statement, 
            'items': items, 
            'index': index, 
            'options': options,
            'extended': extended
            })
"""

import random


def optiondic(l):
    d={}

    for x in l:
        k,v= x.split('=')
        d[k]=v
    return d

def buildquestion(question):
    """
    Question 

    """
    if question.get('extended') == False:
        return question
    try:
        d=optiondic(question.get('options'))
        nb =d.get("nb",4)
        if question.get('type') == 'Radio':
            bonne=question.get('index')
            good=random.choice(eval(question.get('items')[bonne][1:]))# Une bonne réponce le [1:] c'est pour le '=' c'est bof FIXME 
            del question.get('items')[bonne]
            bads=[]
            for defi in question.get('items'):
                bads.append(eval(defi[1:]))# ensemble des mauvaises réponces 
            bads= random.sample(bads , nb-1) # en choisir n-1
            random.shuffle(bads)
            # INSERER good quelque part et noter l'index 
            index=random.randint(0,len(bads))
            bads.insert(index,good)
            q['index']=index
            q['items']=bads
        return q

        
    except Exception as e:
        print("Problème dans votre question ", str(question))
        print(e)
        raise e
    
