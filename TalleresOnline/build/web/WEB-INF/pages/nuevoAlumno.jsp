<%-- 
    Document   : nuevoAlumno
    Created on : 28-02-2015, 04:21:59 PM
    Author     : Luis
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="nuevoAlumnoDiv" class="tableWrap">
    <form:form commandName="alumno" action="crearAlumno.do" method="post">
	<div class="modal-header">
		<h2>Agregar Alumno</h2>
	</div>
	<div class="modal-body">
            
                    
                
	    <table id="mantenedor" class="table table-condensed table-marginless">
	    	<caption>Nuevo Alumno</caption>
			<tbody>
    
     
				<tr>
					<td><label>Rut Alumno</label></td>
                                        <td><form:input class="input-xlarge" path="rutAlumno"/></td>
                                </tr>
                                
					<td colspan="3">
						<select id="convenio" class="input-large">
							<option>Seleccione</option>
							<option>01017 - Bienes Raíces</option><!-- Habilita campos de bien raiz y comuna -->
						</select>
					</td>
				
				<tr>
					<td><label>Primer Nombre</label></td>
                                        <td><form:input class="input-xlarge" path="primerNombre"/></td>
					<td><label>Segundo Nombre</label></td>
                                        <td><form:input class="input-xlarge" path="segundoNombre"/></td>
					
				</tr>
				<tr>
					<td><label>Apellido Paterno</label></td>				
                                        <td><form:input class="input-xlarge" path="apellidoPaterno"/></td>
					<td><label>Apellido Materno</label></td>
                                        <td><form:input class="input-xlarge" path="apellidoMaterno"/></td>
					
				</tr>					
				<tr>
					<td><label>Fec. Nacimiento</label></td>
					<td><form:input class="input-small datepicker" path="fechaNacimiento"/></td>
					<td><label>Curso</label></td>
					<td><form:input class="input-small" path="curso"/></td>
					
				</tr>
				<tr>
					<td><label>Sexo</label></td>
					<form:select path="sexo" >                                
                                        <form:option  value="0" label="seleccionar=>"></form:option>
                                        <form:option label="M" value="Masculino"></form:option>
                                        <form:option label="F" value="Femenino"></form:option>
                                        </form:select>
					<td><label>Direccion</label></td>
					<td><form:input class="input-xlarge" path="direccion"/></td>
				</tr>
				<tr>
					<td><label>Fono</label></td>				
                                        <td><form:input class="input-xlarge" path="fono"/></td>
					<td><label>Nivel</label></td>
                                        <td><form:input class="input-xlarge" path="nivel"/></td>
					
				</tr>					
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<div class="btn-toolbar">
			<div class="pull-right">
				<button class="btn">Limpiar</button>
                                <button name='boton' type='submit' data-dismiss="modal"  class="btn btn-primary">Guardar</button>				
				<button class="btn" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
    </form:form>                                        
</div>