<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.Set"%>
<%@page import="model.entities.Encuestador"%>
<%@page import="model.entities.Evaluacion"%>
<%@page import="java.util.List"%>
<%

List<Evaluacion> listaEvaluaciones = (List<Evaluacion>) request.getAttribute("listaEvaluaciones");
//Encuestador encuestador = (Encuestador) request.getAttribute("encuestador");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
  
  <h1>
		Lista de evaluaciones
	</h1>



	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter">
	
		<tr>
		<th>Id</th>
		<th>Encabezado</th>
		<th>Pie de Pagina</th>		
		<th>Eliminar</th>
		</tr>
		
		<% for (Evaluacion evaluacion:listaEvaluaciones){%>
			<tr>
			<td>
			<%=evaluacion.getId()%>
			</td>
			<td>
			<%=evaluacion.getCabecera()%>
			</td>
			
			<td>
			<%=evaluacion.getPiepagina()%>
			</td>
			
			
			<td>
			
			 <a href="<%=request.getContextPath()%>/EvaluacionServlet?action=editar&idEvaluacion=<%=evaluacion.getId()%>">Editar</a>
			</td>
				<td>
			
			 <a onclick="return confirm('¿Seguro que desea eliminar?')" href="<%=request.getContextPath()%>/EvaluacionServlet?action=eliminar&idEvaluacion=<%=evaluacion.getId()%>">Eliminar</a>
			</td>
			</tr>
		<%}%>
		
		</table>
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
