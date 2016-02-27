(function($){
  $( document ).on('ready page:load', function() {

    $('.order-collapse').on('click', function(){
      var id_number = $(this).attr('id').split('-')[0];
      var icon = $(this);
      var collapse_element_id = id_number + '-order-panel-body';
      var collapse_element = $('#'+collapse_element_id);
      collapseSingle(icon, collapse_element);
    });

    function collapseSingle(icon, collapse_element) {
      var $icon = icon;
      var $collapse_target = collapse_element;
      if ($collapse_target.is(':visible')) {
        $collapse_target.hide('');
        $icon.removeClass('fa-minus-square-o').addClass('fa-expand');
      } else {
        $icon.removeClass('fa-expand').addClass('fa-minus-square-o');
        $collapse_target.show('');
      }
    };
  });
})(jQuery);


