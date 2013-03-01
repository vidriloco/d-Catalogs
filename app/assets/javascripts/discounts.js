$(document).ready(function() {
	$('#home-tab').tab('show');
	
	var updateDiscount = function() {
		var price = parseFloat($('#discount_price').val());
		var discount = parseInt($('#discount_percent_off').val());
		if(discount > 0 && price > 0) {
			discount = parseFloat("."+$('#discount_percent_off').val());
			$('#price_after_discount').val(price-(price*discount));
		} else {
			$('#price_after_discount').val(price);
		}
	}
	updateDiscount();
	$('#discount_price').bind('keyup', updateDiscount);
	$('#discount_percent_off').bind('keyup', updateDiscount);
	
});