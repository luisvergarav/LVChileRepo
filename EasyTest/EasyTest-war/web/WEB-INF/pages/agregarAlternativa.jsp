
<%@page import="model.Entities.Alternativas"%>
<%@page import="java.util.Set"%>
<%@page import="model.Entities.Pregunta"%>
<%@page import="model.Entities.Encuestador"%>
<%@page import="model.Entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%



Alternativas alternativa = (Alternativas) request.getAttribute("alternativa");

%>

<%-- 
    Document   : agregarPregunta
    Created on : 27-11-2014, 08:04:42 PM
    Author     : Luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Agregar Alternativa</h1>
        <form action="EvaluacionServlet?action=guardarAlternativa" method="POST">
            <table>
            <tr>
                <td>Texto</td>
                <td>
            <input type="text" name="textoAlternativa" value="<%=alternativa.getTextoAlternativa()%>" />
                </td>
            </tr>
            <tr>
                <td>Puntaje</td>
                <td>
            <input type="text" name="puntajeAlternativa" value="<%=alternativa.getPuntaje()%>" />
                </td>
            </tr>
            <tr>
                <td>Correcta ?</td>
                <td>
            <input type="text" name="correctaAlternativa" value="<%=alternativa.getCorrecta()%>" />
                </td>
            </tr>
            
            <tr>
                <td></td>
                <td>
            <input type="submit" value="Guardar" name="guardar" />
                </td>
            </tr>
            
        </form>
                
        <table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter">
	
		<tr>
		
                <th>Texto Alternativa</th>
		<th>Correcta</th>		
		<th>Puntaje</th>
		</tr>
		
		<% for (Alternativas alternativas1:(Set<Alternativas>)alternativa.getPregunta().getAlternativases()){%>
			<tr>
                            
                            <td>
			<%=alternativas1.getTextoAlternativa()%>
			</td>
			<td>
			<%=alternativas1.getCorrecta()%>
			</td>
			<td>
			<%=alternativas1.getPuntaje()%>
			</td>
			
			
			
			
                        
			</tr>
		<%}%>
		
		</table>   
                
                
    </body>
</html>
