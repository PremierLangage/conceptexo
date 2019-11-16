extends = /template/basic.pl

title = Histogramme (statique)

jxg =: JSXGraphComponent

jxg.attributes %=
{"boundingbox" : [-1,10,5,-1],
"showNavigation" : false,
"keepaspectratio" : false}
==

extracss==
<style>
.jsxgraph-component {
    max-width:250px;
    width:90vw;
    max-height:250px;
    height:90vw;
    margin: 0 auto;
}
</style>
==

jxg.script ==
var a = board.create('chart', [5,7,4,9], {chartStyle:'bar',color:'blue',width:0.6});
==

text ==
{{ jxg | component }}
==
