<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="header">
        
   

    </jsp:attribute>
    <jsp:attribute name="footer">
      
    </jsp:attribute>
    <jsp:body>
        		
         <form action="EncuestadorServlet?action=guardar" method="POST">
            <div class="col-md-6 col-md-offset-3">
		<div class="panel panel-default">
			
			<div class="panel-heading">
				<b>Registrese Gratis!!</b>
			</div>

			<div class="panel-body">	

					<div class="form-group">
						<label class="col-md-4 control-label" >Nombre</label>
						<div class="col-md-8">
							<input type="text" value="${encuestador.getNombre()}" class="form-control" id="nombre" name="nombre" placeholder="Nombre de Encuestado" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" >Apellido</label>
						<div class="col-md-8">
							<input type="text" value="${encuestador.getApellido()}" class="form-control" id="apellido" name="apellido" placeholder="Apellido de Encuestado" />
						</div>
					</div>
                                                
                                         <div class="form-group">
						<label class="col-md-4 control-label" >Nick</label>
						<div class="col-md-8">
							<input type="text" value="${encuestador.getNick()}" class="form-control" id="nick" name="nick" placeholder="Nick Encuestado" />
						</div>
					</div>       
                                                
                                        <div class="form-group">
						<label class="col-md-4 control-label" >Rut</label>
						<div class="col-md-8">
							<input type="text" value="${encuestador.getRut()}" class="form-control" id="rut" name="rut" placeholder="Rut Encuestado" />
						</div>
					</div> 
                                                
                                         
                                                
                                        <div class="form-group">
						<label class="col-md-4 control-label" >Contraseña</label>
						<div class="col-md-8">
                                                    <input type="password" value="${encuestador.getContrasena()}" class="form-control" id="contrasena" name="contrasena" placeholder="Contraseña Encuestado" />
						</div>
					</div> 
					<div class="form-group">
						<label class="col-md-4 control-label" for="email">Email</label>
						<div class="col-md-8">
							<input type="text" value="${encuestador.getEmail()}" class="form-control" id="email" name="email" placeholder="Email de encuestado" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label" for="fnacimiento">Fecha de Nacimiento</label>
						<div class="col-md-6">
			   				<input type="date" name="" id="input" class="form-control" value="" required="required" title="">
						</div>
					</div>	

					<div class="form-group">
						<label class="col-md-4 control-label" for="sexo">Sexo</label>
						<div class="col-md-8">
						<select id="dpbox_sexo" class="form-control" required="required">
								<option>Masculino</option>
								<option>Femenino</option>
								<option>Otro</option>
						</select>
						</div>
					</div>
			
                                                
		
					
			</div>
                                                <div class="panel-footer">
                                                    <div class="form-group">	

                                                        <A href="${request.getContextPath()}login.jsp" class="btn btn-primary">Login</a>                                                        
							
                                                
                                                			
                                                         
                                                         <button type="submit" class="btn btn-primary pull-right">REGISTRAR</button>   
                                                    </div>
                                                    
                                                </div>  
                                                
			<!-- Fin del panel principal -->			
		</div>
	</div>				
	
            
        </form>

    </jsp:body>
</t:template>