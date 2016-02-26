$( document ).ready(function() {

  $('.users-collapse').on('click', function(ev){
    var $icon = $(this);
    var $collapse_target = $('.users-panel-body');
    if ($collapse_target.is(':visible')) {
      $collapse_target.hide('');
      $icon.removeClass('fa-minus-square-o').addClass('fa-expand');
    } else {
      $icon.removeClass('fa-expand').addClass('fa-minus-square-o');
      $collapse_target.show('');
    }
  });

});