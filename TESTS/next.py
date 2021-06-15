#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle

import platon

def makepayload(dic):
    """
    Objectif réduire la taille du dict retourné au front.
    """
    d={}
    for key in dic.keys():
        # pas de code 
        if key.endswith(".py"): 
            continue
        # pas les settings 
        if key=="settings":
            continue
        # pas les variables "_privées" 
        if key.startswith("_"):
            continue
        d[key]= dic[key]
    return d

if __name__ == "__main__":
    if len(sys.argv) < 4:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 next.py [input_json] [output_json] [result_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    input_json = sys.argv[1]
    output_json = sys.argv[2]
    result_json = sys.argv[3]

    
    with open(input_json, "r") as f:
        dic = json.load(f)
    
    if 'next' in dic:
        exec(dic['next'], dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]
    else:
        print(("No default start script. Please define a start script."),
              file = sys.stderr)
        sys.exit(1)
    
    ploaddic = makepayload(dic)
    with open(result_json,"w+") as pload:
        pload.write(jsonpickle.encode(ploaddic, unpicklable=False))

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)

