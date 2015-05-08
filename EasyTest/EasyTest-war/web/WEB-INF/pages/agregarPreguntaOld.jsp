<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Set"%>
<%@page import="model.Entities.Pregunta"%>
<%@page import="model.Entities.Encuestador"%>
<%@page import="model.Entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%
Pregunta pregunta = (Pregunta)request.getAttribute("pregunta");


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
  
          <h1>Agregar Pregunta</h1>
        <form action="EvaluacionServlet?action=guardarPregunta" method="POST">
            <table>
            <tr>
                <td>Id Evaluacion</td>
                <td>
            <input type="text" name="idEvaluacion" value="<%=evaluacion.getId()%>" />
                </td>
            </tr>
            <tr>
                <td>Texto Pregunta</td>
                <td>
            <input type="text" name="textoPregunta" value="<%=pregunta.getTextopregunta()%>" />
                </td>
            </tr>
            <tr>
                <td>Tipo Pregunta</td>
                <td>
            <input type="text" name="tipoPregunta" value="<%=pregunta.getTipopregunta()%>" />
                </td>
            </tr>
            
            <tr>
                <td></td>
                <td>
            <input type="submit" value="Guardar" name="guardar" />
                </td>
            </tr>
            
        </form>
                
        <table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter">
	
		<tr>
		<th>Id</th>
		<th>Texto Pregunta</th>
		<th>Tipo Pregunta</th>		
		
		</tr>
		
		<% for (Pregunta pregunta1:(Set<Pregunta>)evaluacion.getEvapreguntases()){%>
			<tr>
                            
                            <td>
			<%=pregunta1.getId()%>
			</td>
			<td>
			<%=pregunta1.getTextopregunta()%>
			</td>
			<td>
			<%=pregunta1.getTipopregunta()%>
			</td>
			<td>
			
			 <a href="<%=request.getContextPath()%>/EvaluacionServlet?action=agregarAlternativa&idPregunta=<%=pregunta1.getId()%>">Editar</a>
			</td>
				<td>
			
			
			
			
                        
			</tr>
		<%}%>
		
		</table>   
                <a href="TestServlet?action=agregar&idEvaluacion=<%=evaluacion.getId()%>">Copia este Link</a>
                

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
