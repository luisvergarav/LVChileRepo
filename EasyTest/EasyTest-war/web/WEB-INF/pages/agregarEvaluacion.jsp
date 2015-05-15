<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="model.entities.Plantilla"%>
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    Evaluacion evaluacion = (Evaluacion) request.getAttribute("evaluacion");

    List<Plantilla> plantillas = (List<Plantilla>) request.getAttribute("listaPlantillas");

%>

<t:template>
    <jsp:attribute name="header">
        <style>
            #body{
                background: #999999;
            }
        </style>


    </jsp:attribute>
    <jsp:attribute name="footer">

    </jsp:attribute>
    <jsp:body>
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default" >
                <div class="panel-heading">Crear Evaluacion</div>

                <div class="panel-body">
                    <form action="EvaluacionServlet?action=guardar" method="POST">

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="idEncuestador">IdEncuestador</label>
                            <div class="col-md-6">
                                <input type="text" name="idEncuestador"  class="form-control" value="${evaluacion.getEncuestador().getIdencuestador()}" required="required" title=""/>
                            </div>
                        </div>	

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="cabecera">Cabecera</label>
                            <div class="col-md-6">
                                <input type="text" name="cabecera"  class="form-control" value="${evaluacion.getCabecera()}" required="required" title=""/>
                            </div>
                        </div>	

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="cabecera">Pie de Pagina</label>
                            <div class="col-md-6">
                                <input type="text" name="piePagina"  class="form-control" value="${evaluacion.getPiepagina()}" required="required" title=""/>
                            </div>
                        </div>	


                        <div class="form-group">
                            <label class="col-md-4 control-label" for="item">Item</label>
                            <div class="col-md-6">
                                <input type="text" name="item"  class="form-control" value="${evaluacion.getItem()}" required="required" title=""/>
                            </div>
                        </div>	


                        <div class="form-group">
                            <label class="col-md-4 control-label" for="mensajeconfirmacion">Mensaje Confirmacion</label>
                            <div class="col-md-6">
                                <input type="text" name="mensajeconfirmacion"  class="form-control" value="${evaluacion.getMensajeconfirmacion()}" required="required" title=""/>
                            </div>
                        </div>	




                       
                        <div class="form-group">
                          
                                <label class="col-md-4 control-label" for="mensajeconfirmacion">Seleccione Plantilla</label>                                                    

                                <div class="col-md-6">
                                    <select      name="idPlantilla">
                                        <c:forEach var="plantilla" items="${listaPlantillas}" varStatus="counter">
                                            <option value="${plantilla.getIdplantilla()}">
                                                ${plantilla.getDescripcion()}
                                            </option>
                                        </c:forEach>   

                                    </select>
                                </div>    
                            </div>
                             <div class="form-group">
                            <div class="col-md-4 col-md-offset-5">
                                <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>         
        </div>
    </jsp:body>
</t:template>

