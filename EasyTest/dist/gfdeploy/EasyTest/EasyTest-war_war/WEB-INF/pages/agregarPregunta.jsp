<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Set"%>
<%@page import="model.Entities.Pregunta"%>
<%@page import="model.Entities.Encuestador"%>
<%@page import="model.Entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    Pregunta pregunta = (Pregunta) request.getAttribute("pregunta");

    Evaluacion evaluacion = (Evaluacion) request.getAttribute("evaluacion");


%>

<t:template>
    <jsp:attribute name="header">
        <style>
            #body{
                background: #999999;
            }
        </style>
        <h1>Easy Test</h1>

    </jsp:attribute>
    <jsp:attribute name="footer">
       
    </jsp:attribute>
    <jsp:body>

        <div class="modal .bs-example-modal-sm" id="agregarPregunta">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Agregar Pregunta</h4>
                    </div>

                    <form action="EvaluacionServlet?action=guardarPregunta" method="POST">
                        <div class="modal-body">

                            <table>
                                <tr>
                                    <td>Id Evaluacion</td>
                                    <td>
                                        <input type="text" name="idEvaluacion" value="${evaluacion.getId()}" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Texto Pregunta</td>
                                    <td>
                                        <input type="text" name="textoPregunta" value="${pregunta.getTextopregunta()}" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tipo Pregunta</td>
                                    <td>
                                        <input type="text" name="tipoPregunta" value="${pregunta.getTipopregunta()}" />
                                    </td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="submit" value="Guardar" name="guardar" />
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <div class="panel panel-default" style="width:70%;left:15%;right:15%;padding-bottom: 15%;position: relative">
            <div class="panel-heading">Agregar Pregunta</div>

            <div class="panel-body">
                <p>Para agregar una pregunta a la evaluacion presione Add</p>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#agregarPregunta">Add</button>
            </div>

            <div class="panel panel-default" style="width:70%;left:15%;right:15%;padding-bottom: 1%;position: relative">
                    <div class="panel-heading   ">Titulo Encuesta</div>    
                    <div class="panel-body center-content" >    
                        <p style="position: static;">${evaluacion.getItem()}</p>
                    </div>
             </div>
            
             <div class="panel panel-default" style="width:70%;left:15%;right:15%;padding-bottom: 1%;position: relative">
                    <div class="panel-heading">Cabecera de la Encuesta</div>    
                    <div class="panel-body" >    
                        ${evaluacion.getCabecera()}
                    </div>
             </div>

            <c:forEach var="pregunta1" items="${evaluacion.getEvapreguntases()}">
                <div class="panel panel-default" style="width:70%;left:15%;right:15%;padding-bottom: 1%;position: relative">
                    <div class="panel-heading">Pregunta</div>    
                    <div class="panel-body" >    
                        <table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter">

                            <tr>

                                <td>
                                    ${pregunta1.getId()}
                                </td>
                                <td>
                                    ${pregunta1.getTextopregunta()}
                                </td>   
                                <td>
                                    ${pregunta1.getTipopregunta()}
                                </td>
                                <td>

                                    <a href="<c:out value="${request.getContextPath()}"/>EvaluacionServlet?action=agregarAlternativa&idPregunta=<c:out value="${pregunta1.getId()}"/>">Editar</a>
                                </td>
                                <td>





                            </tr>
                        </table>   
                        <c:forEach var="alternativa" items="${pregunta1.getAlternativases()}" >                
                            <table class="table">       
                        <tr>

                            <td>
                                <c:if test="${pregunta1.getTipopregunta() == 'unica'}" >
                                    <input type="radio" name="pregunta-${pregunta1.getId()}" value="${alternativa.getIdalternativa()}" />
                                </c:if>
                                <c:if test="${pregunta1.getTipopregunta() == 'multiple'}">
                                    <input type="checkbox" name="pregunta-${pregunta1.getId()}-${alternativa.getIdalternativa()}" value="${alternativa.getTextoAlternativa()}" />
                                </c:if>
                            </td>
                            <td>${alternativa.getTextoAlternativa()}</td>
                            <c:if test="${alternativa.getCorrecta() == 'T'}" >
                            <td>*</td>
                            </c:if>
                        </tr>
                            </table>
                        </c:forEach>    
                    </div>        
                </div>
            </c:forEach>


                     <div class="panel panel-default" style="width:70%;left:15%;right:15%;padding-bottom: 1%;position: relative">
                    <div class="panel-heading">Pie de pagina</div>    
                    <div class="panel-body" >    
                        ${evaluacion.getPiepagina()}
                    </div>
             </div>

            <a href="TestServlet?action=agregar&idEvaluacion=<c:out value="${evaluacion.getId()}"/>">Copia este Link</a>

        </div>
    </div>

</jsp:body>
</t:template>

