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
    <link href="../../resources/css/normalize.css" rel="stylesheet" />
    <link href="../../resources/css/main.css" rel="stylesheet" />
    <link href="../../resources/css/bootstrap.css" rel="stylesheet" />
    <link href="../../resources/css/jquery-ui.css" rel="stylesheet" />
    <link href="../../resources/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="../../resources/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../../resources/js/main.js"></script>

<title>${titulo}</title>
</head>
<body>
        
<div id="detalleChequeDiv" class="modal hide">
    <a class="close" data-dismiss="modal">×</a>  
    <div class="tableWrap">    
        
	<div class="modal-header">
		<h2>Detalle Cheques</h2>
	</div>
	<div class="modal-body">
 
                    
                
	    <table id="mantenedor" class="table table-condensed table-filter table">
	    	
			<tbody>
                            <c:forEach items="${listaPendientesCheques}" var="pen">
                                <c:if test="${pen.pago.idPago == idBusqueda}">
                                    <c:forEach items="${pen.pago.cheques}" var="chk">
                                        <div>
                                            <c:out value="${chk.banco} - Titular ${chk.titular}- monto ${chk.monto} - Serie ${chk.serie} - Fecha ${chk.fechaPago}" />
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>                                        
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<div class="btn-toolbar">
			<div class="pull-right">
			
                                
                                <button class="btn" id="btn_cerrarDetalle" data-dismiss="modal" >Cerrar</button>
			</div>
		</div>
	</div>
                                       
</div>
   
</div>         
        
<div class="container" id="content">
       
     
    <h3>
		<c:out value="${titulo}" />
	</h3>

	<div class="tableWrap">
	
	<table class="table table-filter tableWrap">
	<tbody>
	
	
	
	<tr>
            <td> <label>Institucion : </label></td>
            <td> <label>${semestre.institucion.rutInstitucion}  - ${semestre.institucion.nombre}</label></td>	
            
            <td> <label>Periodo : ${semestre.periodo}/${semestre.anoPeriodo}</label></td>
          
            
        </tr>
       
	</tbody>
	</table>
	
	</div>
            
      
        
           <div class="tableWrap" >
               
        <h3>
		<c:out value="Inscripciones pendientes por Cheque" />
	</h3>
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap">
	
         
                <!--Falta Agregar campo codigo inscripcion-->
		<tr>

		<th>Alumno</th>
		<th>Inscripcion</th>                			
                <th>Valor</th>      
                <th>Estado</th>  
                <th></th>  
                <th></th>          
                </tr>
		<c:forEach items="${listaPendientesCheques}" var="pagadas">
			<tr>
                            <td>
                                <div>
                                    <img width="50" height="50" src="<%= request.getContextPath() %>/resources/img/perfil.jpg"/>
                                   
                                        <c:out value="${pagadas.alumno.primerNombre} ${pagadas.alumno.apellidoPaterno} ${pagadas.alumno.apellidoMaterno}" />
                          
                   
                                      </div>
                                    <div>
                                        <c:out value="${pagadas.alumno.rutAlumno}" />
                                    </div>
                                  
                                
                            </td>
			
                            
                            
                                
                            
			<td>
                            <div>
                            <c:out value="${pagadas.taller.claseTaller} - ${pagadas.taller.tipoTaller.nombre} - ${pagadas.taller.nombreTaller} /  Periodo ${pagadas.semestre.periodo}/${pagadas.semestre.anoPeriodo}" />
                            </div>
                            <div>
                                <c:out value="Fecha Inscripcion ${pagadas.inscripcionFechaInscripcion} " />
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
                          
                        </c:when>
                        
                        </c:choose>
           
                          <td><a onclick="return confirm('Esta seguro que desea activar el pago?')" 
				href="<c:url value="/inscripciones/activar/activarPago.do?idPago=${pagadas.pago.idPago}" />" >Activar</a></td>
                          
                                <td><a onclick="return confirm('Esta seguro que desea rechazar el pago?')" 
				href="<c:url value="/inscripciones/activar/rechazarPago.do?idPago=${pagadas.pago.idPago}" />" >Rechazar</a></td>
                          
                                 <td>
                                     
                            
                        </td>
                                                
                                         
			</tr>
                                         
                        <tr>
                            <td colspan="7">
                            <div>
                               
                                
                                    <c:forEach items="${pagadas.pago.cheques}" var="chk">
                                        <div>
                                            <c:out value="Banco : ${chk.banco} - Titular :  ${chk.titular}- Monto ${chk.monto} - Serie: ${chk.serie} - Fecha ${chk.fechaPago}" />
                                        </div>
                                    </c:forEach>
                                
                            

                            </div>
                             </td>   
                        </tr>    
		</c:forEach>
		
		</table>
            </div>
</div>
<script type="text/javascript" src="../../resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="../../resources/js/bootstrap.js"></script>
<script type="text/javascript" src="../../resources/js/jquery.tablesorter.js"></script> 
<script>
function setId(id){
  alert(id);
  $("#idBusqueda").val(id);
  $("#detalleChequeDiv").css("display","block");
  
}

$(document).ready(function() {
   $("#btn_cerrarDetalle").click(function(){

    $("#detalleChequeDiv").fadeOut(400);
});
});


</script>
</body>

</html>
