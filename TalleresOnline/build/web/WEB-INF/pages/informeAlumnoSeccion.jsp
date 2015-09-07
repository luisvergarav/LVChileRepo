<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ include file="TopTemplate.jsp" %>
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
                    
                  $(function() {
                     
                       if ($('#semestreGlobal').val() == '') $("#msj_semestre_inactivo").show();
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
         
<!-- Mensaje de confirmación-->
<div id="msj_semestre_inactivo" class="modal hide">
            <div class="modal-header">
                <h2>Inscripcion</h2>
            </div>
            <div class="modal-body">
                <div class="msj_alerta">
                    <b><p>Fecha de Inscripciones Cerradas.</p></b>
                </div>
            </div> 
            <div class="modal-footer">
                <div class="btn-toolbar">
                    <div class="pull-right">
                        <button id="btnConfirmar" class="btn btn-primary"  data-dismiss="modal" >Aceptar</button>
                       
                    </div>
				</div>
			</div>
		</div>
<div class="container" id="content">
    <h3>
		<c:out value="Informe de Alumnos por seccion ${seccion.nombreSeccion}" />
	</h3>

	<p>
		
	</p>
	<div class="tableWrap">
	
	<table class="table table-filter tableWrap">
	<tbody>
	
	
	
	<tr>
            <td> <label>Usuario</label></td>
            
            <td> <label>${username}</label></td>	
        
        </tr>
       
	</tbody>
	</table>
	
	</div>
	
        <div class="tableWrap" >
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap">
	
          
         
		<tr>	
		<th>Rut Alumno</th>                
		<th>Primer Nombre</th>
                <th>Segundo Nombre</th>
		<th>Apellido Paterno</th>		
		<th>Apellido Materno</th>               
                <th>Fecha Nacimiento</th>
                <th>Curso</th>
                
                <th></th>
                </tr>
		<c:forEach items="${alumnos}" var="alumno">
			<tr>
			
			<td><c:out value="${alumno.rutAlumno}" /></td>
			
			<td><c:out value="${alumno.primerNombre}" /></td>
                        
                        <td><c:out value="${alumno.segundoNombre}" /></td>
                        
                        <td><c:out value="${alumno.apellidoPaterno}" /></td>
			
			<td><c:out value="${alumno.apellidoMaterno}" /></td>

                        <td><c:out value="${alumno.fechaNacimiento}" /></td>			                        
                        
                        <td><c:out value="${alumno.curso} ${alumno.nivel}" /></td>
                                       
			</tr>
		</c:forEach>
		
		</table>
            </div>
        
        
</div>
<script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
<script type="text/javascript">


$("#btnConfirmar").click(function(){
    
        $("#msj_semestre_inactivo").css("display", "none");    
});

                    
</script>
</body>

</html>
