
<%@page import="model.entities.Plantilla"%>
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Evaluacion evaluacion = (Evaluacion )request.getAttribute("evaluacion");

List<Plantilla> plantillas = (List<Plantilla>) request.getAttribute("listaPlantillas");

%>

<%-- 
    Document   : agregarEvaluacion
    Created on : 27-11-2014, 08:04:42 PM
    Author     : Luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> 
        <h1>Agregar Evaluacion</h1>
        <form action="EvaluacionServlet?action=guardar" method="POST">
            <input type="text" name="idEncuestador" value="<%=evaluacion.getEncuestador().getIdEncuestador()%>" />
            <input type="text" name="cabecera" value="<%=evaluacion.getCabecera()%>" />
            <input type="text" name="piePagina" value="<%=evaluacion.getPiePagina()%>" />
            <input type="submit" value="Guardar" name="guardar" />
            <select      name="idPlantilla">
                <% for (Plantilla plantilla:plantillas){%>
                <option value=<%=plantilla.getIdPlantilla()%>>
                        <%=plantilla.getDescripcion()%>
                    </option>
                <%}%>   
              
            </select>
        </form>
    </body>
</html>
