
#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from sandboxio import get_context

import utils

class StopBeforeExec(Exception):
    pass


def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n    ...\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    output_json = sys.argv[2]
    
    dic = get_context()


    import os 
    if not os.path.isfile("data.csv"):
        msg = ("ce type d'exercice utilise un fichier de données csv : data.csv\n"
               +"vous pouvez l'indiqer sous la forme suivante\n"
               +"@ monfichier.csv [data.csv] ")
        print(msg, file=sys.stderr)
        sys.exit(1)
    delimiter = dic['delimiter'] if 'delimiter' in dic else ","
    if "columns" in dic :
        cols=dic['columns'].split(delimiter)
    else:
        with open("data.csv") as csvfile:
            reader = csv.reader(csvfile)
            i = next(reader)
        cols=(i[0],i[1])
    
    
    dic['answer'],dic['items']=  utils.builditemsandanswer("data.csv",number=dic.get("number",4),columns=cols,delimiter=delimiter)


        

    if 'before' in dic:
        glob = {}
        dic['StopBeforeExec'] = StopBeforeExec
        print(add_try_clause(dic['before'], StopBeforeExec), file=sys.stderr)
        exec(add_try_clause(dic['before'], StopBeforeExec), dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]

    if "debug" in dic:
        dic['text']+= str(dic['answer'])


    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)



