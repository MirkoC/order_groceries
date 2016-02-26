$( document ).ready(function() {
  var icon = $('.users-collapse');
  var collapse_element = $('.users-panel-body');
  Collapse(icon, collapse_element);
});

function Collapse(icon, collapse_element) {
  icon.on('click', function(ev){
    var $icon = $(this);
    var $collapse_target = collapse_element;
    if ($collapse_target.is(':visible')) {
      $collapse_target.hide('');
      $icon.removeClass('fa-minus-square-o').addClass('fa-expand');
    } else {
      $icon.removeClass('fa-expand').addClass('fa-minus-square-o');
      $collapse_target.show('');
    }
  });
};