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
         

<div class="container" id="content">
    
	<p>
		
	</p>
	<div class="tableWrap">
	
	<table class="table table-filter tableWrap table-filter">
	<tbody>
	
	<p>
		<a href="<c:url value="/sistema/configuracion.do" />">volver</a>
	</p>
        
	
	<tr>
            <td> <label>Institucion</label></td>
            
            <td> <label>${tipoTaller.institucion.nombre}</label></td>	
        
        </tr>
       
	</tbody>
	</table>
	
	</div>
	
            
    <h3>
		<c:out value="${titulo}" />
	</h3>
        
         
        <div class="tableWrap center" >
            
                
	<form:form commandName="tipoTaller" action="tipoTallerConf.do" method="post">
	       
     
     
		<table  class="table table-filter  tableWrap table-striped" >
                    				<form:hidden path="institucion.rutInstitucion" />
                    <tr>
				
				<form:hidden path="idTipoTaller" />
                        
                         

				<td>Nombre</td>
				<td><form:input path="nombre" /></td>

                                <td>
				
                                  <button name='boton' type='submit'  class="btn btn-primary">Guardar</button>
                                  </td>
                  	</tr>
		</table>
        <form:errors path="institucion.rutInstitucion"  cssClass="alert validation alert-error" element="div"/>   
                      <form:errors path="nombre"  cssClass="alert validation alert-error" element="div"/>   
                        
	</form:form>
            </div>
                      
                      
            <h3>
		<c:out value="Lista tipo Talleres Disponibles" />
                <a class="pull-right" href="<c:url value="/mantenedor/tipoTallerConf.do" />" >Agregar (+)</a>
	</h3>
         <div class="tableWrap overflow" >
             
             
        
        
             <table id="tabla1" class="table     tableWrap table-striped" >
	
   
         
		<tr>	
		<th>Id</th>                
		<th>Rut Institucion</th>                
		<th>Nombre</th>  
                <th></th>
                
                </tr>
		<c:forEach items="${listaTipoTaller}" var="tipoTaller">
			<tr>
			
			<td><c:out value="${tipoTaller.idTipoTaller}" /></td>
			
			<td><c:out value="${tipoTaller.institucion.rutInstitucion}" /></td>
                        
                        <td><c:out value="${tipoTaller.nombre}" /></td>
                        
                        <td><a href="<c:url value="/mantenedor/tipoTallerConf.do?idTipoTaller=${tipoTaller.idTipoTaller}" />" >Editar</a></td>
			</tr>
		</c:forEach>
		
		</table>
        </div>
            
        
            
        
        
             <div class="tableWrap" >
                 
                 <h3>
		<c:out value="Profesores Asignados a Tipo taller Seleccionado" />
	</h3>
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap">
	
   
         
		<tr>	
		<th>Nombre</th>                
		<th>Apellido</th>                
		
            
                
                </tr>
		<c:forEach items="${tipoTaller.profesors}" var="profesor">
			<tr>
			
			<td><c:out value="${profesor.nombreProfesor}" /></td>
			
			<td><c:out value="${profesor.apellidoProfesor}" /></td>
                            
                        
			</tr>
		</c:forEach>
		
		</table>
            </div>
        
          <div class="tableWrap" >
              <h3>
		<c:out value="Secciones Creadas para Tipo Taller seleccionado" />
	</h3>
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap">
	
   
         
		<tr>	
		<th>Nombre</th>                
		<th>Clase</th>                
		<th>Cupos</th>  
            
                
                </tr>
		<c:forEach items="${tipoTaller.tallers}" var="taller">
			<tr>
			
			<td><c:out value="${taller.nombreTaller}" /></td>
			
			<td><c:out value="${taller.claseTaller}" /></td>
                        
                        <td><c:out value="${taller.cupos}" /></td>
			</tr>
		</c:forEach>
		
		</table>
            </div>
        
        
</div>
<script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
<script type="text/javascript">
$('#btnReset').click(function(){
    alert($('#nombre').val());
$("#nombre").val("");
$("#idTipoTaller").val("");
    
});

</script>

</body>

</html>
