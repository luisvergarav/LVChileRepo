<%-- 
    Document   : listaEvaluaciones
    Created on : 27-11-2014, 09:18:46 PM
    Author     : Luis
--%>
<%@page import="java.util.Set"%>
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%

List<Evaluacion> listaEvaluaciones = (List<Evaluacion>) request.getAttribute("listaEvaluaciones");
Encuestador encuestador = (Encuestador) request.getAttribute("encuestador");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
		Lista de evaluaciones
	</h1>
        	<table class="table table-filter">
	<tbody>
	
	
	<tr>
		<td>Ingrese Evaluacion a buscar</td>
	</tr>
	<tr>
		<td><input name='desc' type='text'></input></td>
	</tr>
	<tr>
		<td><input name='boton' type='submit' value='Enviar'/></td>
	</tr>
	
	</tbody>
	</table>
	</form>
	</div>
	<a href="<%=request.getContextPath()%>/EvaluacionServlet?action=agregar&idEncuestador=<%=encuestador.getIdEncuestador()%>">Crear Evaluacion (+)</a>
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter">
	
		<tr>
		<th>Id</th>
		<th>Encabezado</th>
		<th>Pie de Pagina</th>		
		<th>Eliminar</th>
		</tr>
		
		<% for (Evaluacion evaluacion:listaEvaluaciones){%>
			<tr>
			<td>
			<%=evaluacion.getIdEvaluacion()%>
			</td>
			<td>
			<%=evaluacion.getCabecera()%>
			</td>
			
			<td>
			<%=evaluacion.getPiePagina()%>
			</td>
			
			
			<td>
			
			 <a href="<%=request.getContextPath()%>/EvaluacionServlet?action=editar&idEvaluacion=<%=evaluacion.getIdEvaluacion()%>">Editar</a>
			</td>
				<td>
			
			 <a onclick="return confirm('¿Seguro que desea eliminar?')" href="<%=request.getContextPath()%>/EvaluacionServlet?action=eliminar&idEvaluacion=<%=evaluacion.getIdEvaluacion()%>">Eliminar</a>
			</td>
			</tr>
		<%}%>
		
		</table>
    </body>
</html>
