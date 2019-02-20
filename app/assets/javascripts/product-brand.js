$(function() {
  var search_list = $(".brand-search-result");

  function appendBrand(brand) {
    var html =`<li class="brand-search-result-list" data-brand-id="${brand.id}" data-brand-name="${brand.name}">${brand.name}</li>`
    search_list.append(html);
  }
  function appendNoBrand(comment) {
    var html =`<p>
                <div class="brand-search-result-list>${comment}</div>
              </p>`
    search_list.append(html);
  }

  $(".select-default-brand").on("keyup", function() {
    var input = $(".select-default-brand").val();
      $.ajax({
      type: 'GET',
      url: '/products/brand_search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(brands){
      $(".brand-search-result").empty();
      if (brands.length !== 0) {
        brands.forEach(function(brand){
          appendBrand(brand);
        });
      }
      else {
        appendNoBrand("一致するブランドはありません");
      }
    });
  });

    $(".brand-search-result").on("click", ".brand-search-result-list", function() {
      var selected_brand_id = $(this).attr('data-brand-id');
      var selected_brand_name = $(this).attr('data-brand-name');
      var new_html =`<div class="select-default-brand select-default-brand-name">${selected_brand_name}</div>
                    <input name='product[brand_id]' type='hidden' class='select-default-brand-hidden' value='${selected_brand_id}]'>`
      $(".select-default-brand").remove();
      $(".icon-arrow-bottom-brand").remove();
      $(".brand-search-result").remove();
      $("#brand-result").append(new_html);
    });

});
