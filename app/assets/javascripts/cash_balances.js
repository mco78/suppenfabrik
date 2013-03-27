// function Kassenbestand
function calculateCash() {
  var sum_cash = 0;
    $('input.cash').each(function() {
      if (!$(this).val())
        $(this).val(0);
      sum_cash += parseFloat($(this).val()) * parseFloat($(this).attr('id'));
    });
    $('input#cash_total').val(sum_cash.toFixed(2).replace(".",","));
    $('input#cash_total').submit();
};

// function Barentnahme
function calculateRemove() {
  var sum_remove = 0;
    $('input.remove').each(function() {
      if (!$(this).val())
        $(this).val(0);
      sum_remove += parseFloat($(this).val()) * parseFloat($(this).attr('id'));
    });
    $('input#remove_total').val(sum_remove.toFixed(2).replace(".",","));
    $('input#remove_total').submit();
};

// Auto-Calculate Cashier Values
$(document).ready(function() {
  
  //calculateCash();
  //calculateRemove();

  $('input.cash').change(calculateCash);

  $('input.remove').change(calculateRemove);
});

$(document).ready(function() {
  $("#fire_cash_modal").click(function() {
    $("#cash_modal").reveal();
  });
  $("#fire_remove_modal").click(function() {
    $("#remove_modal").reveal();
  });
  $(".remove-custom-close").click(function() {
    $('#remove_modal').trigger('reveal:close')
  })
  $(".cash-custom-close").click(function() {
    $('#cash_modal').trigger('reveal:close')
  })

});