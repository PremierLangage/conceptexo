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
#  The full text of the CC-BY-SA 4.0 is available at:
#
#          https://creativecommons.org/licenses/by-sa/4.0/legalcode
# ****************************************************************************

# CYOA : Choose Your Own Adventure (Gamebook)

# This builder mainly parse the python game_data_file...

import sys
import json

ParseGameData(file_data):
    return eval(file_data.read())

if __name__ == "__main__":
    """
    This programm generate a nice Multiple Choice formulary from the context 
    exercice. The MCQ is mainly build from a file specified by key 
    `data_from_file` inside the exercise.
    """
    with open(sys.argv[1],'r') as f:
        context = json.load(f)

    # Here is the name of the file containing all story steps
    file_data_name = context['game_data_file']
        
    if file_data_name == "None":
        context['text'] = ("This exercice does not use the CYOA template correctly. "
        "A game_data_file should have been provided when inheriting from the CYOA "
        "template. After, this text shoud no more appear.")
        sys.exit(1)
    
    # The parsing is done here
    with open(file_data_name, "r") as file_data :
        game_data = ParseGameData(file_data)
    context['game_data'] = game_data

    with open(sys.argv[2], 'w+') as f:
        json.dump(context, f)
        
    sys.exit(0)

