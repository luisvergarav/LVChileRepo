<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="model.entities.Plantilla"%>
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%
Evaluacion evaluacion = (Evaluacion )request.getAttribute("evaluacion");

List<Plantilla> plantillas = (List<Plantilla>) request.getAttribute("listaPlantillas");

%>

<t:template>
    <jsp:attribute name="header">
        
      <h1>Welcome</h1>

    </jsp:attribute>
    <jsp:attribute name="footer">
      <p id="copyright">Copyright 1927, Future Bits When There Be Bits Inc.</p>
    </jsp:attribute>
    <jsp:body>
        <h1>Agregar Evaluacion</h1>
        
        <form action="EvaluacionServlet?action=guardar" method="POST">
            <table>
            <tr>
                <td>
                    IdEncuestador
                </td>
                <td>
                    <input type="text" name="idEncuestador" value="${evaluacion.getEncuestador().getIdEncuestador()}" />
                </td>
            </tr>    
            <tr>
                <td>
                    Cabecera
                </td>
                <td>
                        <input type="text" name="cabecera" value="${evaluacion.getCabecera()}" />
                </td>
            </tr>
            <tr>
                <td>
                    Pie de Pagina
                </td>
                <td>
                    <input type="text" name="piePagina" value="${evaluacion.getPiePagina()}" />
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    <input type="submit" value="Guardar" name="guardar" />
                </td>
            </tr>
            <tr>
                <td>
                    Seleccione Plantilla
                </td>
                <td>
            <select      name="idPlantilla">
                <c:forEach var="plantilla" items="${listaPlantillas}" varStatus="counter">
                <option value="${plantilla.getIdPlantilla()}">
                        ${plantilla.getDescripcion()}
                    </option>
                </c:forEach>   
              
            </select>
              </td>
            </tr>
         </table>
        </form>
    </jsp:body>
</t:template>

