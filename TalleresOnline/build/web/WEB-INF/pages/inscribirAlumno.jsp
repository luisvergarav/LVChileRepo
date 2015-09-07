<%@page import="java.util.List"%>
<%@page import="models.VO.CartBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<style>
.imgCarro{
width: 30px !important ;
height: 30px !important;
}
</style>
</head>
<body>
      
 <div class="container" id="content"> 
    <div>
        <h3><c:out value="Carro de Compras (${cart.listaTalleres.size()}) Taller" />
            
            <a href="<c:url value="/inscripciones/verBolsa.do" />" ><img class="imgCarro" src="<%= request.getContextPath() %>/resources/img/carro.png"/></a></h3>
    </div>
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
            
            <td> <label>Curso : ${alumno.curso}${alumno.nivel}</label></td>
          
            
        </tr>
       
	</tbody>
	</table>
	
	</div>
        
       <h3>
		<c:out value="Listado de Talleres Disponibles para Inscripcion  " />
	</h3>

        
        <div class="tableWrap" >
         <div class="tableWrap" >
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter  tableWrap table-striped">
	
		<tr>
		<th></th>
		<th>Taller</th>
		
                <th>Monto</th>
                  <th>Seleccionar</th>
                  <th>Horario</th>
                </tr>
		<c:forEach items="${listaTalleresDisponibles}" var="taller">
			<tr>
						
			
                        <td><div
                              <c:choose>
                                     <c:when test="${taller.tipoTaller.nombre == 'HOCKEY'}">class="deportes_sprite2 hockey"
                                     </c:when>                                     
                                    <c:when test="${taller.tipoTaller.nombre == 'TENIS'}">class="deportes_sprite2 tenis"
                                    </c:when> 
                                    <c:otherwise>
                                        
                                    </c:otherwise>
                                 </c:choose>
                                >
                            
                            </div>
                            <div>
                                <c:out value="${taller.nombreTaller}" />
                            </div>
                        </td>			                            
			
			<td>
                            <div>
                            <c:out value="${taller.claseTaller} - ${taller.tipoTaller.nombre} - Cupos ${taller.cupos - taller.inscritos}"  />
                            </div>
                            <div>
                                <c:out value="Inicio ${taller.inicioTaller} - Termino ${taller.terminoTaller}" />
                            </div>
                        </td>			
			<c:if test="${taller.claseTaller == 'CO'}">
                        <td><c:out value="$${fn:replace(taller.monto,'.00','')}" /></td>
                        </c:if>
                        <c:if test="${taller.claseTaller == 'CU'}">
                        <td><c:out value="GRATIS" /></td>
                        </c:if>

                        

                        <td><a onclick="return confirm('esta seguro?')" 
				href="<c:url value="/inscripciones/guardarInscripcion.do?idTaller=${taller.idTaller}" />" ><img width="30" height="30" src="<%= request.getContextPath() %>/resources/img/seleccionar.jpg"/></a></td>
                        <td>
                            <c:forEach items="${taller.seccions}" var="seccion">
                                <c:forEach items="${seccion.diasseccions}" var="dia">
                                <div>
                                <c:out value="${fn:substring(dia.diaTaller,0,3)} - Hora Inicio ${dia.horaInicio}- Hora Fin ${dia.horaFin}" />
                                </div>
                                </c:forEach>
                            </c:forEach>
                        </td>

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
