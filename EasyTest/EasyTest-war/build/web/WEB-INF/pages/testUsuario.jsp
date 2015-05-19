<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="header">

        <h1>Welcome</h1>

    </jsp:attribute>
    <jsp:attribute name="footer">

    </jsp:attribute>
    <jsp:body>
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default" >
                <div class="panel-heading">Test</div>

                <div class="panel-body">
                    <h3>${evaluacion.getCabecera()}</h3>

                    <form action="TestServlet?action=guardarTest" method="POST">

                        <label class="col-md-4 control-label" for="idEvaluacion">Id Evaluacion</label>

                        <input type="text" name="idEvaluacion"  class="form-control" value="${evaluacion.getId()}" required="required" title=""/>



                        <label>Responda</label>

                        
                        <c:forEach var="pregunta" items="${evaluacion.getEvapreguntases()}" varStatus="contador">                
                        <div class="panel panel-default">    
                            <div class="panel-heading">Pregunta numero ${contador.index }</div>
                            
                            <div class="panel-body">

                                
${pregunta.getTextopregunta()}
                                          <div class="form-group">
                                        
                                        <div class="col-md-6">
                                        
                                <c:forEach var="alternativa" items="${pregunta.getAlternativases()}">                
                                <table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter">

                                        <tr>

                                            <td>

                                            <c:if test="${pregunta.getTipopregunta().equals('unica')}">
                                                <input   type="radio" name="pregunta-${pregunta.getId()}" value="${alternativa.getIdalternativa()}" />
                                            </c:if>
                                            <c:if test="${pregunta.getTipopregunta().equals('multiple')}">
                                                <input type="checkbox" name="pregunta-${pregunta.getId()}-${alternativa.getIdalternativa()}" value="${alternativa.getTextoalternativa()}" />
                                            </c:if>
                                            ${alternativa.getTextoalternativa()}
                                            </td>
                                        </tr>
                                </table>        
                                </c:forEach>    
                                                                        </div>
                                    </div>
                            </div>
                        </div>
                        </c:forEach>
                        <input type="submit" value="Guardar" name="guardar" class="btn btn-primary"/>
                        
        </form>
    </div>
</div>                                



</jsp:body>
</t:template>