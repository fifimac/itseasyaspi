jQuery.fn.submitOnCheck = function() {
  this.find('input[type=submit]').remove(); 
  this.find('input[type=checkbox]').click(function() {
    $(this).parent('form').submit();
  });
  return this; //this will allow me to chain other calls on if needed
}

$(function() {
  $('.edit_supply').submitOnCheck(); // listen for edit_supply
});