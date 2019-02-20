$(function(){
  $('#second-select').css('display', 'none');
  $('#third-select').css('display', 'none');
  $('.category__select__size').css('display', 'none');
  $('.category__select__brand').css('display', 'none');

  var category_second_result = $("#second-select");
  function appendCategory(category) {
    var html =`<option value="${category.id}">${category.name}</option>`
    category_second_result.append(html);
  }
  function appendNoCategory(comment) {
    var html =`<p>${comment}</p>`
    category_second_result.append(html);
  }
  $('#first-select').change(function(){
    $('#second-select').show();
    $.ajax({
    type: 'GET',
    url: '/products/category_search',
    dataType: 'json',
    data: {id : $('#first-select').val()},
  })
    .done(function(categories){
      $("#second-select").empty();
      if (categories.length !== 0) {
        categories.forEach(function(category){
          appendCategory(category);
        });
      }
      else {
        appendNoCategory("一致するカテゴリーはありません");
      }
    });
  });

  var category_third_result = $("#third-select");

  function appendCategories(category) {
    var html =`<option value="${category.id}">${category.name}</option>`
    category_third_result.append(html);
  }
  function appendNoCategories(comment) {
    var html =`<p>${comment}</p>`
    category_third_result.append(html);
  }

  $('#second-select').change(function(){
    $('#third-select').show();
    $.ajax({
    type: 'GET',
    url: '/products/category_search',
    dataType: 'json',
    data: {id : $('#second-select').val()},
  })

    .done(function(categories){
      $("#third-select").empty();
      if (categories.length !== 0) {
        categories.forEach(function(category){
          appendCategories(category);
        });
      }
      else {
        appendNoCategories("一致するカテゴリーはありません");
      }
    });
  });

});
