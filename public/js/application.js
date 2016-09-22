$(document).ready(function() {
  $('.new_comment_button').on('click', function(event){
    event.preventDefault();
    var $click = $(this);
    var form = $(this).siblings('form.new_comment_form')
    $click.hide();
    form.removeClass('hidden');
    // var url = form.attr('action');
    // var method = form.attr('method');
    var data = form.serialize();
    console.log(data);
    $.ajax({
      method: form.attr('method'),
      url: form.attr('action'),
      data: data
    }).done(function(response){
      console.log(response);
    })
  });

});

