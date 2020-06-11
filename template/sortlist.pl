extends = /model/basic.pl

@ /utils/components/sortlist.py [customsortlist.py]

sortlist =: SortList
sortlist.decorator = CustomSortList

form ==
<style>
.sort-item { 
padding: 0px 0px !important;
text-align: left !important;
min-height: 14px !important;
 }
 </style>
{{ sortlist|component }}
==

evaluator ==
grade = sortlist.eval()
sortlist.disabled=True
==

settings.feedback.class = score

