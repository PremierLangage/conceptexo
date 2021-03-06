extends = ../templates/multichoice.pl

maxattempt = 3

generate== #|py|
# YOU CAN USE ANY OF THE FOLLOWING NOTATIONS HERE

# STRING NOTATION
#viewer = '''
#    #states
#    S0
#    S1
#    S2
#    #initials
#    S0
#    #accepting
#    S2
#    #alphabet
#    a
#    b
#    c
#    #transitions
#    S0:a>S1
#    S1:b>S2
#    S2:a,b,c>S2
#'''

# OBJECT NOTATION
# viewer = {
#     "alphabet": ["a", "b", "c"],
#     "states": ["S0", "S1", "S2"],
#     "initialStates":["S0"],
#     "acceptingStates": ["S2"],
#     "transitions": [
#         { "fromState": "S0", "toState": "S1", "symbols": ["a"]},
#         { "fromState": "S1", "toState": "S2", "symbols": ["b"]},
#         { "fromState": "S2", "toState": "S2", "symbols": ["a", "b", "c"]}
#     ]
# }

# RANDOM GENERATIOON
#viewer = Automaton.rand(4, 3, 3)

# REGEX NOTATION
viewer = '(a|b|c)*'

==

title= Lecture d'automates

text==
Parmi les mots suivants, lesquels sont reconnus par cet automate?
{% if attempt < maxattempt and score != 100 %}
<p class="warning-state">
Il vous reste {{ maxattempt - attempt }} tentative(s) avant de voir une solution !
</p>
{% endif %}
==




