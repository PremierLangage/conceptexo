@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]
@ /builder/before.py [builder.py]

before== #|python|
==

title== #|html|
Démo GeoGebra
==

text== #|html|
Tracer un cercle de rayon 2.
==

form==
<div id="applet_container"></div>
        <input value="Set point A invisible" onclick="ggbApplet.setVisible('A', false)" type="button">
        <input value="Set point A visible" onclick="ggbApplet.setVisible('A', true)" type="button">       
==

evaluator== #|python|
grade = (100, 'OK')
==

extrajs==
<script type="text/javascript" src="https://cdn.geogebra.org/apps/deployggb.js"></script>
<script type="text/javascript">
        var parameters = {"prerelease":false,"width":600,"height":450,"showToolBar":true,"borderColor":null,"showMenuBar":false,"showAlgebraInput":false,
        "showResetIcon":true,"enableLabelDrags":false,"enableShiftDragZoom":true,"enableRightClick":false,"capturingThreshold":null,"showToolBarHelp":false,
        "errorDialogsActive":true,"useBrowserForJS":false};
var applet = new GGBApplet('5.0', parameters,true);

window.onload = function() {
        applet.inject('applet_container');
        }
</script>

<script type="text/javascript"> 
function evalInput(strInput) {
  ggbApplet.evalCommand(strInput);
  return false;
}
</script>
==





