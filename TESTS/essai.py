

# Objectif faire un essai de la syntaxe de workflow

from workflow.engine import GenericWorkflowEngine
my_engine = GenericWorkflowEngine()


from functools import wraps

def print_name(obj, eng):
    print(obj.name)

def toggle_case_name(toupper=True):
    @wraps(toggle_case_name)
    def _wrap(obj,eng):
        s:string=  obj.name
        obj.name = s.upper() if toupper else s.lower() 
    return _wrap

myworkflotdef = [
    print_name,
    toggle_case_name(toupper=True),
    print_name,
    toggle_case_name(toupper=False),
    print_name,
]

class MyObject(object):
    def __init__(self, data):
        self.name = data

my_object0 = MyObject("ArATmhdf")
my_object1 = MyObject("JQLEZKJRljazae")


my_engine.callbacks.replace( myworkflotdef)

my_engine.process([my_object0, my_object1, MyObject("Ali baba et les 40 voleurs")])