from sympy import *
from random import random as rd
from utilsmath import *
from json import load
json_file = open('keyboards.JSON') as :  
keyboards_JSON = load(json_file)
json_file.close()

env = globals().copy()
