import uuid
import random as rd
from components import Component

class Checkbox(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-checkbox-group'
        self.decorator = 'CustomCheckboxGroup'
        self.items = []
        self._sol = []
        super().__init__(**kwargs)

    def setSolByIndex(self,index):
        self._sol=[items[i]['id'] for i in index]

    def loadContent(self, content):
        items = []
        for e in content:
            items.append({
                "id": uuid.uuid4(),
                "content": e
            })
        self.items = items

    def shuffle(self):
        rd.shuffle(self.items)

    def sort(self):
        rd.sort(self.items)

    def evalByContent(self,content):
        ansright,answrong,itemright=0,0,0
        for item in self.items:
            if item['content'] in content and item['checked']:
                item['css'] = 'success-state anim-fade'
                ansright+=1
                itemright+=1
            elif item['content'] in content and not item['checked']:
                item['css'] = 'success-state anim-fade'
                answrong+=1
                itemright+=1
            elif not (item['content'] in content) and item['checked']:
                answrong+=1
        score=max([int((ansright-answrong)/itemright*100),0])
        return(score,"")

    def eval(self):
        ansright,answrong,itemright=0,0,0
        for item in self.items:
            if item['id'] in self._sol and item['checked']:
                item['css'] = 'success-state anim-fade'
                ansright+=1
                itemright+=1
            elif item['id'] in self._sol and not item['checked']:
                item['css'] = 'success-state anim-fade'
                answrong+=1
                itemright+=1
            elif not (item['id'] in self._sol) and item['checked']:
                answrong+=1
        score=max([int((ansright-answrong)/itemright*100),0])
        return(score,"")

