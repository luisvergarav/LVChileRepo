<%-- 
    Document   : logout.jsp
    Created on : 23-abr-2015, 14:17:26
    Author     : VASS13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if (request.getParameter("logoff") != null) {
session.invalidate();
response.sendRedirect("index.jsp");
return;
}
%>
<html>
<head>
<title>Home del área protegida</title>
</head>
<body bgcolor="white">

Estas conectado como <b><%= request.getRemoteUser() %></b>
con ID de sesión <b><%= session.getId() %></b><br><br>

<br>

Pulse para cerrar la sesión 

<a href='<%= response.encodeURL("index.jsp?logoff=true") %>'>aquí</a>.
Esto debe forzar la carga de la página de log
</body>
</html>
