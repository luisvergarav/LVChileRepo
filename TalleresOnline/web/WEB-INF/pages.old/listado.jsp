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


</head>
<body>
         
<div class="container" id="content">
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

                        <td><c:out value="$${taller.monto}" /></td>
                        

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
