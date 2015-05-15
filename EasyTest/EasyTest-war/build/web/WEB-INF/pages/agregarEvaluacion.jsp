<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="model.entities.Plantilla"%>
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Evaluacion evaluacion = (Evaluacion )request.getAttribute("evaluacion");

List<Plantilla> plantillas = (List<Plantilla>) request.getAttribute("listaPlantillas");

%>

<t:template>
    <jsp:attribute name="header">
       <style>
           #body{
               background: #999999;
           }
       </style>

 <h1>Easy Test</h1>
    </jsp:attribute>
    <jsp:attribute name="footer">

    </jsp:attribute>
    <jsp:body>
        
        <div class="panel panel-default" style="width:70%;left:15%;right:15%;padding-bottom: 15%;position: relative">
            <div class="panel-heading">Crear Evaluacion</div>
        
            <div class="panel-body">
        <form action="EvaluacionServlet?action=guardar" method="POST">
            <table>
            <tr>
                <td>
                    IdEncuestador
                </td>
                <td>
                    <input type="text" name="idEncuestador" value="${evaluacion.getEncuestador().getIdencuestador()}" />
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
                    <input type="text" name="piePagina" value="${evaluacion.getPiepagina()}" />
                </td>
              
            </tr>
                
                 <tr>
                <td>
                    Item
                </td>
                <td>
                    <input type="text" name="item" value="${evaluacion.getItem()}" />
                </td>
              
            </tr>
                     <tr>
                <td>
                    Mensaje Confirmacion
                </td>
                <td>
                    <input type="text" name="mensajeconfirmacion" value="${evaluacion.getMensajeconfirmacion()}" />
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
                <option value="${plantilla.getIdplantilla()}">
                        ${plantilla.getDescripcion()}
                    </option>
                </c:forEach>   
              
            </select>
              </td>
            </tr>
         </table>
        </form>
        </div>
     </div>
    </jsp:body>
</t:template>

