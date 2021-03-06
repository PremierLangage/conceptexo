# coding: utf-8

import sys, json, jsonpickle
from components import Component

class BasicEncoder(json.JSONEncoder):
    def default(self, obj):
        return jsonpickle.Pickler(unpicklable=False).flatten(obj)

def load_context(cls=None):
    """Return the dictionnary containing the context of the exercise."""
    with open(sys.argv[1], "r") as f:
        context = json.load(f, cls=cls)
    Component.sync_context(context)
    return context

def dump_context(cls=None):
    """Return the dictionnary containing the context of the exercise."""
    with open(sys.argv[1], "r") as f:
        context = json.load(f, cls=cls)
    Component.sync_context(context)
    return context


def output(grade, feedback, context=None):
    """Used to output the grade, feedback and context to the sandbox.
    
    Parameters:
        grade - (int) Grade of the student. Should be an integer or implementing __int__.
        feedback - (str) Feedback shown to the student. Should be a str or implementing __str__.
        context - (dict - optionnal) Modified context of the exercise."""
    with open(sys.argv[3], "w+") as f:
        f.write(jsonpickle.encode(context if context else get_context(), unpicklable=False))
    
    with open(sys.argv[4], "w+") as f:
        print(str(feedback), file=f)
    
    print(int(grade))
    
    sys.exit(0)













