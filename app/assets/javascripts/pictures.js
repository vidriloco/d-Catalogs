$(document).ready(function() {
	
	$('.picture .controls').fadeOut();
	
	$('.picture').bind('mouseenter', function() {
		$($(this).children('.controls')[0]).fadeIn();
	});
	
	$('.picture').bind('mouseleave', function() {
		$($(this).children('.controls')[0]).fadeOut();
	});
	
	var gallery = $('.image').colorbox({ transition: 'elastic', rel: 'gallery', previous: "anterior", next: "siguiente", current: "", close: "cerrar" });
	
	$('a.open-gallery').click(function(e) {
		e.preventDefault();
		gallery.eq(0).click();
		gallery.resize();
	});
	
	$('.with-blocking-msg').click(function() {
		$('#blocking').fadeIn();
	});
});