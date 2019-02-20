$(function(){

  var category_size_result = $("#size-select");

  function appendSize(size) {
    $('.category__select__size').show();
    var html =`<option value="${size.id}">${size.name}</option>`
    category_size_result.append(html);
  }
  function appendNoSize(nosize) {
    var html =`<option value="1" selected></option>`
    category_size_result.append(html);
  }

  $('#third-select').change(function(){
    $('.category__select__brand').show();
    $.ajax({
    type: 'GET',
    url: '/products/size_search',
    dataType: 'json',
    data: {id : $('#first-select').val()},
  })

    .done(function(sizes){
      $("#size-select").empty();
      if (sizes.length !== 0) {
        sizes.forEach(function(size){
          appendSize(size);
        });
      }
      else {
        appendNoSize("");
      }
    });
  });
});
