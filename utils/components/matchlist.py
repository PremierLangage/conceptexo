import random as rd
from uuid import uuid4
from components import Component
from scoring import *

class CustomMatchList(Component):
    def __init__(self, **kwargs):
        self.selector = 'c-match-list'
        self.decorator = 'CustomMatchList'
        self.nodes = []
        self._sol = []
        super().__init__(**kwargs)

    def setitems(self, sources, targets):
        """
        Set source items and target items.
        """ 
        for source in sources:
            self.nodes.append({
                "id": str(uuid4()),
                "content": source,
                "source": True
            })
        for target in targets:
            self.nodes.append({
                "id": str(uuid4()),
                "content": source,
                "target": True
            })

    def setdata_from_matches(self, matches):
        """
        Load matched pairs of items in the component.
        """ 
        self.nodes = []
        self._sol = []
        for source, target in matches:
            sourceid = str(uuid4())
            targetid = str(uuid4())
            self.nodes.append({
                "id": sourceid,
                "content": source,
                "source": True
            })
            self.nodes.append({
                "id": targetid,
                "content": target,
                "target": True
            })
            self._sol.append({'source': sourceid, 'target': targetid})
        rd.shuffle(self.nodes)

    def eval(self, display=True, scoring="RightMinusWrong", disabled=True):
        """
        Evaluate the answer stored in the component.
        """ 
        nbright, nbwrong = 0, 0
        rightsource = []
        for link in self.links:
            if {'source': link['source'], 'target': link['target']} in self._sol:
                rightsource.append(link['source'])

        for node in self.nodes:
            if 'source' in node and node['source']:
                if node['id'] in rightsource:
                    node['css'] = 'success-state icon-check-before'
                    nbright += 1
                else:
                    node['css'] = 'error-state icon-times-before'
                    nbwrong += 1

        if scoring == "AllOrNothing":
            score = all_or_nothing(nbright, nbwrong)
        elif scoring == "RightMinusWrong":
            score = right_minus_wrong(nbright, nbwrong, nbsol=len(self._sol))          
        elif scoring == "CorrectItems":
            score = correct_items(nbright, nbwrong, nbitems=len(self.items))
        elif scoring == "Custom":
            score = custom_scoring(nbright, nbwrong, nbsol=len(self._sol), nbitems=len(self.items))
        else:
            raise ValueError(f"'{scoring}' is not a valid scoring")

        return score



