@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

@ /model/AMC2/AMC2.py [AMC.py]
@ /ComputerScience/OperatingSystem/templates/utils.py
@ /model/AMC2/aleaq.py


# LES TRUCS QUE L'ON PEUT CHANGER SONT LA :
nb_quest_voulu = 5


before==#|python|
# Le même parseur que AMC2 sinon ça va encore chialer grave !!!
from AMC import parse_AMC_TXT

from random import *
from customradio import CustomRadio
from customcheckbox import CustomCheckbox
from customtextselect import CustomTextSelect
from aleaq import buildquestion, onefromeachgroup

# Pour les tirages aléatoires sans remise...
from utils import *

list_questions = parse_AMC_TXT(questions)
nb_tot_quest = len(list_questions)

nb_quest = min([int(nb_quest_voulu), nb_tot_quest])
indices_questions = knuth_mixing( subset_index(nb_tot_quest, nb_quest) )

def make_html_answer(question):
    question["html_form"] = "Les options à cliquer..."

comp = []
statement  = []
shuffle(list_questions)
for i, q in enumerate(list_questions):
    q=buildquestion(q) # Gestion de l'aléa 
    if q['type'] == "Radio":
        comp.append(CustomRadio())
        statement.append(q['text'])
        comp[i].setitems(q['items'])
        comp[i].setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            comp[i].shuffle()
    elif q['type'] == "Checkbox":
        comp.append(CustomCheckbox())
        statement.append(q['text'])
        comp[i].setitems(q['items'])
        comp[i].setsol_from_index(q['index'])
        if 'ordered' not in q['options']:
            comp[i].shuffle()
    elif  q['type'] == 'TextSelect':
        cst = CustomTextSelect()
        statement.append(q['text'])
        cst.setdata_from_textDR(q['items'][0])
        comp.append(cst)


for i in indices_questions:
    make_html_answer(list_questions[i])


==

questions=@ /ComputerScience/C/exercices/program/qcm_questions/generalites_C.txt

title==
Stoi le caroussel !
==

text==

Prenez bien le temps de répondre aux {{ nb_quest }} questions avant de valider.



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    margin: auto;
    width: 70%;
  }
  </style>

<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    {% for i in range(1, nb_quest) %}
    <li data-target="#myCarousel" data-slide-to="{{ i }}"></li>
    {% endfor %}
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <p style="margin-left:15%; margin-right:15%;"><b><u>Question 1 : </u></b></p><br>

      <p style="margin-left:15%; margin-right:15%;">{{ list_questions[indices_questions[0]]["text"] }}</p>

      {{ list_questions[indices_questions[0]]["html_form"] }}

      {{ comp[indices_questions[0]]|component }}
    </div>

    {% for i in range(1, nb_quest) %}
    <div class="item">
      <p style="margin-left:15%; margin-right:15%;"><b><u>Question {{ i+1 }} : </u></b></p><br>

      <p style="margin-left:15%; margin-right:15%;">{{ list_questions[indices_questions[i]]["text"] }}</p>

      {{ list_questions[indices_questions[i]]["html_form"] }}

      {{ comp[indices_questions[i]]|component }}
    </div>
    {% endfor %}
    
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


==

form==

==

evaluator==#|python|
grade = (100, "Wesh t'a bon !")
==
