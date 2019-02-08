$(document).on('turbolinks:load', function() {
  $('.sub-image').hover(function(){
    var subimage = $(this).attr('src')
    $('.main-image').css('background-image', 'url('+subimage+')');
  });
});
