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
</head>
<body>
                   
        <div class="container" id="content">
	<h3>
		<c:out value="${titulo}" />
	</h3>

	<p>
		<a href="<c:url value="/sistema/configuracion.do" />">volver</a>
	</p>
        <div class="tableWrap">
            
            
	<form:form commandName="profesor" action="agregarProfesor.do" method="post">
		
		<table  class="table table-filter">
                
                    
			<tr>
                                		<td>Rut :</td>
				<td><form:input path="idProfesor" /></td>
		
                                
				<td>Tipo Taller</td>
                                <td>
				<form:select path="tipoTaller.idTipoTaller">
				<form:option  value="0" label="seleccionar=>"></form:option>
				<form:options items="${listaTipoTaller}"
						itemLabel="nombre" itemValue="idTipoTaller"></form:options>
				</form:select>
                                
				</td>
                                
                                
                        
			</tr>
     
                       
                        <tr>        
                                
				<td>Nombre :</td>
				<td><form:input path="nombreProfesor" /></td>
                               
				

				<td>Apellido :</td>
				<td ><form:input path="apellidoProfesor" /></td>
                                
				
                                
				
			</tr>
     
                       
                        <td colspan="3"></td>        
                                <td>
				
                                    <button name='boton' type='submit'  class="btn btn-primary">Guardar</button>
                                
				</td>
			</tr>
		</table>
                      <form:errors path="idProfesor"  cssClass="alert validation alert-error" element="div"/>    
                <form:errors path="nombreProfesor"  cssClass="alert validation alert-error" element="div"/>
                <form:errors path="tipoTaller.idTipoTaller" cssClass="alert validation alert-error" element="div"/>
                <form:errors path="apellidoProfesor" cssClass="alert validation alert-error" element="div"/>                     
	</form:form>
            </div>
            
        
        </div>
        <script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 

</body>
</html>