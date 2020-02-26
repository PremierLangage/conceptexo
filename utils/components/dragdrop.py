from components import Component
from random import shuffle
from uuid import uuid4

class CustomDragDrop(Component):

    def __init__(self, **kwargs):
        self.selector = 'c-drag-drop'
        self.decorator = 'CustomDragDrop'
        self.content = ""
        self.group_id = ""
        self.cloneable_label = False
        super().__init__(**kwargs)

    @classmethod
    def Drop(cls, **kwargs):
        return cls(id=str(uuid4()), droppable=True, **kwargs)

    @classmethod
    def Label(cls, **kwargs):
        return cls(id=str(uuid4()), droppable=False, **kwargs)

    @classmethod
    def Drops(cls, arg, **kwargs):
        if isinstance(arg,int):
            return [cls.Drop(**kwargs) for i in range(arg)]
        if isinstance(arg,list):
            return [cls.Drop(content=content,**kwargs) for content in arg]

    @classmethod
    def Labels(cls, arg, **kwargs):
        if isinstance(arg,int):
            return [cls.Label(**kwargs) for i in range(arg)]
        if isinstance(arg,list):
            return [cls.Label(content=content,**kwargs) for content in arg]

    @staticmethod
    def eval(drop, sol, display=True, grading="CorrectItems", disabled=True):
        feedback=""
        score=100
        for i in range(len(drop)):
            if drop[i].content==sol[i]:
                drop[i].css = "success-state"
            else:
                score=0
                drop[i].css = "error-state"
            drop[i].disabled = True
        return (score,feedback)


class DragDropGroup():

    def __init__(self, **kwargs):

        self.id = str(uuid4()) # generates a random id for the group
        self.labels = []
        self.drop_zones = []
        self.labels_cloneable = True
        self.valid_associations = [] # Records which label can be dropped on which drop_zone
        self.grade_by_labels = True# If true means each label should be dropped on some drop_zone, otherwise that each drop zone should be populated
        
        if 'id' in kwargs: # comes first because id is copied in labels and drop_zones
            self.id = kwargs['id']
        if 'labels_cloneable' in kwargs: # comes first because labels_cloneable is translated in labels and drop_zones
            self.labels_cloneable = kwargs['labels_cloneable']
        if 'labels' in kwargs:
            self.set_labels(kwargs['labels'])
        if 'drop_zones' in kwargs:
            self.set_drop_zones(kwargs['drop_zones'])
        if 'valid_associations' in kwargs:#format of an association: {'label':}
            self.set_associations(kwargs['valid_associations'])
        if 'grade_method' in kwargs:
            self.set_grade_method(kwargs['grade_method'])

    def set_labels(self, labels):
        self.labels = labels
        for label in self.labels: 
            label.group_id = self.id
            label.cloneable_label = self.labels_cloneable

    def set_drop_zones(self, drop_zones):
        self.drop_zones = drop_zones
        for drop_zone in drop_zones:
            drop_zone.group_id = self.id
            drop_zone.cloneable_label = False

    def set_associations(self, valid_associations):
        self.valid_associations = valid_associations

    def set_grade_method(self, grade_method):
        if grade_method != 'labels': 
            self.grade_by_labels = False
        else self.grade_by_labels= True

    def shuffle_labels(self): # It doesn't seem necessary to shuffle drop_zones.
        shuffle(self.labels)

    
        

    






