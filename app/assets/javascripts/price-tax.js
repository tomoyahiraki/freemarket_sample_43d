$(function(){
  var tax = 0.1;
  var input = $('#input-price');
  var output = $('#output-price');
  var outputTax = $('#output-price-tax');
  input.on('change', function() {
    var str = $(this).val();
    var num = Number(str.replace(/[^0-9]/g, ''));
    $(this).val(num);
    var commission = num * tax;
    var profit = num - commission;
    output.text('¥'+profit);
    outputTax.text('¥'+commission);
  })
})
