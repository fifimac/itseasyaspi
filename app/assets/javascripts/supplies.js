// $(function(){
// 	$('.edit_supply input[type=submit]').remove();
// 	$('.edit_supply input[type=checkbox]').click(function(){
// 		// alert('clicked!');
// 		$(this).parent('form').submit();
// 	});
// });
jQuery.fn.submitOnCheck = function() {
  this.find('input[type=submit]').remove();
  this.find('input[type=checkbox]').click(function() {
    $(this).parent('form').submit();
  });
  return this;
}

$(function() {
  $('.edit_supply').submitOnCheck();
});