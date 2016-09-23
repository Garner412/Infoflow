$(document).ready(function() {
  $('.new_comment_button').on('click', function(event){
    event.preventDefault();
    $(this).hide();
    var form = $(thi'hidden');
  });s).siblings('form.new_comment_form')
    form.removeClass(
  $('.new_comment_form').on('submit', function(event){
    event.preventDefault();
    var form = $(this);
    var url = form.attr('action');
    var method = form.attr('method');
    var data = form.serialize();

    $.ajax({
      url: url,
      method: method,
      data: data
    })
    .done(function(response){
      $('.append_comment').append(response);
      form.removeClass('hidden');
    })
  })

});
