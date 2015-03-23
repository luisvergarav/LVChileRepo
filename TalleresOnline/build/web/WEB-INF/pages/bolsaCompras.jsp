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
<style type="text/css">
	</style>

</head>
<body>

 <div class="container" id="content">
     <h3><c:out value="Carro de Compras (${cart.listaTalleres.size()}) Taller" />
   
  
	<h3>
		<c:out value="${titulo}" />
	</h3>

	<p>
		<a href="<c:url value="/inscripciones/listadoInscripciones.do" />">volver</a>
	</p>
        
        	<div class="tableWrap">
	
	<table class="table table-filter tableWrap">
	<tbody>
	
	
	
	<tr>
            <td> <label>Nombre Alumno : </label></td>
            <td> <label>${alumno.primerNombre} ${alumno.apellidoPaterno}</label></td>	
            
            <td> <label>Curso : ${alumno.curso}${alumno.nivel}</label></td>
          
            
        </tr>
       
	</tbody>
	</table>
	
	</div>
        
       <h3>
		<c:out value="Bolsa de Compras " />
	</h3>

        
        <div class="tableWrap" >
         <div class="tableWrap" >
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-condensed table-striped table-marginless">
	
		<tr>
		<th>Institucion</th>	
		<th>Nombre Taller</th>           
                <th>Monto</th>
                  <th>Periodo</th>
                  <th>Eliminar</th>
                
                </tr>
		<c:forEach items="${cart.listaTalleres}" var="taller">
			<tr>
			
			<td><c:out value="${taller.institucion.nombre}" /></td>
			
			<td><c:out value="${taller.nombreTaller}" /></td>
                        
                        <td><c:out value="$${fn:replace(taller.monto,'.00','')}" /></td>                  
                                                
                        
                        <td><c:out value="${taller.semestre.periodo}/${taller.semestre.anoPeriodo}" /></td>
                        
                        <td><a onclick="return confirm('esta seguro?')" 
				href="<c:url value="/inscripciones/eliminarTallerBolsa.do?idTaller=${taller.idTaller}&rutAlumno=${alumno.rutAlumno}" />" >Eliminar</a></td>

			           
			</tr>
		</c:forEach>
		
		</table>
            
                </div>
         <div class="tableWrap">
       		
                <table class="table table-filter">
            <caption>Forma de Pago</caption>
            	<tbody>
                    <tr>
                        <td><label>WebPay</label></td>
                        <td colspan="3"><input id="formaPago1" checked="true" name="formaPago" type="radio"  value="webpay" class="input-small"/></td>
                    </tr>
                    <tr>
			<td><label>Cheque</label></td>
                        <td><input id="formaPago2" type="radio" name="formaPago"  value="cheque" class="input-small"/></td>
                        <td><input type="text"  id="rut" value="096.549.050-7" class="input-small"/></td>
                        <td><input type="text" id= "nombreEmpresa"  value="Colegio Sta. Cruz Chicureo" class="input-large" disabled="disabled"/></td>
						
                    </tr>
                </tbody>
            </table>
      	</div>
             <!--div modal_body--> 
                
                
            <div class="contentBtnPagar">
                <c:if test="${cart.totalBolsacompras > 0}">
                <a class="btnPagar" href="#" >Total Pagar $${cart.totalBolsacompras}</a></h3>
                </c:if>
                <c:if test="${cart.totalBolsacompras <= 0}">
                    <p>Bolsa de compras esta Vacia</p>
                </c:if>    
            </div>
            </div> 
        
 </div>
<script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
<script>
    var contextPath='<%=request.getContextPath()%>';
    $('.contentBtnPagar').click(function (){

	if ($("#formaPago2").is(':checked')){
	$(location).attr('href',contextPath + '/inscripciones/pagoCheque.do');
        }
        if ($("#formaPago1").is(':checked') ){
	$(location).attr('href',contextPath + '/inscripciones/pagarTaller.do?rutAlumno=${alumno.rutAlumno}');
        }
        });
</script>
</body>
  
</html>
