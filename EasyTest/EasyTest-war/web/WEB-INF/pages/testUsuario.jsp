<%@page import="model.Entities.Alternativas"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Set"%>
<%@page import="model.Entities.Pregunta"%>
<%@page import="model.Entities.Encuestador"%>
<%@page import="model.Entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

Evaluacion evaluacion = (Evaluacion) request.getAttribute("evaluacion");


%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Education Zone</title>
<link href="resources/css/style_Carlos.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="topPan">
    <p><h1>Easy Test</h1></p>
  <div id="topMenuPan">
    <div id="topMenuLeftPan"></div>
    <div id="topMenuMiddlePan">
      <ul>
        <li class="home">Home</li>
        <li><a href="<%=request.getContextPath()%>/EncuestadorServlet?action=agregar">Crear Encuestador</a></li>
        <li><a href="<%=request.getContextPath()%>/EvaluacionServlet?action=agregar">Crear Test</a></li>
        <li class="contact"><a href="#" class="contact">Contacto</a></li>
      </ul>
    </div>
    <div id="topMenuRightPan">
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </div>
  </div>
</div>
<div id="bodyPan">
  
          <h1>Test</h1>
          <h3><%=evaluacion.getCabecera()%></h3>
     
        <form action="TestServlet?action=guardarTest" method="POST">
            <table>
                <tr>
                    <td>Id Evaluacion</td>
                    <td>
                        <input type="text" name="idEvaluacion" value="<%=evaluacion.getId()%>" />
                    </td>
                    <td></td>
            </tr>
            <tr>
                <label>Responda</label>
            </tr>   
                <%for(Pregunta pregunta:(Set<Pregunta>)evaluacion.getEvapreguntases()){%>                
            <tr>
                <td><%=pregunta.getTextopregunta()%></td>
                <td></td>                
            </tr>
                <%int contador = 1;%>
            <%for(Alternativas alternativa:(Set<Alternativas>)pregunta.getAlternativases()){%>                
                
            <tr>
                
                <td>
                    <c:if test="<%=pregunta.getTipopregunta().equals("unica") %>">
                    <input type="radio" name="pregunta-<%=pregunta.getId()%>" value="<%=alternativa.getIdalternativa()%>" />
                    </c:if>
                    <c:if test="<%=pregunta.getTipopregunta().equals("multiple") %>">
                        <input type="checkbox" name="pregunta-<%=pregunta.getId()%>-<%=alternativa.getIdalternativa()%>" value="<%=alternativa.getTextoAlternativa()%>" />
                    </c:if>
                </td>
                <td><%=alternativa.getTextoAlternativa()%></td>
            </tr>
            <%}%>    
            
            <%}%>
            <tr>
                <td></td>
                
                <td>
            <input type="submit" value="Guardar" name="guardar" />
                </td>
            </tr>
            
            </table>
        </form>
                
                

  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
<div id="footermainPan">
  <div id="footerPan">
    
    <p class="copyright">©AbcBytes All right reserved.</p>
    <ul class="templateworld">
      <li>design by:</li> 
      ABC Bytes
      <li> </li>
    </ul>
    <div id="footerPanhtml"><a href="http://validator.w3.org/check?uri=referer" target="_blank">HTML</a></div>
    <div id="footerPancss"><a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank">css</a></div>
  </div>
</div>
</body>
</html>
