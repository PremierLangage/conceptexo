extends = /model/basic.pl

title = Changer le style des items

radio =: RadioGroup
radio.decorator = CustomRadio
radio.css = myclass

before ==
radio.setitems(["AAA", "BBB", "CCC", "DDD"])
radio.setsol_from_index(0)
==

text ==
==

form ==
{{ radio|component }}
==

evaluator ==
score = radio.eval()
==

extracss ==
<style>
.myclass {
    padding: 4px 4px 4px 4px !important;
}
</style>
==

