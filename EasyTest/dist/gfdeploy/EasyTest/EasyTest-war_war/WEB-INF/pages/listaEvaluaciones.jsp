
<%@page import="java.util.Set"%>
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%

List<Evaluacion> listaEvaluaciones = (List<Evaluacion>) request.getAttribute("listaEvaluaciones");
//Encuestador encuestador = (Encuestador) request.getAttribute("encuestador");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="header">
        
  

    </jsp:attribute>
    <jsp:attribute name="footer">

    </jsp:attribute>
    <jsp:body>

        <div class="container">        
<div id="" class="panel panel-default">
  
<div id="" class="panel panel-heading">
		Lista de evaluaciones
</div>


    
	<table id="tabla1"  class="table table-striped">
	
		<tr>
		<th>Id</th>
		<th>Encabezado</th>
		<th>Pie de Pagina</th>		
                <th>Editar</th>
		<th>Eliminar</th>
		</tr>
		
                <c:forEach  var="evaluacion" items="${listaEvaluaciones}"  varStatus="counter" >
			<tr>
			<td>
                            <c:out value="${evaluacion.getId()}"/>
			</td>
			<td>
			<c:out value="${evaluacion.getCabecera()}"/>
			</td>
			
			<td>
			<c:out value="${evaluacion.getPiepagina()}"/>
			</td>
			
			
			<td>
			
			 <a href="<c:out value="${request.getContextPath()}"/>EvaluacionServlet?action=editar&idEvaluacion=${evaluacion.getId()}">Editar</a>
			</td>
				<td>
			
			 <a onclick="return confirm('¿Seguro que desea eliminar?')" href="<c:out value="${request.getContextPath()}"/>EvaluacionServlet?action=eliminar&idEvaluacion=${evaluacion.getId()}">Eliminar</a>
			</td>
			</tr>
                </c:forEach>
		
		</table>
    </div>
</div>

    </jsp:body>
</t:template>