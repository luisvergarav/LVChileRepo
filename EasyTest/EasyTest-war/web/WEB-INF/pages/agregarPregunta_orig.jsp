
<%@page import="java.util.Set"%>
<%@page import="model.entities.Pregunta"%>
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%
Pregunta pregunta = (Pregunta)request.getAttribute("pregunta");


Evaluacion evaluacion = (Evaluacion) request.getAttribute("evaluacion");


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
        <h1>Agregar Pregunta</h1>
        <form action="EvaluacionServlet?action=guardarPregunta" method="POST">
            <table>
            <tr>
                <td>Id Evaluacion</td>
                <td>
            <input type="text" name="idEvaluacion" value="<%=evaluacion.getIdEvaluacion()%>" />
                </td>
            </tr>
            <tr>
                <td>Texto Pregunta</td>
                <td>
            <input type="text" name="textoPregunta" value="<%=pregunta.getTextoPregunta()%>" />
                </td>
            </tr>
            <tr>
                <td>Tipo Pregunta</td>
                <td>
            <input type="text" name="tipoPregunta" value="<%=pregunta.getTipoPregunta()%>" />
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
		<th>Id</th>
		<th>Texto Pregunta</th>
		<th>Tipo Pregunta</th>		
		
		</tr>
		
		<% for (Pregunta pregunta1:(Set<Pregunta>)evaluacion.getEvaluacionpreguntases()){%>
			<tr>
                            
                            <td>
			<%=pregunta1.getIdPregunta()%>
			</td>
			<td>
			<%=pregunta1.getTextoPregunta()%>
			</td>
			<td>
			<%=pregunta1.getTipoPregunta()%>
			</td>
			
			
			
			
                        
			</tr>
		<%}%>
		
		</table>   
                <a href="TestServlet?action=agregar&idEvaluacion=<%=evaluacion.getIdEvaluacion()%>">Copia este Link</a>
                
    </body>
</html>
