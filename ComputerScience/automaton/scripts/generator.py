#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
#  generator.py
#
#  Copyright 2020 Cisse Mamadou [mciissee@gmail.com]

import uuid
import random
import string

from automaton import Automaton
from components import CheckboxGroup, Input

class Generator:

    @staticmethod
    def alphabet(length: int):
        alphabet = ['' for _ in range(length)]
        while len(set(alphabet)) != length:
            alphabet = ''.join(set("".join(
                random.choice(string.ascii_lowercase)
                for _ in range(length)
            )))
        return alphabet

    @staticmethod
    def regex(regex):
        return Automaton.parse(regex)

    @staticmethod
    def prefix(max_symbs=2, length=4):
        alphabet = Generator.alphabet(max_symbs)
        n = random.randint(2, length)
        prefix =  "".join(
            random.choice(alphabet)
            for _ in range(n)
        )
        suffix = '|'.join(list(alphabet))
        return alphabet, prefix, Automaton.parse(f'{prefix}({suffix})*')

    @staticmethod
    def suffix(max_symbs=2, length=4):
        alphabet = Generator.alphabet(max_symbs)
        n = random.randint(2, length)
        prefix = '|'.join(list(alphabet))
        suffix =  "".join(
            random.choice(alphabet)
            for _ in range(n)
        )
        return alphabet, suffix, Automaton.parse(f'({prefix})*{suffix}')

    @staticmethod
    def factor(max_symbs=2, length=4):
        alphabet = Generator.alphabet(max_symbs)
        n = random.randint(2, length)
        prefix = '|'.join(list(alphabet))
        factor =  "".join(
            random.choice(alphabet)
            for _ in range(n)
        )
        suffix = '|'.join(list(alphabet))
        return alphabet, factor, Automaton.parse(f'({prefix})*{factor}({suffix})*')

    @staticmethod
    def sequence(alphabet_max_length=2, word_max_length=4):
        """
        Return (alphabet, sequence)
        """
        alphabet = Generator.alphabet(alphabet_max_length)
        word_length = random.randint(2, word_max_length)
        word =  "".join(
            random.choice(alphabet)
            for _ in range(word_length)
        )
        return alphabet, word

    @staticmethod
    def counting(max_symbs=2, length=4, mode=0):
        alphabet = Generator.alphabet(max_symbs)
        n = random.randint(2, length)
        letter = random.choice(alphabet)

        anything = '(' + '|'.join(list(alphabet)) + ')*'
        anythingexcept = '(' + '|'.join([e for e in alphabet if e != letter]) + ')*'

        regex = ''
        if mode == 0: # exactly
            regex = anythingexcept + anythingexcept.join([letter for i in range(n)]) + anythingexcept
            pass
        elif mode < 0: # at least
            regex = anything + anything.join([letter for i in range(n)]) + anything
        else: # at most
            regex = anythingexcept + anythingexcept.join([letter + '?' for i in range(n)]) + anythingexcept
        return alphabet, letter, n, Automaton.parse(regex)

    @staticmethod
    def multi_choice_question(automaton: Automaton, maxright=3, maxwrong=3):
        matchingWords = automaton.random_recognized_strings(maxright)
        checkbox = CheckboxGroup()
        checkbox.items = []
        for e in matchingWords:
            checkbox.items.append({
                "id": str(uuid.uuid4()),
                "content": e,
                "multiple": True
            })
        for e in automaton.random_unrecognized_strings(maxwrong):
            checkbox.items.append({
                "id": str(uuid.uuid4()),
                "content": e,
                "multiple": True
            })
        random.shuffle(checkbox.items)
        return checkbox, matchingWords

    @staticmethod
    def transition_table(automaton: Automaton, context: dict):
        def transition_name(state, symb):
            return f"({state}, {symb})"

        head = sorted(list(automaton.alphabet))
        rows = {}
        transitions = {}

        for state in sorted(automaton.states):
            row = []
            for symb in sorted(automaton.alphabet):
                name = transition_name(state, symb)
                transitions[name] = ''
                textinput = Input(value='')
                context[name] = textinput
                row.append(textinput)
            rows[state] = row

        for fromState, toStates in automaton.transitions.items():
            for symb, toState in toStates.items():
                name = transition_name(fromState, symb)
                transitions[name] = toState
 
        return {
            "head": head,
            "rows": rows,
            "transitions": transitions
        }








