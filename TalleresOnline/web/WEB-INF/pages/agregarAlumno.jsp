<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="TopTemplate.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    </head>
    <body>


        <div class="container" id="content">

            <h3>
                <c:out value="${titulo}" />
            </h3>


            <div class="tableWrap">
                <form:form commandName="usuario" action="crearUsuario.do" method="post">
                    <form:hidden path="userId" />
                    <table  class="table table-filter">



                        <tr>
                            <td>Nombre Usuario</td>
                            <td><form:input path="username" /></td>



                            <td>Habilitar?</td>
                            <td colspan="1"><form:input path="enabled" /></td>

                        </tr>

                        <tr>
                            <td>Password</td>
                            <td ><form:input path="password" /></td>

                            <td>Password</td>
                            <td ><input  type="text" id="repassword" name="repassword" ></td>                                								

                        </tr>

                        <tr>
                            <td>Roles Asignados</td>
                            <td colspan="3">

                                <form:checkboxes items="${listaRolesDisponibles}"
                                                 path="roles"/>
                            </td>          
                        </tr>	
                        <tr>
                            <td>Habilitado?</td>
                            <td></td>
                            <td></td>
                            <td>

                                <button name='boton' type='submit'  class="btn btn-primary">${titulo}</button>

                            </td>
                        </tr>
                    </table>
                    <form:errors path="username"  cssClass="alert validation alert-error" element="div"/>   
                    <form:errors path="password"  cssClass="alert validation alert-error" element="div"/>  


                </form:form>
            </div>        
            
            
                <c:if test="${usuario.userId > 0}">        
                <div class="tableWrap">        
                <div class="tableWrap">    
                    <h3>
                        <c:out value="Datos Apoderado" />
                    </h3>

                    <form:form commandName="apoderado" action="crearApoderado.do" method="post">

                    <table id="tablaDias" class="table table-filter tableWrap " style="width: 50%">



                        <tbody>
                    



                                <tr>
                                    <th>Rut</th><td><form:input path="rutApoderado"  /></td>
                                </tr>
                                <tr>
                                    <th>Nombre:</th><td> <form:input path="primerNombre" /></td>
                                </tr>
                                <tr>
                                    <th> Segundo Nombre:</th><td> <form:input path="segundoNombre"/></td>
                                </tr>
                                <tr>
                                    <th>Apellido Paterno:</th><td> <form:input path="apellidoPaterno" /></td>
                                </tr>
                                <tr>
                                    <th>Apellido Materno:</th><td> <form:input path="apellidoMaterno" /></td>
                                </tr>

                                <tr>
                                    <th>Fecha de Nacimiento</th><td> <form:input path="fechaNacimiento" /></td>
                                </tr>
                                <tr>


                                    <th> Mail:</th><td> <form:input path="mail"/></td>
                                </tr>
                                <tr>
                                    <th>Telefono</th><td> <form:input path="telefono" /></td>
                                </tr>
                                <tr>
                                    <th>Tipo Usuario</th><td> <form:input path="tipoUsuario" /></td>
                                </tr>

                            </tbody>    
                            <tfoot>    
                                <tr>
                                    <td colspan="2"><button name='boton' type='submit' id="btnAgregarDia" class="btn btn-primary">Agregar</button></td>
                                </tr>
                            </tfoot>    
                        </table>  

                    </form:form>
                </div>







                <h3>
                    <c:out value="Apoderados asignados al Perfil" />
                </h3>


                <div class="tableWrap" >
                    <table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap">



                        <tr>	
                            <th></th>                	
                            <th>Apoderado</th>                                
                            <th>Editar</th>
                        </tr>
                        <c:forEach items="${usuario.apoderados}" var="apoderado">
                            <tr>

                                <td>
                                    <div>
                                        <img width="50" height="50" src="<%= request.getContextPath()%>/resources/img/perfil.jpg"/>
                                    </div>    
                                    <div>
                                        <c:out value="${apoderado.rutApoderado}" />
                                    </div>
                                </td>

                                <td>
                                    <div>
                                        <c:out value="${apoderado.primerNombre} ${alumno.segundoNombre} ${alumno.apellidoPaterno} ${alumno.apellidoMaterno}" />
                                    </div>
                                    <div>
                                        <c:out value=" Fecha de Nac. ${apoderado.fechaNacimiento} - ${apoderado.mail} - ${apoderado.telefono}" />
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
                </div>
                </c:if>
            </div>
            <script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
            <script type="text/javascript" src="../resources/js/bootstrap.js"></script>
            <script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
            <script>
    
                $(function() {
                    
                    $("#fechaNacimiento").datepicker({ dateFormat: "dd/mm/yy" });
                        
                    
                });
    
            </script>
        </body>
    </html>