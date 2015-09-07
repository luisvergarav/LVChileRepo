<%@page import="models.VO.CartBean"%>
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
     <h3><c:out value="Carro de Compras (${cart.listaTalleres.size()}) Taller" />
       
         <a href="<c:url value="/inscripciones/verBolsa.do?rutAlumno=${alumno.rutAlumno}" />" >Ver</a></h3>
    <h3>
		<c:out value="${titulo}" />
	</h3>

	<p>
		<a href="<c:url value="/inscripciones/seleccionarAlumno.do" />">volver</a>
	</p>
	<div class="tableWrap">
	
	<table class="table table-filter tableWrap">
	<tbody>
	
	
	
	<tr>
            <td> <label>Nombre Alumno : </label></td>
            <td> <label>${alumno.primerNombre} ${alumno.apellidoPaterno}</label></td>	
            
            <td> <label>Curso : ${alumno.curso}${alumno.nivel}</label></td>
          
            
        </tr>
       
	</tbody>
	</table>
	
	</div>
            
    <h3>
		<c:out value="Inscripciones Talleres Curriculares" />
	</h3>
	<a href="<c:url value="/inscripciones/inscribirAlumno.do?rutAlumno=${alumno.rutAlumno}" />" >Inscribir (+)</a>
        
        <div class="tableWrap" >
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap">
	
         
                <!--Falta Agregar campo codigo inscripcion-->
		<tr>
		<!--<th>Id</th>-->
		<th>Clase Taller</th>
                <th>Nombre Taller</th>
		<th>Tipo Taller</th>
		<th>Fecha Inscripcion</th>
		<th>Periodo</th>
		<th>Año Periodo</th>                
                <th>Valor</th>      
                <th></th>  
                <th></th>  
                
                </tr>
		<c:forEach items="${listadoGratis}" var="gratis">
			<tr>
			
			<td><c:out value="${gratis.taller.claseTaller}" />
			
			<td><c:out value="${gratis.taller.nombreTaller}" /></td>
                        
                        <td><c:out value="${gratis.taller.tipoTaller.nombre}" />
                        
                        <td><c:out value="${gratis.inscripcionFechaInscripcion}" /></td>
			
			<td><c:out value="${gratis.semestre.periodo}" /></td>

                        <td><c:out value="${gratis.semestre.anoPeriodo}" /></td>			                        
                        
                        <td><c:out value="${gratis.taller.monto}" /></td>
           
			<td><a onclick="return confirm('esta seguro?')" 
				href="<c:url value="/inscripciones/eliminarInscripcion.do?idInscripcion=${gratis.id}" />" >eliminar</a></td>
                        <td><a onclick="return confirm('esta seguro?')" 
				href="<c:url value="/inscripciones/agregarSeccionInscripcion.do?rutAlumno=${alumno.rutAlumno}&idTaller=${gratis.taller.idTaller}" />" >Secciones</a></td>
			</tr>
		</c:forEach>
		
		</table>
            </div>
        
           <div class="tableWrap" >
               
    <h3>
		<c:out value="Inscripciones Talleres Complementarios" />
	</h3>
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap">
	
         
                <!--Falta Agregar campo codigo inscripcion-->
		<tr>
		<!--<th>Id</th>-->
		<th>Clase Taller</th>
                <th>Nombre Taller</th>
		<th>Tipo Taller</th>
		<th>Fecha Inscripcion</th>
		<th>Periodo</th>
		<th>Año Periodo</th>                
                <th>Valor</th>      
                <th>Estado</th>
                <th></th>  
                <th></th>  
                
                </tr>
		<c:forEach items="${listadoPagadas}" var="pagadas">
			<tr>
			
			<td><c:out value="${pagadas.taller.claseTaller}" />
			
			<td><c:out value="${pagadas.taller.nombreTaller}" /></td>
                        
                        <td><c:out value="${pagadas.taller.tipoTaller.nombre}" />
                        
                        <td><c:out value="${pagadas.inscripcionFechaInscripcion}" /></td>
			
			<td><c:out value="${pagadas.semestre.periodo}" /></td>

                        <td><c:out value="${pagadas.semestre.anoPeriodo}" /></td>			                        
                        
                        <td><c:out value="${pagadas.taller.monto}" /></td>
                        
                        <c:choose>
                        <c:when test="${pagadas.pago.idPago>0}" >
                                	<td>Pagada</td>
                        </c:when>
                        <c:otherwise>
                           <td>Pendiente</td>
                        </c:otherwise>
                        
                        </c:choose>
           
			<td><a onclick="return confirm('esta seguro?')" 
				href="<c:url value="/inscripciones/eliminarInscripcion.do?idInscripcion=${pagadas.id}" />" >eliminar</a></td>
                        <td><a onclick="return confirm('esta seguro?')" 
				href="<c:url value="/inscripciones/agregarSeccionInscripcion.do?rutAlumno=${alumno.rutAlumno}&idTaller=${pagadas.taller.idTaller}" />" >Secciones</a></td>
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
