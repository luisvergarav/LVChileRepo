<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">


<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<style type="text/css">
    #gedinNavbar{
        width: 100%;
    }
    #login{
        float: right !Important;
    }

</style>
<script type="text/javascript">
    $(document).ready(function() {
        function actualiza_migas(linkpress){
            $(".breadcrumb").html("<li><a href='index.html'>Inicio</a> <span class='divider'>/</span></li>");

            linkpress.parents("ul li").each(function(index){ 
                var href = $(this).context.firstElementChild.getAttribute('href');
                var text = $(this).context.firstElementChild.innerText;
					
                //no es linkeable 
                /*if(href == '#')
                                        {
                                                $(".breadcrumb > li:first").after("<li>"+text+"<span class='divider'>/</span></li>");
                                        }
                                        else //es linkeable
                                        {
                                                $(".breadcrumb > li:first").after("<li><a href='"+href+"'>"+text+"</a><span class='divider'>/</span></li>");
                                        }*/
                $(".breadcrumb > li:first").after("<li>"+text+"<span class='divider'>/</span></li>");
            });
        }

        //Menu ajax 
        $('a.menuajax').click(function() { 
            $('.dropdown').removeClass('open');
            var content = $(this).attr('href');
            $('#content').load(content);
            actualiza_migas($(this));
            return true;
        });
    });
</script>
<div id="wrapContent">
    <div class="container" >
        <h1> </h1>
        <div class="navbar">
            <div class="navbar-inner container">
                <ul class="nav" id="gedinNavbar">
                    <li class="dropdown">
                        <c:if test="<%=request.isUserInRole("ROLE_COORDINACION") || request.isUserInRole("ROLE_USER")%>" >
                            <a id="gestor" href="#" class="dropdown-toggle" data-toggle="dropdown">Listados <b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
                                <c:if test="<%=request.isUserInRole("ROLE_USER")%>" >
                                    <li role="presentation"><a class="menuajax" href="/TalleresOnline/inscripciones/informe/informeSeccionesAlumno.do">Alumno</a>
                                        <ul class="dropdown-menu">

                                            <li><a class="menuajax" >Alumnos/Seccion</a></li>




                                        </ul>
                                    </li>
                                </c:if>       
                                <c:if test="<%=request.isUserInRole("ROLE_COORDINACION")%>" >
                                    <li role="presentation" class="dropdown-submenu">
                                        <a href="#">Coordinacion</a>
                                        <ul class="dropdown-menu">

                                            <li><a class="menuajax" href="/TalleresOnline/informes/informeSeccionesAlumno.do">Alumnos/Seccion</a></li>


                                            <li><a class="menuajax" href="/TalleresOnline/informes/informesPorTaller.do">Seccion/Alumno</a></li>                                                                         


                                        </ul>
                                    </li>
                                </c:if>      
                                </ul>
                            </li>
                     
                    </c:if>
                    <c:if test="<%=request.isUserInRole("ROLE_COORDINACION") || request.isUserInRole("ROLE_SUPER")%>" >
                    <li class="dropdown">
                        <a id="movimientos" href="#" class="dropdown-toggle" data-toggle="dropdown">Talleres <b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu">
                            <%--<c:if test="<%=request.isUserInRole('ROLE_COORDINACION')%>" >--%>
                            <c:if test="<%=request.isUserInRole("ROLE_COORDINACION")%>" >
                                <li role="presentation"><a class="menuajax" href="/TalleresOnline/inscripciones/coordinacion/buscarAlumnoCoordinacion.do">Inscribir/Dar de baja Alumno</a></li>
                            </c:if>
                            <%--<c:if test="<%=request.isUserInRole('ROLE_COORDINACION') || request.isUserInRole('ROLE_USER')%>" >   --%>
                            <c:if test="<%=request.isUserInRole("ROLE_COORDINACION")%>" >   
                                <li role="presentation"><a class="menuajax" href="/TalleresOnline/inscripciones/activar/listadoInscripcionesPendientes.do">Inscripciones Pendientes</a></li>
                            </c:if>       
                            <%--<c:if test="<%=request.isUserInRole('ROLE_SUPER')%>">--%>
                            <c:if test="<%=request.isUserInRole("ROLE_SUPER")%>">    
                                <li role="presentation" class="dropdown-submenu">

                                    <a href="#">Mantencion</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="menuajax" href="/TalleresOnline/mantenedor/agregarTaller.do">Agregar Taller</a></li>
                                        <li><a class="menuajax" href="/TalleresOnline/mantenedor/listado.do">Listado</a></li>

                                    </ul>
                                </li>
                            </c:if>

                        </ul>
                    </li>
                    </c:if>
                   
                    <%--<c:if test="<%=request.isUserInRole('ROLE_SUPER')%>">--%>
                    <c:if test="<%=request.isUserInRole("ROLE_SUPER")%>">
                        <li class="dropdown">
                            <a id="saldos" href="#" class="dropdown-toggle" data-toggle="dropdown">Configuracion<b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">

                                <li role="presentation"><a class="menuajax" href="/TalleresOnline/sistema/configuracion.do">Sistema</a></li>
                                                                <li role="presentation"><a class="menuajax" href="/TalleresOnline/sistema/listaUsuarios.do">Usuarios</a></li>

                            </ul>
                        </li>
                    </c:if>
                    <li>
                        <a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
                    </li>
                    <li id="fecha_menu" class="pull-right">

                        <a id="fechaProceso" href="#" class="text-info"><b>${pageContext.request.userPrincipal.name}</b></a>
                    </li>
                    <li id="fecha_menu" class="pull-right">
                        <a id="fechaProceso" href="#" class="text-info"><b><%SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                                    out.print(format.format((new java.util.Date())));%>
                            </b></a>
                    </li>

                </ul>
            </div>
            <ul class="breadcrumb"></ul> 
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
        </div>

    </div>       




</div>  
