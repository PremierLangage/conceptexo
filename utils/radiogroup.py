import uuid

from components import Component

class CustomRadioGroup(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-radio-group'
        self.decorator = 'CustomRadioGroup'
        self.items = []
        super().__init__(**kwargs)

    def loadContent(self, content):
        items = []
        for e in content:
            items.append({
                "id": uuid.uuid4(),
                "content": e
            })
        self.items = items

    def evalByContent(self,sol):
        score = 0
        selectedId = self.selection
        for e in self.items:
            if e['content'] == sol:
                e['css'] = 'success-state'
                if e['id'] == selectedId:
                    score = 100
            elif e['id'] == selectedId:
                score = 0
                e['css'] = 'error-state'
        return score, ""
