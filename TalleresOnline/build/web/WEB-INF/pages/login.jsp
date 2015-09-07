<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es"> <!--<![endif]-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <link href="resources/css/normalize.css" rel="stylesheet" />
    <link href="resources/css/main.css" rel="stylesheet" />
    <link href="resources/css/bootstrap.css" rel="stylesheet" />
    <link href="resources/css/jquery-ui.css" rel="stylesheet" />
    <link href="resources/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="resources/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="resources/js/main.js"></script>
<title>Login Page</title>
<style type="text/css">
    .container{
        top:200px;
        position:relative;
        background:#4d6077
        
    }
    .table  tbody{
        border-color:#4d6077;
    }
 
    .table tbody tr{
border-color:#4d6077;
}
.container table tr  td{
background: #4d6077;
}
</style>
</head>
<body onload='document.f.j_username.focus();'>
	
 
	<c:if test="${not empty error}">
		<div class="errorblock">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>
<div class="container"> 
    <div  class=" pull-left" style="padding: 10px;">
        <h3 style="font-size: large;color: #ffffff"> Talleres OnLine </h3>
    </div>
<div  class=" pull-right" style="padding: 10px">
   
	<form name='f' action="<c:url value='j_spring_security_check' />"
		method='POST'>
                
            <table class=" tableWrapSmall table-borderless">
                    <tr style=" border-left: solid 1px;color:#ffffff;">
                        <td style="padding-left: 10px"><p style="color: #ffffff">Usuario:</p>
				<td colspan="2" style="padding-left: 10px"><input type='text' name='j_username' value=''/>
				</td>
			</tr>
			<tr style="border-left:solid 1px;color:#ffffff">
				<td style="padding-left: 10px"><p style="color: #ffffff">Contraseña:</p></td>
				<td colspan="2" style="padding-left: 10px"><input type='password' name='j_password' />
				</td>
			</tr>
			<tr style="border-left: solid 1px;color:#ffffff">
                                <td style="padding-left: 10px"                                    ></td>
                                <td colspan="2" style="padding-left: 10px"><button name="submit"  type="submit" class="btn btn-primary"
					value="Aceptar">Aceptar</button>
				
				</td>
			</tr>
		</table>
 
	</form>
                </div>
</div>
</div>    
<script type="text/javascript" src="resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script type="text/javascript" src="resources/js/jquery.tablesorter.js"></script> 
</body>
</html>
