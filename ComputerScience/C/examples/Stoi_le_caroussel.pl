@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

@ /model/AMC2/AMC2.py [AMC.py]

before==#|python|
from AMC import parse_AMC_TXT


list_questions = parse_AMC_TXT(questions)



==

questions=@ /ComputerScience/C_Initiation/QCM/QCM-1-a-4.txt

title==
Stoi le caroussel !
==

text==

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner{
    margin: 20px;
    padding: 20px;
  }

  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    margin: 20px;
    padding: 20px;
    width: 70%;
  }
  </style>

<div id="myCarousel" class="carousel slide" data-ride="carousel" data-wrap="false">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <p>Wesh, pose ta question 1 bordaille ?</p>

      <br><br>
    </div>

    <div class="item">
      <p>Zyva (David), pose ta question 2 alors ?</p>

      <br><br>
    </div>

    <div class="item">
      <p>Nan, t'avais une question 3 ?</p>

      <br><br>
    </div>

    <div class="item">
      <p>4 c'est trop, JPP !</p>

      <br><br>
    </div>
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