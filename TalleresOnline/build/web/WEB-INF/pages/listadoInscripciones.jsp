<%@page import="models.VO.CartBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <style>
            .imgCarro{
                width: 30px !important ;
                height: 30px !important;
            }
        </style>
    </head>
    <body>



        <div class="container" id="content">
            <div>
                <h3><c:out value="Carro de Compras (${cart.listaTalleres.size()}) Taller" />

                    <a href="<c:url value="/inscripciones/verBolsa.do" />" ><img class="imgCarro" src="<%= request.getContextPath()%>/resources/img/carro.png"/></a></h3>
            </div>

            <h3>
                <c:out value="${titulo}" />
            </h3>

            <p>
                <a onclick="return confirm('�Esta seguro? Si vuelve a seleccionar alumno se perdera lo guardado en Bolsa de compras, se debe pagar talleres por alumno')" href="<c:url value="/inscripciones/seleccionarAlumno.do" />">volver</a>
            </p>
            <div class="tableWrap">

                <table class="table table-filter tableWrap">
                    <tbody>



                        <tr>
                            <td> <label>Nombre Alumno : </label></td>
                            <td> <label>${alumno.primerNombre} ${alumno.apellidoPaterno}</label></td>	
                            <td><a href="<c:url value="/inscripciones/inscribirAlumno.do" />"><button type="submit" class="btn btn-primary" title="Inscribir"  id="btn_inscribir">Inscribir</button></a></td>

                            <td> <label>Curso : ${alumno.curso}${alumno.nivel}</label></td>


                        </tr>

                    </tbody>
                </table>

            </div>
            


            


            <div class="tableWrap" >
                <h2>
                <c:out value="Resumen de Talleres inscritos del Alumno" />
            </h2>
                <h3>
                <c:out value="Inscripciones Talleres Curriculares" />
            </h3>
                <table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap table-striped">


                    <!--Falta Agregar campo codigo inscripcion-->
                    <tr>
                        <th></th>
                        <th>Inscripcion</th>                			
                        <th>Valor</th>      
                        <th></th>  
                        <th></th>  

                    </tr>
                    <c:if test="${listadoGratis.size() <= 0}">
                        <tr><td colspan="5">0 Inscripciones</td></tr>
                    </c:if>
                    <c:forEach items="${listadoGratis}" var="gratis">
                        <tr>

                            <td>
                                <div
                                    <c:choose>
                                        <c:when test="${gratis.taller.tipoTaller.nombre == 'HOCKEY'}">class="deportes_sprite2 hockey"
                                        </c:when>                                     
                                        <c:when test="${gratis.taller.tipoTaller.nombre == 'TENIS'}">class="deportes_sprite2 tenis"
                                        </c:when> 
                                        <c:otherwise>

                                        </c:otherwise>
                                    </c:choose>
                                    >

                                </div>
                                <div>
                                    <c:out value="${gratis.taller.nombreTaller}" />
                                </div>    
                            </td>			                            


                            <td>
                                <div>
                                    <c:out value="${gratis.taller.claseTaller} - ${gratis.taller.tipoTaller.nombre}" />
                                </div>
                                <div>
                                    <c:out value="Fecha Inscripcion ${gratis.inscripcionFechaInscripcion} - Periodo ${gratis.semestre.periodo}/${gratis.semestre.anoPeriodo}" />        
                                </div>
                            </td>			                                                                                                						                                                

                            <td><c:out value="Gratis" /></td>


                            <td><a onclick="return confirm('esta seguro?')" 
                                   href="<c:url value="/inscripciones/eliminarInscripcion.do?idInscripcion=${gratis.taller.idTaller}" />" >eliminar</a></td>
                            <td><a onclick="return confirm('esta seguro?')" 
                                   href="<c:url value="/inscripciones/agregarSeccionInscripcion.do?idTaller=${gratis.taller.idTaller}" />" >Secciones</a></td>
                        </tr>
                    </c:forEach>

                </table>
            </div>

            <div class="tableWrap" >

                <h3>
                    <c:out value="Inscripciones Talleres Complementarios" />
                </h3>
                <table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap table-striped">


                    <!--Falta Agregar campo codigo inscripcion-->
                    <tr>

                        <th></th>
                        <th>Inscripcion</th>                			
                        <th>Valor</th>      
                        <th>Estado</th>  
                        <th></th>  
                        <th></th>                  
                    </tr>
                    <c:if test="${listadoPagadas.size() <= 0}">
                        <tr><td colspan="6">0 Inscripciones</td></tr>
                    </c:if>
                    <c:forEach items="${listadoPagadas}" var="pagadas">
                        <tr>
                            <td>
                                <div
                                    <c:choose>
                                        <c:when test="${pagadas.taller.tipoTaller.nombre == 'HOCKEY'}">class="deportes_sprite2 hockey"
                                        </c:when>                                     
                                        <c:when test="${pagadas.taller.tipoTaller.nombre == 'TENIS'}">class="deportes_sprite2 tenis"
                                        </c:when> 
                                        <c:otherwise>

                                        </c:otherwise>
                                    </c:choose>
                                    >
                                </div>
                                <div>
                                    <c:out value="${pagadas.taller.nombreTaller}" />
                                </div>
                            </td>			                            


                            <td>
                                <div>
                                    <c:out value="${pagadas.taller.claseTaller} - ${pagadas.taller.tipoTaller.nombre}" />
                                </div>
                                <div>
                                <c:out value="Fecha Inscripcion ${pagadas.inscripcionFechaInscripcion} - Periodo ${pagadas.semestre.periodo}/${pagadas.semestre.anoPeriodo}" /></td>
                            </div>
                            </td>			                        



                            <td><c:out value="$${fn:replace(pagadas.taller.monto,'.00','')}" /></td>


                            <c:choose>
                                <c:when test="${pagadas.estado == '1'}" >
                                    <td>Pagada</td>
                                    <td><a onclick="return confirm('esta seguro?')" 
                                           href="<c:url value="/inscripciones/agregarSeccionInscripcion.do?rutAlumno=${alumno.rutAlumno}&idTaller=${pagadas.taller.idTaller}" />" >Secciones</a></td>
                                    </c:when>
                                    <c:when test="${pagadas.estado == '2'}" >
                                    <td>Pendiente Cheque</td>
                                    <td></td>
                                </c:when>
                                <c:when test="${pagadas.estado == '3'}" >
                                    <td>Rechazado Cheque</td>
                                    <td></td>
                                </c:when>
                            </c:choose>

                            <td></td>

                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
        <script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
        <script type="text/javascript" src="../resources/js/bootstrap.js"></script>
        <script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
    </body>

</html>
