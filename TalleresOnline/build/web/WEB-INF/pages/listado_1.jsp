<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es"> <!--<![endif]-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link href="../resources/css/normalize.css" rel="stylesheet" />
    <link href="../resources/css/main.css" rel="stylesheet" />
    <link href="../resources/css/bootstrap.css" rel="stylesheet" />
    <link href="../resources/css/jquery-ui.css" rel="stylesheet" />
    <link href="../resources/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="../resources/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../resources/js/main.js"></script>

<title>${titulo}</title>
<style type="text/css">
.tableRollOverEffect1{
  background-color:#317082;
  color:#FFF;
}
.odd{
  background-color:#eeeeee;
}
.even{
  background-color:#FFFFFF;
}
.tableRollOverEffect2{
  background-color:#000;
  color:#FFF;
}
.tableRowClickEffect1{
  background-color:#F00;
  color:#FFF;
}
.tableRowClickEffect2{
  background-color:#00F;
  color:#FFF;
}
</style>
<script type="text/javascript">
		$(document).ready(function() {
			function actualiza_migas(linkpress){
				$(".breadcrumb").html("<li><a href='index.html'>Inicio</a> <span class='divider'>/</span></li>");

				linkpress.parents("ul li").each(function(index){ 
					var href = $(this).context.firstElementChild.getAttribute('href');
					var text = $(this).context.firstElementChild.innerText;
					
					//no es linkeable 
					/*if(href == '#')
					{
						$(".breadcrumb > li:first").after("<li>"+text+"<span class='divider'>/</span></li>");
					}
					else //es linkeable
					{
						$(".breadcrumb > li:first").after("<li><a href='"+href+"'>"+text+"</a><span class='divider'>/</span></li>");
					}*/
					$(".breadcrumb > li:first").after("<li>"+text+"<span class='divider'>/</span></li>");
				});
			}

			//Menu ajax 
			$('a.menuajax').click(function() { 
				$('.dropdown').removeClass('open');
				var content = $(this).attr('href');
				$('#gedinNavbarLoad').load('componentes/' + content + '.html');
				actualiza_migas($(this));
				return false;
			});
		});
	</script>
	<style type="text/css">
	  #gedinNavbar{
	  	width: 100%;
	  }
	  	#login{
	  		float: right !Important;
	  }
	</style>
<script type="text/javascript">
var arrayOfRolloverClasses = new Array();
	var arrayOfClickClasses = new Array();
	var activeRow = false;
	var activeRowClickArray = new Array();
	var bup ;
	function highlightTableRow()
	{
		var tableObj = this.parentNode;
		if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;

		if(this!=activeRow){
			bup = this.className;
			this.setAttribute('origCl',this.className);
			this.origCl = this.className;
		}
		this.className = arrayOfRolloverClasses[tableObj.id];
		
		activeRow = this;
		
	}
	
	function clickOnTableRow()
	{
		var tableObj = this.parentNode;
		if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;		
		
		if(activeRowClickArray[tableObj.id] && this!=activeRowClickArray[tableObj.id]){
		
			if((activeRowClickArray[tableObj.id].rowIndex % 2)==0)activeRowClickArray[tableObj.id].className="odd";
			else activeRowClickArray[tableObj.id].className="even";
			
			
			
		}
		this.className = arrayOfClickClasses[tableObj.id];
		
		activeRowClickArray[tableObj.id] = this;
				
	}
	
	function resetRowStyle()
	{
		var tableObj = this.parentNode;
		if(tableObj.tagName!='TABLE')tableObj = tableObj.parentNode;

		if(activeRowClickArray[tableObj.id] && this==activeRowClickArray[tableObj.id]){
			this.className = arrayOfClickClasses[tableObj.id];
			return;	
		}
		
		var origCl = this.getAttribute('origCl');
		if(!origCl)origCl = this.origCl;
		this.className=origCl;
		
	}
		
	function addTableRolloverEffect(tableId,whichClass,whichClassOnClick)
	{
		arrayOfRolloverClasses[tableId] = whichClass;
		arrayOfClickClasses[tableId] = whichClassOnClick;
		
		var tableObj = document.getElementById(tableId);
		//var tableObj = tableObj.getElementsByTagName('body');
		if(tableObj){
			var rows = tableObj.getElementsByTagName('tr');
		}else{
			var rows = tableObj.getElementsByTagName('tr');
		}
		for(var no=0;no<rows.length;no++){
			rows[no].onmouseover = highlightTableRow;
			rows[no].onmouseout = resetRowStyle;
			if((no % 2)==0)rows[no].className="odd";
			else rows[no].className="even";
			
			if(whichClassOnClick){
				rows[no].onclick = clickOnTableRow;	
			}
		}
		
	}
	</script>	

