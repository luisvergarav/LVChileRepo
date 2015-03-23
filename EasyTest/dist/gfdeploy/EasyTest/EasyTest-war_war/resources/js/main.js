$.datepicker.regional['es'] = {
	  closeText: 'Cerrar',
	  prevText: '<Ant',
	  nextText: 'Sig>',
	  currentText: 'Hoy',
	  monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
	  monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
	  dayNames: ['Domingo', 'Lunes', 'Martes', 'Mi&eacute;rcoles', 'Jueves', 'Viernes', 'Sábado'],
	  dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
	  dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sa'],
	  weekHeader: 'Sm',
	  dateFormat: 'dd/mm/yy',
	  firstDay: 1,
	  isRTL: false,
	  showMonthAfterYear: false,
	  yearSuffix: ''
 };
$.datepicker.setDefaults($.datepicker.regional['es']);
    	
/*Calendario para fechas*/
function today(){
	$('.today').datepicker({
	            dateFormat: "dd-mm-yy",
	            firstDay: 1, 
	            changeMonth: true,
	            showButtonPanel: true,
	            changeYear: true,
	            changeFirstDay: true
	    });
	}

   	var d = new Date( );
   	var today = d.getDate( )+"-"+d.getMonth(  )+1 +"-"+d.getFullYear( ) ; 
   	
/*Validar dígitos Rut del Cedente / Mostrar Nombre del cliente*/
	 
	$('.rut').keyup(function () {
	    if (this.value.length == this.maxLength) {
	      $(this).next('.verificadorCedente').focus();
		}
	});	
	function dv(T){var M=0,S=1;for(;T;T=Math.floor(T/10))
	S=(S+T%10*(9-M++%6))%11;return S?S-1:'k';}	
	
/*Simula consulta en tabla de datos*/
function consulta(){
	 $("#tableConsulta tbody tr").hide();
	 $("#tableConsulta tfoot tr").hide();
	 $("#consultar").click(function(){
	     $("#tableConsulta tbody tr").show();
	     $("#tableConsulta tfoot tr").show();
	 });
}

/*Simula flechas ANTERIOR - SIGUIENTE	*/
function anteriorSiguiente(){
	$("#siguiente").hide();
	$("#siguienteBtn").click(function(){
		 $("#siguienteBtn").attr("disabled", true);
		 $("#anteriorBtn").attr("disabled", false);
		 $("#anterior").hide();
		 $("#siguiente").show();
	});

	$("#anteriorBtn").click(function(){
		 $("#siguienteBtn").attr("disabled", false);
		 $("#anteriorBtn").attr("disabled", true);
		 $("#anterior").show();
		 $("#siguiente").hide();
	});
}	
	


/*FUNCIONES*/
var intId = 0; /*no modificar*/
$("#buscar").click (function() {
	$('#loading').html('cargando...');
	$('#grilla tbody').hide();

/*no modificar */
	setTimeout(function() {
		    loadData();
		}, 1000);
});
function loadData(){
		$('#grilla tbody').show();
		$('#loading').html('');

		clearInterval(intId);
}

/*una seleccion de hover*/
function oneRegistro(){
	 $(".table-oneRegistro tbody tr input:checkbox").change(function() {
	 if ($(this).is(":checked")) {
	    var group = ".table-oneRegistro tbody tr input:checkbox[name='" + $(this).attr("name") + "']";
	    $(group).prop("checked", false);
	    $("tr.success").removeClass("success");
	    
	    $(this).prop("checked", true);
	    $(this).closest("tr").addClass("success");	
	   
	} else {
	    $(this).prop("checked", false);
	    $(this).closest("tr").removeClass("success");
	    }
	 }); 		 
}
function exportar(){	
	$('#exportar').click(function() {
	  var $modal = $('.js-loading-bar'),
	      $bar = $modal.find('.bar');
	  
	  $('.js-loading-bar').modal('show');
	  $bar.addClass('animate');

	  setTimeout(function() {
	    $bar.removeClass('animate');
	    $('.js-loading-bar').modal('hide');
	  }, 1500);
	});
 }
/*habilita botón al checkear grilla*/
	function checkSeleccionar(){
	 $(".checkSeleccionar").change(function() {
		 if ( $(".checkSeleccionar").is(':checked')) {
	 			$('.buttonCheckSeleccionar').attr('disabled', false);	
		  } 
	 		else {
			  $('.buttonCheckSeleccionar').attr('disabled', true);
	 		}
	});
}

/*Elimina Registro*/
	function eliminarRegistro(){
		$('.eliminarRegistro').click(function(){
			$(this).closest('tr').remove();
		});	
	 }

 /*mensajes de confirmacion en otra página*/
function getParameterByName( name,href ){
 	name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
 	var regexS = "[\\?&]"+name+"=([^&#]*)";
 	var regex = new RegExp( regexS );
 	var results = regex.exec( href );
 	if( results == null )
 		return "";
 	else
 		return decodeURIComponent(results[1].replace(/\+/g, " "));	
 	}
		