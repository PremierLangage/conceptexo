

# test de l'appel de exit dans un exec 

import os

class ExecException(Exception):
    pass
#     def __init__(self, score, feedback):
#         self.score= score 
#         self.feedback = feedback


def bybye(score,feedback):
    global grade
    grade=(score,feedback)
    raise ExecException #(score,feedback)

codexec="""
print("dans exec ")
def fin():
    bybye(15, " coucouc" )

fin()
print("dans exec après exit")
"""

print("avant exec ")
try:
    exec(codexec)
except ExecException as e:
    #grade = (e.score, e.feedback)
    pass
except Exception as e:
    print(" probleme dans l'execution du grader ou du builder")
print("apres exec", grade)

