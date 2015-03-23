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
	<h3>
		<c:out value="${titulo}" />
	</h3>

	<p>
		<a href="<c:url value="/inscripciones/listadoInscripciones.do" />">volver</a>
	</p>
        
        	<div class="tableWrap">
	
	<table class="table table-filter tableWrap">
	<tbody>
	
	
	
	<tr>
            <td> <label>Nombre Alumno : </label></td>
            <td> <label>${alumno.primerNombre} ${alumno.apellidoPaterno}</label></td>	
            
            <td> <label>Curso : ${alumno.curso} ${alumno.nivel}</label></td>
          
            
        </tr>
        <tr>    
            <td> <label>Nombre Taller : ${taller.nombreTaller}</label></td>
            <td> <label>Clase Taller: ${taller.claseTaller}</label></td>
            <td> <label>Tipo Taller: ${taller.tipoTaller.nombre}</label></td>
        </tr>
       
	</tbody>
	</table>
	
	</div>
        
        <div class="tableWrap">
        <h3>
		<c:out value="Seleccione las secciones que desea Tomar" />
	</h3>    
	
	
            <!--fin-->
  
             <div class="tableWrap" >
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap">
	
		<tr>
		<th>Codigo Sección</th>
                <th>Nombre Sección</th>			
		<th>Dia Taller</th>
		<th>Cupos</th>
		
                <th>Profesores</th>
                <th>Tomar Seccion</th>
                
                </tr>
		<c:forEach items="${listadoSeccionesDisponibles}" var="seccion">
			<tr>
			
			<td><c:out value="${seccion.codSeccion}" /></td>
			
                        <td><c:out value="${seccion.nombreSeccion}" /></td>
                        
                                <td>
                                        <c:forEach items="${seccion.diasseccions}" var="dia">
                                            <div><c:out  value="${dia.diaTaller} ${dia.horaInicio} - ${dia.horaFin} ${dia.lugar}"/></div>
                                           
						
                                        </c:forEach>
                                    
				</td>

		
			<td><c:out value="${seccion.cupos  - seccion.inscritos}" /></td>
		        
		
                        
                                <td>
                                    
                                        
                                        <c:forEach items="${seccion.seccionprofesors}" var="profesor">
                                            <div><c:out  value="${profesor.nombreProfesor} ${profesor.apellidoProfesor}"/></div>
                                           
						
                                        </c:forEach>
                                            
                                    
				</td>

                        
                        

                        <td><a href="<c:url value="/inscripciones/guardarSeccionAlumno.do?codSeccion=${seccion.codSeccion}&idTaller=${seccion.taller.idTaller}" />" >Tomar Seccion</a></td>


			</tr>
		</c:forEach>
		
		</table>
            </div>
		<h4>Secciones Tomadas</h4>
	
             <div class="tableWrap" >
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap">
	
		<tr>
		<th>Codigo Sección</th>
                <th>Nombre Sección</th>			
		<th>Dia Taller</th>
		<th>Cupos</th>
		
                <th>Profesores</th>
                <th>Eliminar Seccion</th>
                
                </tr>
		<c:forEach items="${listadoSeccionesTomadas}" var="seccion">
			<tr>
			
			<td><c:out value="${seccion.codSeccion}" /></td>
                        
                        <td><c:out value="${seccion.nombreSeccion}" /></td>
			
			
			
                               <td>
                                        <c:forEach items="${seccion.diasseccions}" var="dia">
                                            <div><c:out  value="${dia.diaTaller} ${dia.horaInicio} - ${dia.horaFin} ${dia.lugar}"/></div>
                                           
						
                                        </c:forEach>
                                    
				</td> 

		
			
			<td><c:out value="${seccion.cupos - seccion.inscritos}" /></td>
			
		
			
			
			
                
                                <td>
                                        
                                        <c:forEach items="${seccion.seccionprofesors}" var="profesor">
                                            <div><c:out  value="${profesor.nombreProfesor}  ${profesor.apellidoProfesor}"></c:out> </div>
                                           
						
                                        </c:forEach>

				</td>
			

                        
                        

				<td><a onclick="return confirm('esta seguro?')" 
				href="<c:url value="/inscripciones/eliminarSeccionAlumno.do?codSeccion=${seccion.codSeccion}&idTaller=${seccion.taller.idTaller}" />" >Eliminar</a></td>

			</tr>
		</c:forEach>
		
		</table>
            </div>
        
            </div>
        
 </div>
<script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
</body>

</html>
