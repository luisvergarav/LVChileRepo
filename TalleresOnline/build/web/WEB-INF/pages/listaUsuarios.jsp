<%@page import="models.VO.CartBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ include file="TopTemplate.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es"> <!--<![endif]-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link href="../resources/css/normalize.css" rel="stylesheet" />
    <link href="../resources/css/main.css" rel="stylesheet" />
    <link href="../resources/css/bootstrap.css" rel="stylesheet" />
    <link href="../resources/css/jquery-ui.css" rel="stylesheet" />
    <link href="../resources/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="../resources/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../resources/js/main.js"></script>

<title>${titulo}</title>
</head>
<body>
        


<div class="container" id="content">
    


        
        
  
    
    <h3>
		<c:out value="${titulo}" />
	</h3>

	<p>
		
	</p>
	<div class="tableWrap">
	
	<table class="table table-filter tableWrap" data-url="data2.json" data-height="400" data-pagination="true" data-search="true">
	<tbody>
	
	
	
	<tr>
            <td> <label>Lista Usuarios</label></td>
            
            <td> <label></label></td>	
        
        </tr>
       
	</tbody>
	</table>
	
	</div>
	
        	<a href="<%=request.getContextPath()%>/sistema/crearUsuario.do">Crear Usuario (+)</a>
        
        <div class="overflow"  >
	<table id="tabla1" cellpadding='3'  cellspacing='2' class="table table-filter tableWrap table-striped">
	
          
         
		<tr>	
                    <th>Username</th>                	
                <th>Roles</th>                                
                <th>Editar</th>
                </tr>
		<c:forEach items="${listaUsuarios}" var="usuario">
			<tr>
			
                            <td>
                                <div>
                                    <img width="50" height="50" src="<%= request.getContextPath() %>/resources/img/perfil.jpg"/>
                                </div>    
                                <div>
                                    <c:out value="${usuario.username}" />
                                </div>
                            </td>
			
			<td>
                            <div>
                            <c:forEach items="${usuario.userRoleses}" var="rol">    
                            <c:out value="${rol.authority} " />
                            </c:forEach>
                            </div>
                        </td>
                        
                        
                        

                            <td><a href="<c:url value="/sistema/editarUsuario.do?userId=${usuario.userId}" />" >Editar</a></td>

			</tr>
		</c:forEach>
		
		</table>
            </div>
        
        
</div>
            
<script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
<script type="text/javascript">
        
</script>
<script>
$(document).ready(function(){
    $('#tabla1').dataTable();
});
</script>


</body>

</html>
