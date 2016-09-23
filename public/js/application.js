$(document).ready(function() {
  $('.new_comment_button-q').on('click', function(event){
    event.preventDefault();
    var $form = $(this);
    $form.hide();
    // $form.siblings('form.new_comment_form')
    $('.new_comment_form-q').removeClass('hidden');
  });
  $('.container').on('submit', '.new_comment_form-q', function(event){
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
      debugger;
      $('.append_comment_q').append(response);
      form.removeClass('hidden');
    })
  })

  $('.new_comment_button-a').on('click', function(event){
    event.preventDefault();
    var $form = $(this);
    $form.hide();
    // $form.siblings('form.new_comment_form')
    $('.new_comment_form-a').removeClass('hidden');
  });
  $('.new_comment_form-a').on('submit', function(event){
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
