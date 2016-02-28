(function($){
  $( document ).on('ready page:load', function() {
    var icon = $('.users-collapse');
    var collapse_element = $('.users-panel-body');
    Collapse(icon, collapse_element);

    var icon = $('.institutions-collapse');
    var collapse_element = $('.institutions-panel-body');
    Collapse(icon, collapse_element)
    function Collapse(icon, collapse_element) {
      icon.on('click', function(ev){
        var $icon = $(this);
        var $collapse_target = collapse_element;
        if ($collapse_target.is(':visible')) {
          $collapse_target.hide('');
          $icon.removeClass('fa-minus-square-o').removeClass('hvr-pulse-shrink').addClass('fa-expand').addClass('hvr-pulse-grow');
        } else {
          $icon.removeClass('fa-expand').removeClass('hvr-pulse-grow').addClass('fa-minus-square-o').addClass('hvr-pulse-shrink');
          $collapse_target.show('');
        }
      });
    };
  });
})(jQuery);


