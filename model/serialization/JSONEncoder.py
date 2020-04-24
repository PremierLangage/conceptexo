import json
import jsonpickle
import sympy
import sympy2latex

class CustomEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, (sympy.Basic, sympy.Matrix)):
            return 0
            return {'__SymPy__': True, 'srepr': sympy.srepr(obj), 'latex': sympy.latex(obj)}
        return jsonpickle.encode(obj, unpicklable=False)

class CustomDecoder(json.JSONDecoder):
    def __init__(self, *args, **kwargs):
        json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)

    def object_hook(self, dict):
        if '__SymPy__' in dict:
            return sympy.sympify(dict['srepr'], evaluate=False)
        return dict

