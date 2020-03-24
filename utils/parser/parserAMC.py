
def parse_AMC_TXT(txt):
    questions = []
    pending = False
    i = -1
    comp = []
    statement = []
    for line in txt.splitlines()+['']:
        line = line.strip()
        if line.startswith('*'):
            k = 0
            index = []
            items = []
            pending = True
            i += 1
            if line.startswith('**'):
                question_type = "Checkbox"
                statement = line[2:].strip()
            else:
                question_type = "Radio"
                statement = line[1:].strip()
        if line.startswith(('+','-')):
            items.append(line[1:].strip())
            if line.startswith('+'):
                index.append(k)
            k += 1
        if line == "" and pending:
            if question_type == "Radio":
                comp.append(CustomRadio())
                index = index[0]
            elif question_type == "Checkbox":
                comp.append(CustomCheckbox())
            comp[i].setitems(items)
            comp[i].setsol_from_index(index)
            comp[i].shuffle()
            pending = False

