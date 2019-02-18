$(function(){
  $('#second-select').css('display', 'none');
  $('#third-select').css('display', 'none');
  $('.category__select__size').css('display', 'none');
  $('.category__select__brand').css('display', 'none');

$('#first-select').change(function(){
  $('#second-select').show();
  $('#second-select').change(function(){
    $('#third-select').show();
    $('#third-select').change(function(){
      $('.category__select__size').show();
      $('.category__select__brand').show();
      });
    });
  });
});
