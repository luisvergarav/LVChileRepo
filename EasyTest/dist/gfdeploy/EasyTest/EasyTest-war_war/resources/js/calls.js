/*Menu Ajax*/
	$(".menuitem").click(function() {
		var link = $(this).attr('href');
		$('#gedinNavbarLoad').load("componentes/" + link + ".html");
	});	
	
	$(".menuitemMsj").click(function() {
		var link = $(this).attr('href');
		$('#gedinNavbarLoad').load("componentes/" + link);
	});

/*Modales externos AJAX*/
	
 $('[data-toggle="modal"]').click(function(e) {
	e.preventDefault();
	var url = $(this).attr('href');
	if (url.indexOf('#') == 0) {
		$(url).modal('open');
	} else {
		$.get(url, function(data) {
			$('<div class="modal hide fade">' + data + '</div>').modal();
		}).success(function() { $('input:text:visible:first').focus(); });
	}
});
 
	$('.rut').keyup(function () {
	    if (this.value.length == this.maxLength) {
	      $(this).next('.verificadorCedente').focus();
		}
	});	
function dv(T){var M=0,S=1;for(;T;T=Math.floor(T/10))
	S=(S+T%10*(9-M++%6))%11;return S?S-1:'k';}	
	
