<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
Encuestador encuestador = (Encuestador )request.getAttribute("encuestador");


//List<String> errores = (List<String>) request.getAttribute("errores");

%>
<t:template>
    <jsp:attribute name="header">
        
      <h1>Easy Test</h1>

    </jsp:attribute>
    <jsp:attribute name="footer">
      <p id="copyright">Copyright 1927, Future Bits When There Be Bits Inc.</p>
    </jsp:attribute>
    <jsp:body>
        <h1>Agregar Encuestador</h1>
        <form action="EncuestadorServlet?action=guardar" method="POST">
            <table>
            <tr>
                <td>Id</td>
                <td>
            <input type="text" name="idEncuestador" value="${encuestador.getIdEncuestador()}" />
                </td>
            </tr>
            <tr>
                <td>Nombre</td>
                <td>
            <input type="text" name="nombre" value='${encuestador.getNombre()}' />
                </td>
            </tr>
            <tr>
                <td>Apellido</td>
                <td>
            <input type="text" name="apellido" value="${encuestador.getApellido()}" />
                </td>
            </tr>
            <tr>
                <td>Nick</td>
                <td>
            <input type="text" name="nick" value="${encuestador.getNick()}" />
                </td>
            </tr>
              <tr>
                <td>Rut</td>
                <td>
            <input type="text" name="rut" value="${encuestador.getRut()}" />
                </td>
            </tr>
            <tr>
                <td>Contraseña</td>
                <td>
            <input type="text" name="contrasena" value="${encuestador.getContrasena()}" />
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
            <input type="text" name="email" value="${encuestador.getEmail()}" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
            <input type="submit" value="Guardar" name="guardar" />
                </td>
            </tr>
         </table>   
        </form>

    </jsp:body>
</t:template>

