<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:template>
    <jsp:attribute name="header">
        


    </jsp:attribute>
    <jsp:attribute name="footer">

    </jsp:attribute>
    <jsp:body>
       </form>
	</div>
	<a href="<c:out value="${request.getContextPath()}"/>mantenedorServlet?action=agregarUsuario">Crear Encuestador (+)</a>
        
       <h3>${listaEncuestadores.size()} Usuarios Encontrados</h3>
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter">
	
		<tr>
		<th>Nombre</th>
		<th>Apellido</th>
		<th>rut</th>		
		<th>Eliminar</th>
		</tr>
		
                <c:forEach var="encuestador" items="${listaEncuestadores}">
			<tr>
			
			<td>
			${encuestador.getNombre()}
			</td>
			
			<td>
			${encuestador.getApellido()}
			</td>
                        <td>
			${encuestador.getRut()}
			</td>
			
			
			<td>
			
			 <a href="<c:out value="${request.getContextPath()}"/>mantenedorServlet?action=editarUsuario&idEncuestador=${encuestador.getIdencuestador()}">Editar</a>
			</td>
				<td>
			
			 <a onclick="return confirm('¿Seguro que desea eliminar?')" href="<c:out value="${request.getContextPath()}"/>mantenedorServlet?action=eliminarUsuario&idEncuestador=${encuestador.getIdencuestador()}">Eliminar</a>
			</td>
			</tr>
                </c:forEach>
		
		</table>

    </jsp:body>
</t:template>