class question:
    def __init__(self,lst):
        self.text = lst[1]
        self.answer = lst[2]+";"
        self.ordered = (lst[3] == "True")
        self.numbered = (lst[4] == "True")
#        self.ordered = lst[3]
#        self.numbered = lst[4]

def question_to_dic(question_path):
    question_file = open(question_path, "r")
    output = {}
    for line in question_file:
        line = line.strip('\n')
        lst = line.split(";")
        if len(lst) <= 1:
            break
        if int(lst[0]) not in output:
            output[(int(lst[0]))] = []
        output[int(lst[0])].append(question(lst))
    question_file.close()
    return output






