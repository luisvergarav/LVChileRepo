<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Encuestador encuestador = (Encuestador )request.getAttribute("encuestador");


//List<String> errores = (List<String>) request.getAttribute("errores");

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Education Zone</title>
<link href="resources/css/style_Carlos.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="topPan">
    <p><h1>Easy Test</h1></p>
  <div id="topMenuPan">
    <div id="topMenuLeftPan"></div>
    <div id="topMenuMiddlePan">
      <ul>
        <li class="home">Home</li>
        <li><a href="<%=request.getContextPath()%>/EncuestadorServlet?action=agregar">Crear Encuestador</a></li>
        <c:if test="<%=encuestador.getIdEncuestador() > 0%>">
        <li><a href="<%=request.getContextPath()%>/EvaluacionServlet?action=agregar">Crear Test</a></li>
        </c:if>
        <li class="contact"><a href="#" class="contact">Contacto</a></li>
      </ul>
    </div>
    <div id="topMenuRightPan">
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </div>
  </div>
</div>
<div id="bodyPan">
  
   <h1>Agregar Encuestador</h1>
        <form action="EncuestadorServlet?action=guardar" method="POST">
            <table>
            <tr>
                <td>Id</td>
                <td>
            <input type="text" name="idEncuestador" value="<%=encuestador.getIdEncuestador()%>" />
                </td>
            </tr>
            <tr>
                <td>Nombre</td>
                <td>
            <input type="text" name="nombre" value="<%=encuestador.getNombre()%>" />
                </td>
            </tr>
            <tr>
                <td>Apellido</td>
                <td>
            <input type="text" name="apellido" value="<%=encuestador.getApellido()%>" />
                </td>
            </tr>
            <tr>
                <td>Nick</td>
                <td>
            <input type="text" name="nick" value="<%=encuestador.getNick()%>" />
                </td>
            </tr>
              <tr>
                <td>Rut</td>
                <td>
            <input type="text" name="rut" value="<%=encuestador.getRut()%>" />
                </td>
            </tr>
            <tr>
                <td>Contraseña</td>
                <td>
            <input type="text" name="contrasena" value="<%=encuestador.getContrasena()%>" />
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
            <input type="text" name="email" value="<%=encuestador.getEmail()%>" />
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
</div>
<div id="footermainPan">
  <div id="footerPan">
    
    <p class="copyright">©AbcBytes All right reserved.</p>
    <ul class="templateworld">
      <li>design by:</li> 
      ABC Bytes
      <li> </li>
    </ul>
    <div id="footerPanhtml"><a href="http://validator.w3.org/check?uri=referer" target="_blank">HTML</a></div>
    <div id="footerPancss"><a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank">css</a></div>
  </div>
</div>
</body>
</html>
