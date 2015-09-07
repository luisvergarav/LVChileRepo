
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="TopTemplate.jsp" %> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="../resources/css/normalize.css" rel="stylesheet" />
        <link href="../resources/css/main.css" rel="stylesheet" />
        <link href="../resources/css/bootstrap.css" rel="stylesheet" />
        <link href="../resources/css/jquery-ui.css" rel="stylesheet" />
        <link href="../resources/css/style.css" rel="stylesheet" />
        <script type="text/javascript" src="../resources/js/jquery-1.9.1.js"></script>
        <script type="text/javascript" src="../resources/js/main.js"></script>
        <title><c:out value="${titulo}" /></title>        
        <script src="resources/js/jquery-1.9.1.js"></script>


    </head>
    <body>
            
<div id="nuevoAlumnoDiv" class="tableWrapSmall modal hide">
    <div class="tableWrap">    
    <form:form commandName="alumno" action="crearAlumno.do" method="post">
	<div class="modal-header">
		<h2>Agregar Alumno</h2>
	</div>
	<div class="modal-body">
            
                    
                
	    <table id="mantenedor" class="table table-condensed table-filter table">
	    	<caption>Nuevo Alumno</caption>
			<tbody>
    
     
				<tr>
					<td><label>Rut Alumno</label></td>
                                        <td colspan="3"><form:input class="input-large" path="rutAlumno"/></td>
                                </tr>
                                
				<tr>
					<td><label>Primer Nombre</label></td>
                                        <td><form:input class="input-large" path="primerNombre"/></td>
					<td><label>Segundo Nombre</label></td>
                                        <td><form:input class="input-large" path="segundoNombre"/></td>
					
				</tr>
				<tr>
					<td><label>Apellido Paterno</label></td>				
                                        <td><form:input class="input-large" path="apellidoPaterno"/></td>
					<td><label>Apellido Materno</label></td>
                                        <td><form:input class="input-large" path="apellidoMaterno"/></td>
					
				</tr>					
				<tr>
					<td><label>Fec. Nacimiento</label></td>
					<td><form:input class="input-small datepicker" path="fechaNacimiento"/></td>
					<td><label>Curso</label></td>
					<td><form:input class="input-small" path="curso"/></td>
					
				</tr>
				<tr>
					<td><label>Sexo</label></td>
					<td>
                                        <form:select path="sexo" >                                
                                        <form:option  value="0" label="seleccionar=>"></form:option>
                                        <form:option label="Masculino" value="M"></form:option>
                                        <form:option label="Femenino" value="F"></form:option>
                                        </form:select>
                                        </td>    
					<td><label>Direccion</label></td>
					<td><form:input class="input-large" path="direccion"/></td>
				</tr>
				<tr>
					<td><label>Fono</label></td>				
                                        <td><form:input class="input-large" path="fono"/></td>
					<td><label>Nivel</label></td>
                                        <td><form:input class="input-large" path="nivel"/></td>
					
				</tr>					
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<div class="btn-toolbar">
			<div class="pull-right">
				<button class="btn">Limpiar</button>
                                <button name='boton' type='submit' data-dismiss="modal"  class="btn btn-primary">Guardar</button>				
                                <button class="btn" data-dismiss="modal" >Cerrar</button>
			</div>
		</div>
	</div>
    </form:form>                                        
</div>
   
</div>

        <div class="container" id="content">

            <h3>
                <c:out value="${titulo}" />
            </h3>

                <div class="tableWrap">
                <form:form commandName="apoderado" action="crearApoderado.do" method="post">
                    
                    <table  class="table table-filter">



                        <tr>
                            <td>Rut Apoderado</td>
                            <c:choose>
                            <c:when test="${not empty apoderado.rutApoderado}">
                                <td colspan="3" ><form:input path="rutApoderado" disabled="true" /></td>                            
                            </c:when>
                            <c:otherwise>
                            <td colspan="3" ><form:input path="rutApoderado" /></td>    
                            </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>

                            <td>Primer Nombre</td>
                            <td colspan="1"><form:input path="primerNombre" /></td>
                            <td>Segundo Nombre</td>
                            <td colspan="1"><form:input path="segundoNombre" /></td>
                        </tr>
