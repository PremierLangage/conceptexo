extends = /template/basic.pl
@ grc_conj.json [grc_conj.json]
@ grc_verbs.json [grc_verbs.json]

@ /utils/radiogroup.py [customradiogroup.py]

title = Grec ancien : Analyse verbale

settings.feedback.class = colorbox

radio_prs =: RadioGroup
radio_prs.decorator = CustomRadioGroup
radio_tense =: RadioGroup
radio_tense.decorator = CustomRadioGroup
radio_mood =: RadioGroup
radio_mood.decorator = CustomRadioGroup
radio_voice =: RadioGroup
radio_voice.decorator = CustomRadioGroup

extracss ==
<style>
.myclass {
    padding: 4px 4px 4px 4px !important;
}
</style>
==

lst_prs % [{'id':'1S','content':'1ère personne du singulier'},
            {'id':'2S','content':'2e personne du singulier'},
            {'id':'3S','content':'3e personne du singulier'},
            {'id':'1P','content':'1ère personne du pluriel'},
            {'id':'2P','content':'2e personne du pluriel'},
            {'id':'3P','content':'3e personne du pluriel'}
            ]

lst_tense % [{'id':'pres','content':'présent'},
          {'id':'imperfect','content':'imparfait'}
            ]

lst_voice % [{'id':'A','content':'actif'},
            {'id':'MP','content':'moyen-passif'}
            ]

lst_mood % [{'id':'I','content':'indicatif'},
            {'id':'S','content':'subjonctif'},
            {'id':'O','content':'optatif'}
            ]

before==
import json,random

radio_prs.loadChoices(['1ère pers. du singulier',
                       '2e pers. du singulier',
                       '3e pers. du singulier',
                       '1ère pers. du pluriel',
                       '2e pers. du pluriel',
                       '3e pers. du pluriel'])
    
radio_tense.loadChoices(['présent','imparfait'])

radio_voice.loadChoices(['actif','moyen-passif'])

radio_mood.loadChoices(['indicatif','subjonctif','optatif'])

for item in radio_prs.items:
    item['css']='myclass'
for item in radio_tense.items:
    item['css']='myclass'
for item in radio_mood.items:
    item['css']='myclass'
for item in radio_voice.items:
    item['css']='myclass'

with open('grc_conj.json','r',encoding='utf8') as f:
    tplconj=json.load(f)
    
with open('grc_verbs.json','r',encoding='utf8') as f:
    dataverb=json.load(f)


name=random.choice(list(dataverb.keys()))

def render(arg,data):
    if isinstance(arg,dict):
        return {k: render(v,data) for k, v in arg.items()}
    elif isinstance(arg,str):
        return arg.format(**data)
    else:
        return arg
            
conj={}
data=dataverb[name]
if 'pres' in data:
    conj['pres']=render(tplconj['pres'],data['pres'])
if 'imperfect' in data:
    conj['imperfect']=render(tplconj['imperfect'],data['imperfect'])
if 'future' in data:
    conj['future']=render(tplconj['future'],data['future'])

voice=random.choice(["A","MP"])
mood=random.choice(["I"])
tense=random.choice(["pres","imperfect"])
person=random.choice(["1S","2S","3S","1P","2P","3P"])

formverb=conj[tense][voice]['I'][person]
if isinstance(formverb,list):
    formverb=random.choice(formverb)
==

text ==
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/gfs-porson" type="text/css"/> 
Analyser la forme verbale suivante : 
<div style="text-align:center;font-size: x-large;font-family:'GFSPorsonRegular';">
{{formverb}}
</div><br>
==

form==
<small>
<table>
  <tr style='vertical-align: top'>
    <td style="padding-right:1em;"> {{ radio_prs | component }} </td>
    <td style="padding-right:1em;"> {{ radio_tense | component }}</td>
    <td style="padding-right:1em;"> {{ radio_voice | component }}</td>
    <td> {{ radio_mood | component }} </td>
  </tr>
</table>
</small>
==


evaluator==
score=0
try:
    ans=conj[radio_tense.selection][radio_voice.selection][radio_mood.selection][radio_prs.selection]
except:
    ans=""
if isinstance(ans,str):
    if ans==formverb:
        score=100
if isinstance(ans,list):
    if formverb in ans:
        score=100

feedback=""
grade = (score,feedback)
==





