<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
Encuestador encuestador = (Encuestador )request.getAttribute("encuestador");


//List<String> errores = (List<String>) request.getAttribute("errores");

%>
 <t:template>
    <jsp:attribute name="header">
        


    </jsp:attribute>
    <jsp:attribute name="footer">
     
    </jsp:attribute>
    <jsp:body>
  
        <form action="mantenedorServlet?action=guardarUsuario" method="POST" id="registroForm">
            <div class="col-md-6 col-md-offset-3">
		<div class="panel panel-default">
			
			<div class="panel-heading">
				<b>Datos del Usuario</b>
			</div>

			<div class="panel-body">	
                            <div class="form-group">
						<label class="col-md-4 control-label" >Rut</label>
						<div class="col-md-8">
							<input type="text"  value="${encuestador.getIdencuestador()}"    id="idEncuestador" name="idEncuestador"/>
						</div>
					</div>
                            
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
			
                                        <div class="form-group">
						<label class="col-md-4 control-label" for="membership">Rol</label>
						<div class="col-md-8">
							<select class="form-control" id="rol" name="rol">
								<option value="0">-Selecciona un perfil a asignar-</option>
								<option value="Encuestador">Encuestador</option>
								<option value="Jefe de Personal">Jefe de Personal</option>
                                                                <option value="Jefe de Estudio">Jefe de Estudio</option>
                                                                <option value="Timer">Timer</option>
							</select>
						</div>
					</div>
					<br>
		
					<div class="form-group">
						<div class="col-md-4 col-md-offset-5">
							<button type="submit" class="btn btn-primary">ENVIAR</button>
						</div>
					</div>
			</div>
			<!-- Fin del panel principal -->			
		</div>
	</div>				
	
            
        </form>

    </jsp:body>
      

</t:template>

