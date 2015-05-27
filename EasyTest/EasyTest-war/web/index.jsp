<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="header">
        
   

    </jsp:attribute>
    <jsp:attribute name="footer">
      
    </jsp:attribute>
    <jsp:body>
        		
         <form action="EncuestadorServlet?action=guardar" method="POST">
            <div class="col-md-6 col-md-offset-3">
		<div class="panel panel-default">
			
			<div class="panel-heading">
				<b>Indice</b>
			</div>

						
		</div>
	</div>				
	
            
        </form>

    </jsp:body>
</t:template>