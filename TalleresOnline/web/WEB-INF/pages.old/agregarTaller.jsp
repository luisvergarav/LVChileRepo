<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ include file="TopTemplate.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../resources/css/normalize.css" rel="stylesheet" />
    <link href="../resources/css/main.css" rel="stylesheet" />
    <link href="../resources/css/bootstrap.css" rel="stylesheet" />
    <link href="../resources/css/jquery-ui.css" rel="stylesheet" />
    <link href="../resources/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="../resources/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../resources/js/main.js"></script>
<title><c:out value="${titulo}" /></title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

          
</head>
<body>
 
            
        <div class="container" id="content">
            
	<h3>
		<c:out value="${titulo}" />
	</h3>

	<p>
		<a href="<c:url value="/mantenedor/listado.do" />">volver</a>
	</p>
        <div class="tableWrap">
	<form:form commandName="taller" action="agregarTaller.do" method="post">
		<form:hidden path="idTaller" />
		<table  class="table table-filter">
                    
                    
			<tr>
				<td>Nombre Taller</td>
				<td><form:input path="nombreTaller" /></td>
				

				<td>Cupos Taller</td>
				<td ><form:input path="cupos" /></td>
				
                                
				
			</tr>
                        
                        

                        <tr>
				
				
				<td>Inicio Taller</td>
				<td colspan="1"><form:input path="inicioTaller" /></td>
                                
                                <td>Termino Taller</td>
				<td><form:input path="terminoTaller" /></td>
				
			</tr>
                        
                          <tr>    
				<td>Comp/Curricular</td>
				<td><form:input path="claseTaller" /></td>
				

				<td>Institucion</td>
                                <td colspan="1">
				<form:select path="institucion.rutInstitucion">
				<form:option  value="0" label="seleccionar=>"></form:option>
				<form:options items="${listaInstituciones}"
						itemLabel="nombre" itemValue="rutInstitucion"></form:options>
				</form:select>
				</td>
				
			</tr>
		
<tr>
				<td>Tipo Taller</td>
                                <td>
				<form:select path="tipoTaller.idTipoTaller">
				<form:option  value="0" label="seleccionar=>"></form:option>
				<form:options items="${listaTipoTaller}"
						itemLabel="nombre" itemValue="idTipoTaller"></form:options>
				</form:select>
				</td>
                                
                                <td>Monto</td>
				<td ><form:input path="monto" /></td>
                           </tr>
                           <tr>     
                                <td>Cursos Incluidos :</td>
                                <form:hidden path ="primero"/>
                                <form:hidden path ="segundo"/>
                                <form:hidden path ="tercero"/>
                                <form:hidden path ="cuarto"/>
                                <form:hidden path ="quinto"/>
                                <form:hidden path ="sexto"/>
                                <form:hidden path ="septimo"/>
                                <form:hidden path ="octavo"/>
                                <form:hidden path ="pmedio"/>
                                <form:hidden path ="smedio"/>
                                <form:hidden path ="tmedio"/>
                                <form:hidden path ="cmedio"/>
                                <form:hidden path ="prekinder"/>
                                <form:hidden path ="kinder"/>
                                <form:hidden path ="jardin"/>
                                <td>
                                1º <input type="checkbox" id="check1">                                
                                2º <input type="checkbox" id="check2">
                                3º <input type="checkbox" id="check3">
                                4º <input type="checkbox" id="check4">
                                5º <input type="checkbox" id="check5">
                                6º <input type="checkbox" id="check6">
                                7º <input type="checkbox" id="check7">
                                8º <input type="checkbox" id="check8">
                                1Mº <input type="checkbox" id="check11">
                                2Mº <input type="checkbox" id="check12">
                                3Mº <input type="checkbox" id="check13">
                                4Mº <input type="checkbox" id="check14">
                                PKº <input type="checkbox" id="check01">
                                Kº <input type="checkbox" id="check02">
                                JIº <input type="checkbox" id="check03">
                                </td>
                                
                                <td>semestre</td>
				<td ><form:input path="semestre.idsemestre" /></td>
                           </tr>
                           <tr>
                               <td></td>
                               <td></td>
                               <td></td>
                                <td>
				
                                  <button name='boton' type='submit'  class="btn btn-primary">${titulo}</button>
                                
				</td>
			</tr>
		</table>
                <form:errors path="nombreTaller"  cssClass="alert validation alert-error" element="div"/>   
                <form:errors path="cupos"  cssClass="alert validation alert-error" element="div"/>  
                <form:errors path="institucion.rutInstitucion"  cssClass="alert validation alert-error" element="div"/> 
                <form:errors path="claseTaller"  cssClass="alert validation alert-error" element="div"/> 
                <form:errors path="institucion.rutInstitucion"  cssClass="alert validation alert-error" element="div"/>                 
                <form:errors path="tipoTaller.idTipoTaller"  cssClass="alert validation alert-error" element="div"/>              
                <form:errors path="semestre.idsemestre"  cssClass="alert validation alert-error" element="div"/>
                <form:errors path="monto"  cssClass="alert validation alert-error" element="div"/>
       <form:errors path="inicioTaller"  cssClass="alert validation alert-error" element="div"/>
                
             <form:errors path="terminoTaller"  cssClass="alert validation alert-error" element="div"/>
	</form:form>
            </div>
        <a href="<c:url value="/mantenedor/agregarSeccion.do?idTaller=${taller.idTaller}" />" > Crear Seccion (+)</a>

           <div class="tableWrap" >
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap">
	
		<tr>
		<th>Código Sección</th>
                <th>Nombre Sección</th>
		<th>Id Taller</th>		
		<th>Cupos</th>
		<th>Horario</th>
                <th>Eliminar</th>
                
                </tr>
		<c:forEach items="${listaSecciones}" var="seccion">
			<tr>
			
			<td><c:out value="${seccion.codSeccion}" /></td>
			
                        <td><c:out value="${seccion.nombreSeccion}" /></td>
			
                        <td><c:out value="${seccion.taller.idTaller}" /></td>
                        						
                        
			<td><c:out value="${seccion.cupos}" /></td>

			
			

                        
                        

                        <td><a href="<c:url value="/mantenedor/agregarSeccion.do?codSeccion=${seccion.codSeccion}&idTaller=${taller.idTaller}" />" >Horario</a></td>

				<td><a onclick="return confirm('esta seguro?')" 
				href="<c:url value="/mantenedor/eliminarSeccionTaller.do?codSeccion=${seccion.codSeccion}"/>" >Eliminar</a></td>

			</tr>
		</c:forEach>
		
		</table>
            </div>
        
        
        </div>
        <script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
