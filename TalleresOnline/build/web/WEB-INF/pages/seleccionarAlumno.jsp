<%@page import="models.VO.CartBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<style>
.imgCarro{
width: 30px !important ;
height: 30px !important;
}
</style>
</head>
<body>
        


<div class="container" id="content">
    


        
        
  
    <input type="hidden" id ="semestreGlobal" value="${semestreActivo.idsemestre}">
    <h3>
		<c:out value="${titulo}" />
	</h3>

	<p>
		
	</p>
	<div class="tableWrap">
	
	<table class="table table-filter tableWrap">
	<tbody>
	
	
	
	<tr>
            <td> <label>Nombre Apoderado</label></td>
            
            <td> <label>${username}</label></td>	
        
        </tr>
       
	</tbody>
	</table>
	
	</div>
	
        <div class="tableWrap" >
	<table id="tabla1" cellpadding='3' cellspacing='2' class="table table-filter tableWrap table-striped">
	
          
         
		<tr>	
                    <th></th>                	
                <th>Alumno</th>                                
                <th>Inscribir</th>
                </tr>
		<c:forEach items="${listaAlumnos}" var="alumno">
			<tr>
			
                            <td>
                                <div>
                                    <img width="50" height="50" src="<%= request.getContextPath() %>/resources/img/perfil.jpg"/>
                                </div>    
                                <div>
                                    <c:out value="${alumno.rutAlumno}" />
                                </div>
                            </td>
			
			<td>
                            <div>
                            <c:out value="${alumno.primerNombre} ${alumno.segundoNombre} ${alumno.apellidoPaterno} ${alumno.apellidoMaterno} Fecha de Nac. ${alumno.fechaNacimiento}" />
                            </div>
                            <div>
                            <c:out value="Curso ${alumno.curso} - ${alumno.nivel}" />
                            </div>
                        </td>
                        
                        
                        
                        <c:if test="${ semestreActivo.idsemestre>0}" >
                            <td><a href="<c:url value="/inscripciones/listadoInscripciones.do?rutAlumno=${alumno.rutAlumno}" />" ><img width="15%" height="15%" src="<%=request.getContextPath()%>/resources/img/inscribir.jpg"/></a></td>
                        </c:if>                
			</tr>
		</c:forEach>
		
		</table>
            </div>
        
        
</div>
            <% 
            CartBean cartB = (CartBean) session.getAttribute("cart"); 
                cartB.getListaTalleres().clear();
        cartB.setTotalBolsacompras(0);
%> 
<script type="text/javascript" src="../resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js/jquery.tablesorter.js"></script> 
<script type="text/javascript">


$("#btnConfirmar").click(function(){
    
        $("#msj_semestre_inactivo").css("display", "none");    
});

                    
</script>

</body>

</html>
