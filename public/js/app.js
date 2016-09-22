$(document).ready(function() {
  $('.container').on('submit', '.upvotes', function(event) {
    event.preventDefault();
    var $form = $(this);
    var url = $form.attr('action');
    var method = $form.attr('method');
  $.ajax({
    url: url,
    method: method,
    data: $form.serialize()
  })
  .done(function(response) {
    $form.find(".upvotes").text(response);
  });
  });

  $('a').on('click', function() {
    event.preventDefault();

  });
});
