import uuid
import random as rd
from components import Component
from scipy.stats import kendalltau

class CustomSortList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-sort-list'
        self.decorator = 'CustomSortList'
        self.items = []
        self._order = []
        self._feedback = {}
        super().__init__(**kwargs)

    def loadlist(self,lst):
        self.items = []
        self._order = []
        self._feedback = {}
        for item in lst:
            id = str(uuid.uuid4())
            if isinstance(item,tuple):
                self._feedback[id]=item[1]
                self.items.append({"id": id,"content": item[0]})
            else:
                self.items.append({"id": id,"content": item})
            self._order.append(id)
        rd.shuffle(self.items)

    def eval(self):
        errors = 0
        n=len(self.items)
        orderans= [self._order.index(e['id']) for e in self.items]
        for i, e in enumerate(self.items):
            id=e['id']
            if id == self._order[i]:
                e['css'] = 'success-state animated fadeIn'
                css_state="success"
            else:
                e['css'] = 'error-state animated fadeIn'
                css_state="danger"
                errors += 1
            if id in self._feedback:
                e['content']=  """<div class="d-flex justify-content-between align-items-center">
                    <span class="badge badge-%s"> %s </span>
                    <a href="#" onclick="event.preventDefault()" data-toggle="tooltip" class="alert-%s alert-link" title="%s"> % s </a>
                    <span></span>
                </div>""" % (css_state,str(1+self._order.index(e['id'])), css_state,self._feedback[id],e['content'])
            else:
                e['content']=  """<div class="d-flex justify-content-between align-items-center">
                    <span class="badge badge-%s"> %s </span>
                    <span> %s </span>
                    <span></span>
                </div>""" % (css_state,str(1+self._order.index(id)),e['content'])

        tau,_=kendalltau(orderans,list(range(n)))
        score=int(round(max([0,tau])*100))
        self.disabled=False
        return (score,"")



# grading
# texte qui bouge quand on déplace un item
# lien du tooltip qui ouvre la racine du site
# disabled qui désactive le tooltip
# extrajs


