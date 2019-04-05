#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from jinja2 import Template
import random

def render_input_config(dic):
    for name,config in dic['input'].items():
        for key in config:
            config[key]=Template(config[key]).render(dic)

def build_head(dic):
    head=""
    for name,config in dic['input'].items():
        input_type=config['type']
        head+=dic[input_type+'_head']
    return head

def build_form(form_template,dic):
    form_context={}
    for name,config in dic['input'].items():
        input_type=config['type']
        if input_type+'_process_config' in dic:
            exec(dic[input_type+'_process_config'])
        config['name']=name
        state = {'inputmode':'initial'}
        input_context={**config,**state}
        form_context['input_'+name]=Template(dic[input_type+'_template']).render(input_context)
    return Template(form_template).render(form_context)

class StopBeforeExec(Exception):
    pass


def add_try_clause(code, excpt):
    """Add a try/except clause, excepting 'excpt' around code."""
    code = code.replace('\t', '    ')
    return ("try:\n" + '\n'.join(["    " + line for line in code.split('\n')])
            + "\nexcept " + excpt.__name__ + ":\n    pass")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    input_json = sys.argv[1]
    output_json = sys.argv[2]
    
    with open(input_json, "r") as f:
        dic = json.load(f)
    
    if 'before' in dic:
        glob = {}
        dic['StopBeforeExec'] = StopBeforeExec
        code=""
        if 'headbefore' in dic:
            code+=dic['headbefore']+ '\n'
        code+=dic['before']+ '\n'
        if 'footerbefore' in dic:
            code+=dic['footerbefore']
        exec(add_try_clause(code, StopBeforeExec), dic)
        exec("", glob)
        for key in glob:
            if key in dic and dic[key] == glob[key]:
                del dic[key]

    if 'maxattempt' not in dic:
        dic['maxattempt']=1

    dic['nbattempt']=0

    dic['inputmode'] = "initial"    

    render_input_config(dic)

    dic['form0']=dic['form']+"\n <div style='width:100%;height:200px;'></div>"

    dic['head']=build_head(dic)
    
    dic['form']=dic['head']+build_form(dic['form0'],dic)


    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(dic, unpicklable=False))
    
    sys.exit(0)
