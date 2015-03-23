
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
                            <td ><input  type="text" id="repassword" name="repassword" /></td>                                								

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



                      <a href="<c:url value="/sistema/crearApoderado.do" />" >Agregar(+)</a>



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
                                        <c:out value="${apoderado.primerNombre} ${apoderado.segundoNombre} ${apoderado.apellidoPaterno} ${apoderado.apellidoMaterno}" />
                                    </div>
                                    <div>
                                        <c:out value=" Fecha de Nac. ${apoderado.fechaNacimiento} - ${apoderado.mail} - ${apoderado.telefono}" />
                                    </div>
                                </td>
                                <td><a href="<c:url value="/sistema/editarApoderado.do?rutApoderado=${apoderado.rutApoderado}" />" >Editar</a>
                                </td>
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
                $('#btn_editarApoderado').click(function(){
                    alert('sdfsad');
                    $('#nuevoAlumnoDiv').css('display','block');
                });
                $(function() {
                    
                    $("#fechaNacimiento").datepicker({ dateFormat: "dd/mm/yy" });
                        
                    
                });
    
            </script>
        </body>
    </html>
    
    			