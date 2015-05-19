<%-- 
    Document   : listaEvaluaciones
    Created on : 27-11-2014, 09:18:46 PM
    Author     : Luis
--%>
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%

List<Encuestador> listaEncuestadores = (List<Encuestador>) request.getAttribute("listaEncuestadores");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       	</form>
	</div>
	<a href="<%=request.getContextPath()%>/mantenedorServlet?action=agregarUsuario">Crear Encuestador (+)</a>
        
       <h3><%=listaEncuestadores.size()%> Usuarios Encontrados</h3>
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter">
	
		<tr>
		<th>Nombre</th>
		<th>Apellido</th>
		<th>rut</th>		
		<th>Eliminar</th>
		</tr>
		
		<% for (Encuestador encuestador:listaEncuestadores){%>
			<tr>
			
			<td>
			<%=encuestador.getNombre()%>
			</td>
			
			<td>
			<%=encuestador.getApellido()%>
			</td>
                        <td>
			<%=encuestador.getRut()%>
			</td>
			
			
			<td>
			
			 <a href="<%=request.getContextPath()%>/mantenedorServlet?action=editarUsuario&idEncuestador=<%=encuestador.getIdencuestador()%>">Editar</a>
			</td>
				<td>
			
			 <a onclick="return confirm('¿Seguro que desea eliminar?')" href="<%=request.getContextPath()%>/mantenedorServlet?action=eliminarUsuario&idEncuestador=<%=encuestador.getIdencuestador()%>">Eliminar</a>
			</td>
			</tr>
		<%}%>
		
		</table>
    </body>
</html>