</head>
<body>
       <div id="wrapContent">
         <div class="container" id="content">
            <h1> </h1>
            <div class="navbar">
                <div class="navbar-inner container">
                     <ul class="nav" id="gedinNavbar">
                        <li class="dropdown">
                            <a id="gestor" href="#" class="dropdown-toggle" data-toggle="dropdown">Listados <b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
                            	<li role="presentation"><a class="menuajax" href="inicio_dia">Alumno/Profesor</a></li>
                                        
                                        <li role="presentation" class="dropdown-submenu">
								   <a href="#">Coordinacion</a>
								     <ul class="dropdown-menu">
								         <li><a class="menuajax" href="/TalleresOnline/informes/informeAlumnoSeccion.do">Alumnos/Seccion</a></li>
								         
								         
								     </ul>
								 </li>
                           		
                             </ul>
                        </li>
                        <li class="dropdown">
                            <a id="movimientos" href="#" class="dropdown-toggle" data-toggle="dropdown">Talleres <b class="caret"></b></a>
                           	 <ul class="dropdown-menu" role="menu">
                                	<li role="presentation"><a class="menuajax" href="ingreso_movimientos">Dar de baja Alumno</a></li>
                                        <li role="presentation"><a class="menuajax" href="<%=request.getContextPath()%>/inscripciones/seleccionarAlumno.do">Inscribir alumno</a></li>
                                        <li role="presentation" class="dropdown-submenu">
								   <a href="#">Mantencion</a>
								     <ul class="dropdown-menu">
								         <li><a class="menuajax" href="agregarTaller.do">Agregar Taller</a></li>
								         <li><a class="menuajax" href="listado.do">Listado</a></li>
								         
								     </ul>
								 </li>
                           		
                                	
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a id="saldos" href="#" class="dropdown-toggle" data-toggle="dropdown">Asistencia <b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
								
								<li role="presentation"><a class="menuajax" href="agregarTaller.do">Revisar Asistencia</a></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a id="saldos" href="#" class="dropdown-toggle" data-toggle="dropdown">Configuracion<b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
								
								<li role="presentation"><a class="menuajax" href="/TalleresOnline/sistema/configuracion.do">Sistema</a></li>
                                                               <li role="presentation"><a class="menuajax" href="/TalleresOnline/sistema/agregarProfesor.do">Agregar Profesor</a></li> 
                                                                <li role="presentation"><a class="menuajax" href="/TalleresOnline/sistema/agregarProfesor.do">Agregar Profesor</a></li> 
                                                                <li role="presentation"><a class="menuajax" href="/TalleresOnline/sistema/agregarProfesor.do">Tipo Taller (+)</a></li>
                        </ul>
                        </li>
                        <li>
                            <a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
                        </li>                    
                       <li id="fecha_menu" class="pull-right">
                        	<a id="fechaProceso" href="#" class="text-info"><b>Fecha :31/01/2015</b></a>
                        </li>
					</ul>
                </div>
            </div>
</div>            
</div>

<div class="container">
    <h3>Ingrese Taller a buscar</h3>
	<div class="tableWrap">
	<form method='post' action='<%=request.getContextPath()%>/mantenedor/listado.do'>
	<table class="table table-filter tableWrap">
	<tbody>
	
	
	
	<tr>
            <td> <label>Nombre Taller</label></td>
		<td><input name='desc' type='text'></input></td>
	
            <td><button name='boton' type='submit' value='Enviar'  class="btn btn-primary">Buscar</button></td>
	</tr>
	
	</tbody>
	</table>
	</form>
	</div>
	<a href="<%=request.getContextPath()%>/mantenedor/agregarTaller.do">Crear Taller (+)</a>
        <div class="tableWrap" >
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap table-striped">
	
		<tr>
	
		<th>Institucion</th>
		<th>Tipo Taller</th>
		<th>Cupos</th>
		<th>Nombre Taller</th>
		<th>Inicio Taller</th>
                <th>Termino Taller</th>
                <th>Clase Taller</th>
              
                <th>Monto</th>
                  <th>Editar</th>
                <th>Eliminar</th>
                </tr>
		<c:forEach items="${talleres}" var="taller">
			<tr>
			
		
			
			<td><c:out value="${taller.institucion.nombre}" /></td>
			
			<td><c:out value="${taller.tipoTaller.nombre}" /></td>
			<td><c:out value="${taller.cupos}" /></td>
			
			<td><c:out value="${taller.nombreTaller}" /></td>

                        <td><c:out value="${taller.inicioTaller}" /></td>
			
			<td><c:out value="${taller.terminoTaller}" /></td>
			
			<td><c:out value="${taller.claseTaller}" /></td>

                        <td><c:out value="${taller.monto}" /></td>
                        

                        <td><a href="<c:url value="/mantenedor/agregarTaller.do?idTaller=${taller.idTaller}" />" >editar</a></td>

				<td><a onclick="return confirm('esta seguro?')" 
				href="<c:url value="/mantenedor/eliminar.do?idTaller=${taller.idTaller}" />" >eliminar</a></td>

			</tr>
		</c:forEach>
		
		</table>
            </div>
</div>
<script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
</body>

</html>
