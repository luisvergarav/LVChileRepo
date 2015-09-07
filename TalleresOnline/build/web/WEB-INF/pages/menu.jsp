<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
		$(document).ready(function() {
                    
			function actualiza_migas(linkpress){
				$(".breadcrumb").html("<li><a href='index.html'>Inicio</a> <span class='divider'>/</span></li>");

				linkpress.parents("ul li").each(function(index){ 
					var href = $(this).context.firstElementChild.getAttribute('href');
					var text = $(this).context.firstElementChild.innerText;
					
					//no es linkeable 
					/*if(href == '#')
					{
						$(".breadcrumb > li:first").after("<li>"+text+"<span class='divider'>/</span></li>");
					}
					else //es linkeable
					{
						$(".breadcrumb > li:first").after("<li><a href='"+href+"'>"+text+"</a><span class='divider'>/</span></li>");
					}*/
					$(".breadcrumb > li:first").after("<li>"+text+"<span class='divider'>/</span></li>");
				});
			}
                             
			//Menu ajax 
			$('a.menuajax').click(function() { 
				$('.dropdown').removeClass('open');
				var content = $(this).attr('href');
				
				
                                $('#content').load(content);
                                actualiza_migas($(this));
				return false;
			});
                        
                       
		});
	</script>
<div id="wrapContent">
		<div class="container" >
            <h1> </h1>
            <div class="navbar">
                <div class="navbar-inner container">
                     <ul class="nav" id="gedinNavbar">
                        <li class="dropdown">
                            <a id="gestor" href="#" class="dropdown-toggle" data-toggle="dropdown">Listados <b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
                            	<li role="presentation"><a class="menuajax" href="inicio_dia">Alumno/Profesor</a></li>
                                        
                                        <li role="presentation" class="dropdown-submenu">
								   <a href="#">Coordinacion</a>
								     <ul class="dropdown-menu">
								         <li><a class="menuajax" href="/TalleresOnline/informes/informeSeccionesAlumno.do">Alumnos/Seccion</a></li>
                                                                        <li><a class="menuajax" href="/TalleresOnline/informes/informesPorTaller.do">Seccion/Alumno</a></li>                                                                         
								         
								         
								     </ul>
								 </li>
                           		
                             </ul>
                        </li>
                        <li class="dropdown">
                            <a id="movimientos" href="#" class="dropdown-toggle" data-toggle="dropdown">Talleres <b class="caret"></b></a>
                           	 <ul class="dropdown-menu" role="menu">
                                	<li role="presentation"><a class="menuajax" href="ingreso_movimientos">Dar de baja Alumno</a></li>
                                        <li role="presentation"><a class="menuajax" href="/TalleresOnline/inscripciones/seleccionarAlumno.do">Inscribir alumno</a></li>
                                        <li role="presentation" class="dropdown-submenu">
								   <a href="#">Mantencion</a>
								     <ul class="dropdown-menu">
								         <li><a class="menuajax" href="/TalleresOnline/mantenedor/agregarTaller.do">Agregar Taller</a></li>
								         <li><a class="menuajax" href="/TalleresOnline/mantenedor/listado.do">Listado</a></li>
								         
								     </ul>
								 </li>
                           		
                                	
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a id="saldos" href="#" class="dropdown-toggle" data-toggle="dropdown">Asistencia <b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
								
								<li role="presentation"><a class="menuajax" href="agregarTaller.do">Revisar Asistencia</a></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a id="saldos" href="#" class="dropdown-toggle" data-toggle="dropdown">Configuracion<b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu">
								
								<li role="presentation"><a class="menuajax" href="/TalleresOnline/sistema/configuracion.do">Sistema</a></li>
                                                               
                        </ul>
                        </li>
                        <li>
                            <a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
                        </li>
                        <li id="fecha_menu" class="pull-right">
                            
                            <a id="fechaProceso" href="#" class="text-info"><b>2<%= session.getAttribute("cartBean")%></b></a>
                        </li>
                       <li id="fecha_menu" class="pull-right">
                        	<a id="fechaProceso" href="#" class="text-info"><b>Fecha :31/01/2015</b></a>
                        </li>
                        
					</ul>
                </div>
                 <ul class="breadcrumb"></ul> 
            </div>
            
</div>       
             
</div>       
     