import uuid
from components import Component
import random as rd
from scipy.stats import kendalltau

class CustomSortList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-sort-list'
        self.decorator = 'CustomSortList'
        self.items = []
        self.grading =[]
        self._order = []
        super().__init__(**kwargs)

    def load_items(self,content):
        self.items = []
        self._order = []
        for i in range(len(content)):
            id = str(uuid.uuid4())
            self.items.append({
                "id": id,
                "content": content[i]
            })
            self._order.append(id)
        rd.shuffle(self.items)

    def eval(self):
        errors = 0
        n=len(self.items)
        orderans= [self._order.index(e['id']) for e in self.items]
        for i, e in enumerate(self.items):
            if e['id'] == self._order[i]:
                e['css'] = 'success-state animated fadeIn'
                cssbadge="badge-success"
            else:
                e['css'] = 'error-state animated fadeIn'
                cssbadge="badge-danger"
                errors += 1
            
            e['content']=  """<div class="d-flex justify-content-between align-items-center">
                <span class="badge %s"> %s </span>
                <span> <a href="#" data-toggle="tooltip" title="Some tooltip text!"> % s </a> </span>
                <span></span>
            </div>""" % (cssbadge,str(1+self._order.index(e['id'])),e['content'])
            
        tau,_=kendalltau(orderans,list(range(n)))
        score=int(round(max([0,tau])*100))
        self.disabled=False
        return (score,"")









