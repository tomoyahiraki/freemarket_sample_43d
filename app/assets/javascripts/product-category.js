$(function(){
  $('#second-select').css('display', 'none');
  $('#third-select').css('display', 'none');
  $('.category__select__size').css('display', 'none');
  $('.category__select__brand').css('display', 'none');

$('#first-select').change(function(){
  var first_selected = $('option:selected').val();
  // console.log(first_selected)
  // var second_html = `<select class:'select-default-two' id:'second-select' value='${first_selected}' name='product[category_id]'}>`
  // console.log(second_html)
  // $(".category__select__second").append(second_html);
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
