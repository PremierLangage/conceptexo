#!/usr/bin/env python3
# coding: utf-8

# ****************************************************************************
#    Copyright (C) 2020 Nicolas Borie <nicolas.borie at univ-eiffel dot fr>
#
#           Distributed under the terms of the CC-BY-SA 4.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#    The full text of the CC-BY-SA 4.0 is available at:
#
#          https://creativecommons.org/licenses/by-sa/4.0/legalcode
# ****************************************************************************

# CYOA : Choose Your Own Adventure (Gamebook)

from sandboxio import output, get_context, get_answers
from components import RadioGroup

if __name__ == "__main__":
    context = get_context()
    answers = get_answers()

    context['current_step'] = context['group'].selection
    context['text'] = str(context['game_data'][context['current_step']][1])
    context['form'] = ' {{ group|component }} '
    context['group'] =  RadioGroup( items=[] )
    context['group'].items = []
    for step_to in context['game_data'][context['current_step']][2]:
        index_step_to = step_to[0]
        text_step_to = step_to[1]
        context['group'].items.append({ "id" : index_step_to, "content" : text_step_to })

    output(-1, " ", context)
