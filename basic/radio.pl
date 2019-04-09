@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]
@ /input/inputlib.py [inputlib.py]
radio_template =@ /input/radio/template.html
radio_process_config =@ /input/radio/process_config.py
radio_head =
radio_process_answer =@ /input/radio/process_answer.py

title = Champ de réponse radio

lang = fr

text ==
Quelle est la capitale de la Lettonie ?
==

form ==
{{input_1}}

<style>
body.dragging, body.dragging * {
  cursor: move !important;
}

.dragged {
  position: absolute;
  opacity: 0.5;
  z-index: 2000;
}


ol.example li.placeholder {
  position: relative;
  /** More li styles **/
}
ol.example li.placeholder:before {
  position: absolute;
  /** Define arrowhead **/
}
</style>
<ol class='example'>
  <li>First</li>
  <li>Second</li>
  <li>Third</li>
</ol>
<script src='js/jquery-sortable.js'></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-sortable/0.9.13/jquery-sortable.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-sortable/0.9.13/jquery-sortable-min.js"></script>

<script>
$(function  () {
  $("ol.example").sortable();
});

var adjustment;

$("ol.simple_with_animation").sortable({
  group: 'simple_with_animation',
  pullPlaceholder: false,
  // animation on drop
  onDrop: function  ($item, container, _super) {
    var $clonedItem = $('<li/>').css({height: 0});
    $item.before($clonedItem);
    $clonedItem.animate({'height': $item.height()});

    $item.animate($clonedItem.position(), function  () {
      $clonedItem.detach();
      _super($item, container);
    });
  },

  // set $item relative to cursor position
  onDragStart: function ($item, container, _super) {
    var offset = $item.offset(),
        pointer = container.rootGroup.pointer;

    adjustment = {
      left: pointer.left - offset.left,
      top: pointer.top - offset.top
    };

    _super($item, container);
  },
  onDrag: function ($item, position) {
    $item.css({
      left: position.left - adjustment.left,
      top: position.top - adjustment.top
    });
  }
});
</script>
==

input.1.type = radio

input.1.shuffle = no

input.1.choices ==
Tallin
Riga
Vilnius
==

input.1.numsol = 1

evaluator ==
if answer['1']==1:
    score=100
else:
    score=0
==


