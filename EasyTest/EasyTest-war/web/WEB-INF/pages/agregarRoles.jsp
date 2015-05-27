<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="header">
        


    </jsp:attribute>
    <jsp:attribute name="footer">

    </jsp:attribute>
    <jsp:body>
        <div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">Registration</div>
			<div class="panel-body">
				<form id="registration-form" method="POST" class="form-horizontal" action="#">
					<div class="form-group">
						<label class="col-md-2 control-label" for="email">Email</label>
						<div class="col-md-4">
							<input type="text" class="form-control" id="email" name="email" placeholder="Your email address" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="password">Password</label>
						<div class="col-md-4">
							<input type="password" class="form-control" id="password" name="password" placeholder="Password" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="confirmpassword">Confirmar Password</label>
						<div class="col-md-4">
							<input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Confirm password" />	
						</div>
					</div>					
					<div class="form-group">
						<label class="col-md-2 control-label" for="membership"></label>
						<div class="col-md-4">
							<select class="form-control" id="membership" name="membership">
								<option value="0">-Selecciona un perfil a asignar-</option>
								<option value="1">ENCUESTADOR</option>
								<option value="2">JEFE DE PERSONAL</option>
                                                                <option value="2">JEFE DE ESTUDIO</option>
                                                                <option value="2">TIMER</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6 col-md-offset-2">
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</div>
				</form>
				<div id="confirmation" class="alert alert-success hidden">
					<span class="glyphicon glyphicon-star"></span> Thank you for registering
				</div>
			</div>
		</div>
	</div>

    </jsp:body>
</t:template>