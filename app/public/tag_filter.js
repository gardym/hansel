define(['jquery'], function($) {
  $(function() {
    $('.filter-tag').on('click', function() {
      $('li.gist').hide();
      $('li.gist[data-tags*=' + $(this).text() + ']').show();
    });
  });
});
