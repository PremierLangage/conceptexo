import uuid
import random as rd
from components import Component

class Checkbox(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-checkbox-group'
        self.decorator = 'CustomCheckboxGroup'
        self.content = {}
        self.items = []
        self._sol = []
        super().__init__(**kwargs)

    def setsol(self,index):
        self._sol=[self.items[i]['id'] for i in index]

    def setsol_bycontent(self,content):
        self._sol=[item['id'] for item in self.items if item['content'] in content]

    def loaditems(self, lstcontent):
        for content in lstcontent:
            self.items.append({"id": str(uuid.uuid4()),"content": content})

    def loadrightwrong(self, right, wrong, nchoices, nright):
        self.loaditems(rd.sample(right,nright)+rd.sample(wrong,nchoices-nright))
        self.set_sol_by_index(list(range(nright)))
        self.shuffle()

    def shuffle(self):
        rd.shuffle(self.items)

    def sort(self):
        rd.sort(self.items)

    def eval(self,**kwargs):
        checkright,checkwrong,missright=0,0,0
        for item in self.items:
            if item['id'] in self._sol and item['checked']:
                item['css'] = 'success-state'
                item['content'] = self.content[item['id']] + r"<span class='fas fa-check' style='padding-left: 1em'></span>"
                checkright+=1
            elif item['id'] in self._sol and not item['checked']:
                item['content'] = self.content[item['id']] + r"<span class='fas fa-check' style='padding-left: 1em'></span>"
                missright+=1
            elif not (item['id'] in self._sol) and item['checked']:
                item['css'] = 'error-state'
                item['content'] = self.content[item['id']] + r"<span class='fas fa-times' style='padding-left: 1em'></span>"
                checkwrong+=1

        if grading=="AllOrNothing":
            if checkwrong==0 and missright==0:
                score=100
            else:
                score=0
        elif grading=="RightMinusWrong":
            if checkright+missright==0:
                if checkwrong==0:
                    score=100
                else:
                    score=0
            else:
                score=max([round((checkright-checkwrong)/(checkright+missright)*100),0])
        elif grading=="CorrectAnswers":
            nitems=len(self.items)
            score=max([round((nitems-2*(checkwrong+missright))/nitems*100),0])
        self.disabled=True
        return (score,"")



