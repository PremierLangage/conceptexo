import random as rd
from uuid import uuid4
from components import Component

class CustomCheckbox(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-checkbox-group'
        self.decorator = 'CustomCheckbox'
        if 'content' in kwargs:
            self.loaditems(kwargs['content'])
        if 'sol_index' in kwargs:
            self.setsol_by_index(sol_index)
        if 'sol_content' in kwargs:
            self.setsol_by_content(sol_content)
        if 'shuffle' in kwargs and kwargs['shuffle']:
            self.shuffle()
        # ajouter right/wrong et sort
        super().__init__(**kwargs)

    def setitems(self, contents):
        """
        Load items in the component.
        """
        self.items = [{"id": uuid4(), "content": content} for content in contents]

    def setsol_from_index(self, index):
        """
        Set the component solutions from a list of indices.
        """
        if isinstance(index,list):
            self._sol = [self.items[i]['id'] for i in index]
        elif isinstance(index,int):
            self._sol = [self.items[index]['id']]

    def setsol_from_content(self, content):
        """
        Set the component solutions from a list of contents.
        """
        if isinstance(index,list):
            self._sol = [id for id in self.items if self.items['content'] in content]
        elif isinstance(index,str):
            self._sol = [next(item['id'] for item in self.items if item['content'] == content)]

    def setdata_from_right_wrong(self, right, wrong, nitems=None, nright=None):
        """
        Set items and solutions from lists of right and wrong items.
        """
        if nitems is None:
            nitems = len(right)+len(wrong)
        if nright is None:
            nright = len(right)

        self.setitems(rd.sample(right,nright)+rd.sample(wrong,nitems-nright))

        self.setsol_from_index(list(range(nright)))

        self.shuffle()

    def shuffle(self):
        """
        Shuffle the component items.
        """
        rd.shuffle(self.items)

    def sort(self):
        """
        Sort the component items.
        """
        self.items.sort(key = lambda item : item['content'])

    def eval(self, display=True, grading="RightMinusWrong", disabled=True):
        """
        Evaluate the answer stored in the component.
        """
        right,wrong,missed=0,0,0

        for item in self.items:
            id = item['id']
            if id in self._sol and item['checked']:
                right += 1
                if display:
                    item['css'] = 'success-state icon-check-after'
            elif id not in self._sol and item['checked']:
                wrong += 1
                if display:
                    item['css'] = 'error-state icon-times-after'
            elif id in self._sol and not item['checked']:
                missed += 1
                if display:
                    item['css'] = 'icon-check-after'
                          
        if grading == "AllOrNothing":
            if wrong == 0 and right == 0:
                score = 100
            else:
                score = 0
        elif grading == "RightMinusWrong":
            if right+missed != 0:
                score = max([round((right-wrong)/(right+missed)*100),0])
            else:
                if wrong == 0:
                    score = 100
                else:
                    score = 0              
        elif grading == "CorrectAnswers":
            nitems = len(self.items)
            score = max([round((nitems-2*(wrong+missed))/nitems*100),0])

        if disabled:
            self.disabled = True

        return score




def all_or_nothing(nbright=0, nbwrong=0, nbsol=1, nbitems=1):
    if nbwrong == total:
        return 100
    else:
        return 0

def right_minus_wrong(num_right=0, num_wrong = 0, total = 1):
    return max([round(num_right-num_wrong)/total*100),0])

def correct_items(num_right=0, num_wrong = 0, total = 1):
    return max([round(num_right-num_wrong)/total*100),0])
