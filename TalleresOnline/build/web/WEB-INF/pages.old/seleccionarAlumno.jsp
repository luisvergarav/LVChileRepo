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
    <input type="hidden" id ="semestreGlobal" value="${semestreActivo.idsemestre}">
    <h3>
		<c:out value="${titulo}" />
	</h3>

	<p>
		
	</p>
	<div class="tableWrap">
	
	<table class="table table-filter tableWrap">
	<tbody>
	
	
	
	<tr>
            <td> <label>Nombre Apoderado</label></td>
            
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
                <th>Recha Nacimiento</th>
                <th>Curso</th>
                
                <th></th>
                </tr>
		<c:forEach items="${listaAlumnos}" var="alumno">
			<tr>
			
			<td><c:out value="${alumno.rutAlumno}" /></td>
			
			<td><c:out value="${alumno.primerNombre}" /></td>
                        
                        <td><c:out value="${alumno.segundoNombre}" /></td>
                        
                        <td><c:out value="${alumno.apellidoPaterno}" /></td>
			
			<td><c:out value="${alumno.apellidoMaterno}" /></td>

                        <td><c:out value="${alumno.fechaNacimiento}" /></td>			                        
                        
                        <td><c:out value="${alumno.curso} ${alumno.nivel}" /></td>
                        
                        <c:if test="${ semestreActivo.idsemestre>0}" >
				<td><a href="<c:url value="/inscripciones/listadoInscripciones.do?rutAlumno=${alumno.rutAlumno}" />" >Inscribir</a></td>
                        </c:if>                
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