<tr>

                            <td>Apellido Paterno</td>
                            <td colspan="1"><form:input path="apellidoPaterno" /></td>
                            <td>Apellido Materno</td>
                            <td colspan="1"><form:input path="apellidoMaterno" /></td>
                        </tr>
                        <tr>
                            <td>Fecha de Nacimiento</td>
                            <td ><form:input class="input-small datepicker" path="fechaNacimiento" id="fechaNacimientoAp" /></td>

                            <td>Mail</td>
                            <td ><form:input path="mail" /></td>                                								

                        </tr>
                        <tr>
                            <td>Telefono</td>
                            <td colspan="1"><form:input path="telefono" /></td>
                            <td>Tipo Usuario</td>
                            <td colspan="1"><form:input path="tipoUsuario" /></td>

                        
                        </tr>	
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>                            
                            <td>

                                <button name='boton' type='submit'  class="btn btn-primary">${titulo}</button>

                            </td>
                        </tr>
                    </table>
                    <form:errors path="rutApoderado"  cssClass="alert validation alert-error" element="div"/>   
                    <form:errors path="primerNombre"  cssClass="alert validation alert-error" element="div"/>  
                    <form:errors path="segundoNombre"  cssClass="alert validation alert-error" element="div"/>  
                    <form:errors path="apellidoPaterno"  cssClass="alert validation alert-error" element="div"/>  
                    <form:errors path="apellidoMaterno"  cssClass="alert validation alert-error" element="div"/>  
                    <form:errors path="fechaNacimiento"  cssClass="alert validation alert-error" element="div"/>  
                    <form:errors path="mail"  cssClass="alert validation alert-error" element="div"/>  
                    <form:errors path="telefono"  cssClass="alert validation alert-error" element="div"/>  
                </form:form>
            </div>        
        

            
            






            

                <div class="btn-toolbar-header"> 		
		<h2 style="float:left">Alumos asignados al Apoderado</h2>	
		<div class="btn-group pull-right">
			<button class="btn" title="Agregar" id="btn_agregarAlumno"><i class="icon-plus"></i>Agregar</button>			
		</div>
	</div>
                <div class="tableWrap" >
                    <table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap">



                        <tr>	
                            <th></th>                	
                            <th>Apoderado</th>                                
                            <th>Editar</th>
                        </tr>
                        <c:forEach items="${apoderado.alumnos}" var="alumno">
                            <tr>

                                <td>
                                    <div>
                                        <img width="50" height="50" src="<%= request.getContextPath()%>/resources/img/perfil.jpg"/>
                                    </div>    
                                    <div>
                                        <c:out value="${alumno.rutAlumno}" />
                                    </div>
                                </td>

                                <td>
                                    <div>
                                        <c:out value="${alumno.primerNombre} ${alumno.segundoNombre} ${alumno.apellidoPaterno} ${alumno.apellidoMaterno}" />
                                    </div>
                                    <div>
                                        <c:out value=" Fecha de Nac. ${apoderado.fechaNacimiento} - ${alumno.fono}" />
                                    </div>
                                </td>
                                <td><button type="button"  class="btn" id="btn_editarApoderado" name="${apoderado.rutApoderado}"><i class=""></i>Editar</button>
                                </td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
                
</div>            
            <script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
            <script type="text/javascript" src="../resources/js/bootstrap.js"></script>
            <script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
            <script>
                $(document).ready(function(){
                $('#btn_agregarAlumno').click(function(){
                    
                    $('#nuevoAlumnoDiv').css('display','block');
                });
                $(function() {
                    
                    $("#fechaNacimientoAp").datepicker({ dateFormat: "dd/mm/yy" });
                                            $("#fechaNacimiento").datepicker({ dateFormat: "dd/mm/yy" });
                    
                });
    });
            </script>
        </body>
    </html>
    
    			