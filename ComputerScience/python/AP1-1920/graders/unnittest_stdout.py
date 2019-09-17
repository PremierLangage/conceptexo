#!/usr/bin/env python3
# coding: utf-8
#
# Author:
#   Coumes Quentin <coumes.quentin@gmail.com>
#


import re
import shlex
import subprocess
import sys

import sandboxio



class Grader:
    """Grader for python exercises."""
    
    
    def __init__(self, context, answers):
        self.context = context
        self.answers = answers
        
        if "student_file" not in self.context:
            self.context["student_file"] = "student.py"
        
        try:
            key = self.context["editor"]["id"]
        except KeyError:
            print("'editor.id' was not found in the context", file=sys.stderr)
            sys.exit(1)
        
        try:
            self.code = self.answers[key]
        except KeyError:
            print(
                "answer corresponding to 'editor.id' (currently '" + key + "') was not found.<br/>"
                + "This is probably that none of your <input></input> in 'form' have "
                + "'form_'" + key + "' as id.",
                file=sys.stderr)
            sys.exit(1)
    
    
    def taboo(self):
        """Returns the list the words in the iterable 'taboo' (if it exists in the context)
        that are used by the student code."""
        if "taboo" not in self.context:
            return []
        
        taboos = [t for t in self.context["taboo"].split(" ") if t and t != "\n"]
        
        
        def tabooed(t):
            """Return True if t is a word of self.student_code, False otherwise."""
            return re.compile(r"\W" + t + r"\W").search(self.code) is not None
        
        
        return [t for t in taboos if tabooed(t)]
    
    
    def run_tests(self):
        """Execute a tests for each line in the key 'stdout_tests' (if declared) where each line
        must be a list of arguments using a shell-like syntax.

        The first and second arguments of each line must be the respectively the name of the test
        and the expected output, any other argument will be given to the student's program.

        If the line start with the character '!', the test will be set as hidden (only the name is
        displayed in the feedback).

        Returns a list containing a dict {name, hidden, expected, args, returncode, out, err} for
        each test where:
            - 'name' is the name of the test.
            - 'hidden' is True if the test was set as hidden, False otherwise.
            - 'expected' is the expected output on stdout.
            - 'args' is a list of arguments given to the student's program (may be an empty list).
            - 'returncode' code returned by the student's program.
            - 'out' received stdout (may be an empty string).
            - 'err' received stderr (may be an empty string).

        Returns an empty list if the key 'stdout_tests' was not found.

        E.G.:
        With a tests key like this:

        stdout_tests==
        "No argument" Hello
        James "Hello James" James
        "2 arguments" "Hello Jhon and James" Jhon James
        !"One argument with space" "Hello Jhon Doe" "Jhon Doe"
        ==

        4 tests will be done:
          - Received 'Hello' on stdout when executing student's code with no argument
          - Received 'Hello Jhon' when executing student's code with argument 'jhon'
          - Received 'Hello Jhon and James' with arguments 'jhon james'
          - Received 'Hello Jhon Doe' with argument '"jhon Doe"'

        Returned list could be something like:
        [
          {
            "name": "No argument",
            "hidden": False,
            "expected": "Hello",
            "args": [],
            "returncode": 0,
            "out": "Hello",
            "err": "",
          },
          {
            "name": "James",
            "hidden": False,
            "expected": "Hello Jhon",
            "args": ["Jhon"],
            "returncode": 0,
            "out": "Hello Jhon",
            "err": "",
          }
          {
            "name": "2 arguments",
            "hidden": False,
            "expected": "Hello Jhon and James",
            "args": ["Jhon", "James"],
            "returncode": 0,
            "out": "Hello JhonandJames",  # [Student forgot spaces]
            "err": "",
          }
          {
            "name": "One argument with space",
            "hidden": True,
            "expected": "Hello Jhon Doe",
            "args": ["Jhon Doe"],
            "returncode": 1,  # Student's code didn't execute properly
            "got": "",
            "err":
              'Exception in thread "main" java.lang.NullPointerException\nat Temp.main(Temp.java:7)'
          }
        ]
        """
        
        if "stdout_tests" not in self.context:
            return []
        
        tests = []
        for test in [l for l in self.context["stdout_tests"].split("\n") if l]:
            hidden = False
            if test.startswith("!"):
                hidden = True
                test = test[1:]
            
            args = shlex.split(test)
            if len(args) < 2:
                print("Error: stdout tests must have at least two argument.\n" + test,
                      file=sys.stderr)
            
            name, expected, args = args[0], args[1], args[2:]
            args_str = ' '.join(['"%s"' % a.replace('"', '\\"') for a in args])
            
            cmd = "python3 %s %s" % (self.context["student_file"], args_str)
            p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            out, err = p.communicate()
            
            tests.append({
                "name":       name,
                "hidden":     hidden,
                "expected":   expected,
                "args":       args,
                "returncode": p.returncode,
                "out":        out.decode()[:-1],
                "err":        err.decode(),
            })
        
        return tests
    
    
    def run_unittest(self):
        """Run the key 'unittest' (if declared) with unittest, returning a tuple (grade, feedback)
        corresponding, returns None if the key 'unittest' was not found."""
        if "unittest" not in self.context:
            return None
        
        with open("test.py", "w+") as f:
            f.write(self.context['unittest'])
        
        cmd = "python3 test.py"
        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
        out, err = p.communicate()

        return 0 if p.returncode else 100, err.decode()
    
    
    @staticmethod
    def parse_tests_result(tests):
        """Return a tuple (grade, feedback) where grade is [n successfull test]/[n total test]*100
        and feedback a formated string to display to the student."""
        feedback = ""
        grades = list()
        
        for i, t in enumerate(tests):
            feedback += "Test n°%d - %s%s : " % (i, t["name"], " (hidden)" if t["hidden"] else "")
            
            if t['returncode']:
                feedback += '<span style="color: olive;">Error (an exception occured).</span>'
                grades.append(0)
                if not t["hidden"]:
                    feedback += (
                        ("<br/>Arguments: " + str(t["args"]) if t["args"] else "")
                        + ("<br/>stdout:<br/><pre><code>" + t['out'] + "</pre></code>" if t['out']
                           else "")
                        + ("<br/>stderr:<br/><pre><code>" + t['err'] + "</pre></code>" if t['err']
                           else "")
                    )
            
            elif t['expected'] == t['out']:
                feedback += '<span style="color: green;">Success.</span>'
                grades.append(1)
            
            else:
                feedback += '<span style="color: red;">Failure.</span>'
                grades.append(0)
                if not t["hidden"]:
                    feedback += (
                        ("<br/>Arguments: " + str(t["args"]) if t["args"] else "")
                        + ("<br/>Expected: %s<br/>Got: %s"
                           % (t['expected'], t['out']))
                    )
            
            feedback += "<br/><br/>"
        
        return int(sum(grades) / len(grades) * 100), feedback
    
    
    @classmethod
    def grade(cls, context, answers):
        """Grade the answers according to context, exiting the script through sandboxio.output()."""
        grader = cls(context, answers)
        
        path = grader.context["student_file"]
        with open(path, "w+") as f:
            f.write(grader.code)
        
        taboos = grader.taboo()
        if taboos:
            feedback = "These words are disallowed an cannot be used: " + str(taboos)
            sandboxio.output(-1, feedback)
        
        tests = grader.run_tests()
        if tests:
            grade, feedback = cls.parse_tests_result(tests)
            sandboxio.output(grade, feedback)
        
        unit = grader.run_unittest()
        if unit:
            grade, feedback = unit
            feedback = (
                "<pre><code>%s</code></pre>"
                % feedback
            )
            sandboxio.output(grade, feedback)
        
        print("Both of the keys 'stdout_tests' and 'unittest' are missing. At least one must be "
              "present for the Grader to be able to grade the student's answer.", file=sys.stderr)
        sys.exit(1)



if __name__ == "__main__":
    answers = sandboxio.get_answers()
    context = sandboxio.get_context()
    Grader.grade(context, answers)
