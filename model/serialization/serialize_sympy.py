from sympy import Basic, Tuple, sympify, srepr
from sympy2latex import latex

def deserialize(arg):
    if isinstance(arg, dict) and 'serialize' in arg and arg['serialize'] == "SymPy" :
        return sympify(arg['srepr'], evaluate=False)
    elif isinstance(arg, dict):
        return {k: deserialize(v) for k, v in arg.items()}
    elif isinstance(arg, list):
        return list(map(deserialize,arg))
    elif isinstance(arg, tuple):
        return tuple(map(deserialize,arg))
    else:
        return arg

def serialize(arg):
    if isinstance(arg, Basic):
        try:
            codelatex = latex(arg)
        except:
            codelatex = ""
        return {'serialize': 'SymPy', 'srepr': srepr(arg), 'latex': codelatex}
    elif isinstance(arg,dict):
        return {k: serialize(v) for k, v in arg.items()}
    elif isinstance(arg,list):
        return list(map(serialize,arg))
    elif isinstance(arg,(tuple,Tuple)):
        return tuple(map(serialize,arg))
    else:
        return arg






