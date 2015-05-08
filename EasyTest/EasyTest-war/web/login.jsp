<%-- 
    Document   : login
    Created on : 23-abr-2015, 13:41:57
    Author     : VASS13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                 <link href="resources/css/bootstrap.min.css" rel="stylesheet">
             <link href="css/bootstrapValidator.min.css" rel="stylesheet"/>
    <script src="js/bootstrapValidator.min.js" type="text/javascript"></script>
         
    </head>
    <body>
        <form action="<%= response.encodeURL("j_security_check") %>" method="POST">
            <div class="col-md-6 col-md-offset-3">
		<div class="panel panel-default">
			
			<div class="panel-heading">
				<b>Login</b>
			</div>

			<div class="panel-body">	

					<div class="form-group">
						<label class="col-md-4 control-label" >Nombre</label>
						<div class="col-md-8">
							<input type="text"  class="form-control"  name="j_username" placeholder="Usuario" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" >Apellido</label>
						<div class="col-md-8">
                                                    <input type="password" class="form-control"  name="j_password" placeholder="Contraseña" />
						</div>
					</div>
                                               <div class="form-group center-block"> 
                                       <button type="submit" class="btn btn-primary">Login</button> 
                                               </div>
		
					
			</div>
                                             
                                                
                                                			
                                                         
                                                           
                                             
                                                
			<!-- Fin del panel principal -->			
		</div>
	</div>				
	
            
        </form>
            <!--
        <form method="POST" action='<%= response.encodeURL("j_security_check") %>'>
<table border="0" cellspacing="5">
<tr>
<th align="right">Usuario:</th>
<td align="left"><input type="text" name="j_username"></td>
</tr>
<tr>
<th align="right">Contraseña:</th>
<td align="left"><input type="password" name="j_password"></td>
</tr>
<tr>
<td align="right"><input type="submit" value="Login"></td>
<td align="left"><input type="reset" value="Borrar"></td>
</tr>
</table>
</form>
            -->
 <script src="https://code.jquery.com/jquery.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    </body>
</html>
