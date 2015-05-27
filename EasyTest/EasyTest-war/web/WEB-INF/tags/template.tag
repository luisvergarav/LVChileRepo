<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
         <link href="/EasyTestWeb/resources/css/bootstrap.min.css" rel="stylesheet">
             <link href="/EasyTestWeb/resources/css/bootstrapValidator.min.css" rel="stylesheet"/>
    
        

    </head>
  <body>
    <div id="pageheader">
      <jsp:invoke fragment="header"/>
       <nav class="navbar navbar-default" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">Login</a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-ex1-collapse navbar-inverse " >
		<ul class="nav navbar-nav">
			<li class="active"><a href="<%=request.getContextPath()%>/restricted/mantenedorServlet?action=agregarUsuario">Admin Zone</a></li>
			<li><a href="<%=request.getContextPath()%>/logout.jsp?logoff=true">LogOut</a></li>
                        
		</ul>
		<form class="navbar-form navbar-inverse navbar-left" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
		<ul class="nav navbar-nav navbar-right">
                    		
                        <c:if test='<%=request.isUserInRole("ENCUESTADOR")%>' >
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Encuestador<b class="caret"></b></a>
				<ul class="dropdown-menu">					
					<li><a href="<%=request.getContextPath()%>/encuestador/EvaluacionServlet?action=agregar">Crear Test</a></li>
				
				</ul>
			</li>
                        </c:if>
                        <c:if test='<%=request.isUserInRole("ADMIN")%>' >
                        <li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Administrador<b class="caret"></b></a>
				<ul class="dropdown-menu">
                                        <li><a href="<%=request.getContextPath()%>/restricted/mantenedorServlet?action=agregarUsuario">Registrar Usuarios</a></li>
					<li><a href="<%=request.getContextPath()%>/encuestador/EncuestadorServlet?action=agregar">Crear Encuestador</a></li>
				
				</ul>
			</li>
                        </c:if>
		</ul>
	</div><!-- /.navbar-collapse -->
</nav>	
    </div>
    <div id="body">
      <jsp:doBody/>
    </div>
    <div id="pagefooter">
         
      <jsp:invoke fragment="footer"/>
      
      <div class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
			<div class="container">
				<div class="navbar-text pull-left">
					<p>EasyTest Company© 2015</p>
				</div>
			</div>
	</div>
    </div>
      <script src="https://code.jquery.com/jquery.js"></script>
    
       
	<script src="/EasyTestWeb/resources/js/jquery.min.js"></script>
         <script src="/EasyTestWeb/resources/js/bootstrapValidator.js" type="text/javascript"></script>
         <script src="/EasyTestWeb/resources/js/bootstrap.min.js"></script>
      <script src="/EasyTestWeb/resources/js/bootstrapValidator.min.js" type="text/javascript"></script>
  </body>
  <script type="text/javascript">
	$(document).ready(function () {
		var validator = $("#registroForm").bootstrapValidator({
			feedbackIcons: {
				valid: "glyphicon glyphicon-ok",
				invalid: "glyphicon glyphicon-remove", 
				validating: "glyphicon glyphicon-refresh"
			}, 
			fields : {
				nombre : {
					validators: {
						notEmpty : {
							message : "El nombre es requerido"
						},
						stringLength : {
							min : 3,
							max: 30,
							message:  "El nombre debe contener entre 3 y 30 caracteres"
						}, 
					}
				},

				apellido : {
					validators: {
						notEmpty : {
							message : "El apellido es requerido"
						},
						stringLength : {
							min : 3,
							max: 30,
							message:  "El apellido debe contener entre 3 y 30 caracteres"
						}, 
					}
				},	


				email :{
					message : "Email es requerido",
					validators : {
						notEmpty : {
							message : "Por favor ingrese un email"
						}, 
						stringLength: {
							min : 6, 
							max: 35,
							message: "Email debe contener entre 6 and 35 caracteres"
						},
						emailAddress: {
							message: "Email invalido"
						}
					}
				}, 

				dpbox_sexo : {
					validators : {
						greaterThan : {
							value: 1,
							message: "Una compañia es requerida"
						}
					}
				}
			}
		});
	
		validator.on("success.form.bv", function (e) {
			

			$("#confirmation").removeClass("hidden");
		});
		
	});
</script>

</html>