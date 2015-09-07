<%@page import="model.Entitys.Pago"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="TopTemplate.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="../resources/css/normalize.css" rel="stylesheet" />
        <link href="../resources/css/main.css" rel="stylesheet" />
        <link href="../resources/css/bootstrap.css" rel="stylesheet" />
        <link href="../resources/css/jquery-ui.css" rel="stylesheet" />
        <link href="../resources/css/style.css" rel="stylesheet" />
        <script type="text/javascript" src="../resources/js/jquery-1.9.1.js"></script>
        <script type="text/javascript" src="../resources/js/main.js"></script>
        <title><c:out value="${titulo}" /></title>



    </head>
    <body>


        <div class="container" id="content">

            <h3>
                <c:out value="${titulo}" />
            </h3>

                        <h2>
                <c:out value="Su inscripción esta pendiente hasta la presentación de sus documentos en tesoreria" />
            </h2>

            
            <p>
                <a href="<c:url value="/inscripciones/verBolsa.do" />">volver</a>
            </p>
            <div class="tableWrap">
                <form:form commandName="pago" action="pagoCheque.do" method="post">
                    <form:hidden path="idPago" />
                    <form:hidden path="formapago.idFormaPago" />
                    <table  class="table table-filter">



                        <tr>

                            <td>Banco</td>
                            <td colspan="1"><form:input path="banco" /></td>

                            <td>Titular</td>
                            <td><form:input path="titular" /></td>


                        </tr>



                        <tr>
                                
                            <td>Monto Total</td>    
                            <td ><form:input path="montoPago" /></td>

                            <td>Fecha</td>
                            <td colspan="1"><form:input path="fechaPago" /></td>

                            
                        </tr>

                        <tr>


                            
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <c:if test="${pago.idPago eq 0}">   
                                <button name='boton' type='submit' id="btnIngresarPago" class="btn btn-primary">Ingresar</button>
                                </c:if>
                                <c:if test="${pago.idPago > 0}">   
                                    <button name='boton' type='submit' id="btnIngresarPago" disabled="true"  class="btn btn-primary">Ingresar</button>
                                </c:if>
                            </td>

                        </tr>

                    </table>
                    <form:errors path="serie"  cssClass="alert validation alert-error" element="div"/>   
                    <form:errors path="montoPago"  cssClass="alert validation alert-error" element="div"/>  
                    <form:errors path="banco"  cssClass="alert validation alert-error" element="div"/> 
                    <form:errors path="titular"  cssClass="alert validation alert-error" element="div"/> 
                    <form:errors path="fechaPago"  cssClass="alert validation alert-error" element="div"/>                                               
                </form:form>
            </div>                
      

            <c:if test="${pago.idPago > 0 and pago.cheques.size() < 4}">
            <h3>
                <c:out value="Ingreso de cheques" />
            </h3>


            <div class="tableWrap"  id ="divCheques">
                <form:form commandName="cheque" action="guardarCheque.do" method="post">

                    <table id="tablaDias" class="table table-filter tableWrap " style="width: 50%">

                        <form:hidden path="idCheque"  />



                        <tbody>



                            <tr>
                                <th>Fecha Cobro:</th><td> <form:input path="fechaPago" /></td>
                            </tr>
                            <tr>
                                <th>Monto:</th><td> <form:input path="monto" /></td>
                            </tr>
                            <tr>
                                <th>Serie:</th><td> <form:input path="serie" /></td>
                            </tr>
                        </tbody>    
                        <tfoot>    
                            <tr>
                                <td colspan="2"><button name='boton' type='submit' id="btnAgregarCheque" class="btn btn-primary">Agregar</button></td>
                            </tr>
                        </tfoot>    
                    </table>  

                </form:form>
            </div>
        </c:if>

            <div class="tableWrap" >

                <h3>
                    <c:out value="Cheques Ingresados" />
                </h3>
                <table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap table-striped">



                    <!--Falta Agregar campo codigo inscripcion-->
                    <tr>

                        <th></th>
                        <th>Datos Cheque</th>                			                       
                        <th></th>                  
                    </tr>
                    <c:if test="${pago.cheques.size() <= 0}">
                        <tr><td colspan="3">0 Cheques</td></tr>
                    </c:if>
                    <c:forEach items="${pago.cheques}" var="cheque">
                        <tr>
                            <td>
                                <div>
                                </div>
                                <div>
                                    <c:out value="${cheque.idCheque}" />
                                </div>
                            </td>			                            


                            <td>
                                <div>
                                    <c:out value="Banco - ${cheque.banco} - Titular ${cheque.titular} Monto ${cheque.monto}" />
                                </div>
                               
                            </td>			                        
                            <td></td>

                        </tr>
                    </c:forEach>

                </table>
            </div>
                    
                
                  </div>
            <script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
            <script type="text/javascript" src="../resources/js/bootstrap.js"></script>
            <script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
            <script type="text/javascript">
$(document).ready(function() {
    $('#btnAgregarCheque').click(function(){
    
    var tmp = $("#monto").val();
    tmp = tmp.replace('.','');
    $("#monto").val(tmp);
    
});    

    $('#btnIngresarPago').click(function(){
    
    tmp = $("#montoPago").val();
    tmp = tmp.replace('.','');
    $("#montoPago").val(tmp);
    
});    

});


$(function() {
                        $("#fechaPago").datepicker({ dateFormat: "dd/mm/yy" });
              
                    });
                    
</script>
        </body>
    </html>