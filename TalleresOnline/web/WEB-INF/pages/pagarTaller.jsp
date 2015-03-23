<%-- 
    Document   : pagarTaller
    Created on : 19-07-2014, 02:43:34 AM
    Author     : Luis
--%>
<%@page import="models.VO.CartBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     
<head>
 <link href="/TalleresOnline/resources/css/normalize.css" rel="stylesheet" />
    <link href="/TalleresOnline/resources/css/main.css" rel="stylesheet" />
    <link href="/TalleresOnline/resources/css/bootstrap.css" rel="stylesheet" />
    <link href="/TalleresOnline/resources/css/jquery-ui.css" rel="stylesheet" />
    <link href="/TalleresOnline/resources/css/style.css" rel="stylesheet" />
<style>
        img {
  /* Responsive images (ensure images don't scale beyond their parents) */

  /* Part 1: Set a maxium relative to the parent */
  max-width: 100%;
width: 100%;
  /* IE7-8 need help adjusting responsive images */

}
</style>
</head>
     <body bgcolor="#3069C6" topmargin="10" leftmargin="0" marginwidth="0" marginheight="0"> 

<div class="container">
<div class="tableWrap" style="padding:10px">
<TABLE  style="padding:10px">
<TR>
<TD  width="30%" valign="top"><h3>Colegio Santa Cruz de Chicureo</H3>
<h3>Talleres Complementarios 2014</H3>
</TD>
<TD  width="30%"></TD>  
<TD  width="30%"><IMG   src="/TalleresOnline/resources/img/Webpay_VertTarj_VA_Transb chica.jpg"/></TD>
</TR>
</TABLE> 
<div class="tableWrap" >
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-condensed table-striped table-marginless">
	
          
         
		<tr>	
		<th>Nombre</th>                
		<th>Tipo</th>
                <th>Inicio</th>
                <th>Termino</th>                
		<th>Periodo</th>
                <th>Clase</th>
                <th>Monto</th>                


                    
         
                </tr>
		<c:forEach items="${cart.listaTalleres}" var="taller">
			<tr>
			
			
			
			<td><c:out value="${taller.nombreTaller}" /></td>
                        <td><c:out value="${taller.tipoTaller.nombre}" /></td>
                        <td><c:out value="${taller.inicioTaller}" /></td>
                        <td><c:out value="${taller.terminoTaller}" /></td>
                        <td><c:out value="${taller.semestre.periodo}/${taller.semestre.anoPeriodo}" /></td>
                        <td><c:out value="${taller.claseTaller}" /></td>
                        <td><c:out value="$${fn:replace(taller.monto,'.00','')}" /></td>
              
			           
			</tr>
		</c:forEach>
                        <tr>
                        <td colspan="5"></td>
                        <td>Monto Total:</td>   
                        <td ><c:out value="$${fn:replace(montoPagar,'.00','')}" /></td>    
                        </tr>    
		</table>
            </div>    
    
<p align="center">
<form method="POST" action="http://190.96.70.134:8080/cgi-bin/tbk_bp_pago.cgi">

<INPUT TYPE="hidden"         NAME="TBK_TIPO_TRANSACCION"    value="TR_MALL">

<INPUT TYPE="hidden"      NAME="TBK_MONTO"               value="${fn:replace(montoPagar,'.','')}"/>     


<INPUT TYPE="hidden"              NAME="TBK_ORDEN_COMPRA"        VALUE="${ordenCompra}"> 

<INPUT TYPE="hidden"           NAME="TBK_ID_SESION"           VALUE="000000"/>  

<INPUT TYPE="hidden"              NAME="TBK_NUM_TRX"             value="1"/> 
<h3>Orden Compra</h3>

<INPUT TYPE="hidden"     NAME="TBK_CODIGO_TIENDA_M001"  value="597026008905"/>

<INPUT TYPE="hidden" NAME="TBK_ORDEN_TIENDA_M001"   VALUE="${ordenCompra}"/> 

<INPUT TYPE="hidden"            NAME="TBK_MONTO_TIENDA_M001"   value="${fn:replace(montoPagar,'.','')}"/>     

<table border=0 class="tableWrap table-filter">

<tr>
<td align="center">Monto:</td>
<td><c:out value="$${fn:replace(montoPagar,'.00','')}"/>  </td>
<td align="center">Numero de Orden</td>
<td> 
<c:out value="${ordenCompra}"/> 
</td>
</tr>

<tr>
<td align="center"></td>
<td> <INPUT TYPE="hidden" NAME="TBK_URL_RESULTADO"  SIZE=40   value="http://190.96.70.134/TalleresOnline/exito.php" 	   SIZE=50/></td>
<td align="center"></td> 
<td><INPUT TYPE="hidden"        NAME="TBK_URL_FRACASO"    SIZE=40   VALUE="http://190.96.70.134/TalleresOnline/fracaso.php"    SIZE=50/></td>
</tr>
</table>

<table border=0>
<tr><td align="center">
        <c:if test="${montoPagar > 0}">
            <input type="submit" value="Pagar con Tarjeta" SIZE=20/>
        </c:if>
        <% 
            CartBean cartB = (CartBean) session.getAttribute("cart"); 
                cartB.getListaTalleres().clear();
        cartB.setTotalBolsacompras(0);
%> 
</td></tr></table>
</p>
</center>    
</form>
</div>
</div>
</body>

</html>
