<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- 
    Document   : newjsp
    Created on : 13-03-2015, 05:26:56 PM
    Author     : Luis
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link href="resources/css/normalize.css" rel="stylesheet" />
    <link href="resources/css/main.css" rel="stylesheet" />
    <link href="resources/css/bootstrap.css" rel="stylesheet" />
    <link href="resources/css/jquery-ui.css" rel="stylesheet" />
    <link href="resources/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="resources/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="resources/js/main.js"></script>
       
  

        <title>Login Error</title>
    </head>
    <body>
        <div class="container">
            <h2>Colegio Santa cruz de Chicureo - Talleres Online</h2>
        <h3>Fallo de autenticación</h3>
         <%
                List<String> errores = request.getAttribute("errores") != null ? (List<String>) request.getAttribute("errores") : new ArrayList<String>();
                if (errores.size() > 0) {

                    for (String s : errores) {
            %>  
            <div class="alert alert-error">  
                <a class="close" data-dismiss="alert">×</a>  
                <strong><%=s%></strong>
            </div>  
            <%
                    }
                }
            %>     
        <a href="login.do">volver</a>    
        </div>
            <script type="text/javascript" src="resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script type="text/javascript" src="resources/js/jquery.tablesorter.js"></script> 
    </body>
</html>