<script>
    $(document).ready(function(){
        if ( $('#primero').val() ==1)
        $('#check1').prop("checked",true);
        else
        $('#check1').prop("checked",false);    

if ( $('#segundo').val() ==1)
        $('#check2').prop("checked",true);
        else
        $('#check2').prop("checked",false);    
    
    
    if ( $('#tercero').val() ==1)
        $('#check3').prop("checked",true);
        else
        $('#check3').prop("checked",false); 
    
    if ( $('#cuarto').val() ==1)
        $('#check4').prop("checked",true);
        else
        $('#check4').prop("checked",false);  
    
    if ( $('#quinto').val() ==1)
        $('#check5').prop("checked",true);
        else
        $('#check5').prop("checked",false);  
    
    if ( $('#sexto').val() ==1)
        $('#check6').prop("checked",true);
        else
        $('#check6').prop("checked",false);  
    
    if ( $('#septimo').val() ==1)
        $('#check7').prop("checked",true);
        else
        $('#check7').prop("checked",false);
    
    if ( $('#octavo').val() ==1)
        $('#check8').prop("checked",true);
        else
        $('#check8').prop("checked",false);  
    
     if ( $('#pmedio').val() ==1)
        $('#check11').prop("checked",true);
        else
        $('#check11').prop("checked",false); 
    if ( $('#smedio').val() ==1)
        $('#check12').prop("checked",true);
        else
        $('#check12').prop("checked",false); 
    
    if ( $('#tmedio').val() ==1)
        $('#check13').prop("checked",true);
        else
        $('#check13').prop("checked",false); 
    
    if ( $('#cmedio').val() ==1)
        $('#check14').prop("checked",true);
        else
        $('#check14').prop("checked",false); 
    
    if ( $('#prekinder').val() ==1)
        $('#check01').prop("checked",true);
        else
        $('#checkp01').prop("checked",false); 
    
    if ( $('#kinder').val() ==1)
        $('#check02').prop("checked",true);
        else
        $('#check02').prop("checked",false); 
    
    if ( $('#jardin').val() ==1)
        $('#check03').prop("checked",true);
        else
        $('#check03').prop("checked",false); 
    });
  


$('#check1').click(function(){
    if ($('#primero').val() == 1 )$('#primero').val(0);
    else
        $('#primero').val(1);  
});

$('#check2').click(function(){
 if ($('#segundo').val() == 1 )$('#segundo').val(0);
    else
        $('#segundo').val(1);        
    });
    
    $('#check3').click(function(){
 if ($('#tercero').val() == 1 )$('#tercero').val(0);
    else
        $('#tercero').val(1);        
    });
    
    
    $('#check4').click(function(){
 if ($('#cuarto').val() == 1 )$('#cuarto').val(0);
    else
        $('#cuarto').val(1);        
    });
    
    $('#check5').click(function(){
 if ($('#quinto').val() == 1 )$('#quinto').val(0);
    else
        $('#quinto').val(1);        
    });
    
    $('#check6').click(function(){
 if ($('#sexto').val() == 1 )$('#sexto').val(0);
    else
        $('#sexto').val(1);        
    });
    
    $('#check7').click(function(){
 if ($('#septimo').val() == 1 )$('#septimo').val(0);
    else
        $('#septimo').val(1);        
    });
    
    $('#check8').click(function(){
 if ($('#octavo').val() == 1 )$('#octavo').val(0);
    else
        $('#octavo').val(1);        
    });
    
     $('#check11').click(function(){
 if ($('#pmedio').val() == 1 )$('#pmedio').val(0);
    else
        $('#pmedio').val(1);        
    });
    
    $('#check12').click(function(){
 if ($('#smedio').val() == 1 )$('#smedio').val(0);
    else
        $('#smedio').val(1);        
    });
    $('#check13').click(function(){
 if ($('#tmedio').val() == 1 )$('#tmedio').val(0);
    else
        $('#tmedio').val(1);        
    });
    
    $('#check14').click(function(){
 if ($('#cmedio').val() == 1 )$('#cmedio').val(0);
    else
        $('#cmedio').val(1);        
    });
    
     $('#check01').click(function(){
 if ($('#prekinder').val() == 1 )$('#prekinder').val(0);
    else
        $('#prekinder').val(1);        
    });
    
    
     $('#check02').click(function(){
 if ($('#kinder').val() == 1 )$('#kinder').val(0);
    else
        $('#kinder').val(1);        
    });
    
     $('#check03').click(function(){
 if ($('#jardin').val() == 1 )$('#jardin').val(0);
    else
        $('#jardin').val(1);        
    });
    
                    $(function() {
                        $("#terminoTaller").datepicker();
                        $("#inicioTaller").datepicker();
                    });
    
</script>    
</body>
</html>