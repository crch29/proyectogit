<%-- 
    Document   : definirPorcentaje
    Created on : 12/07/2016, 02:39:02 AM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>MODIFICAR PORCENTAJE GANANCIA</title>
    </head>
       <body background="startup-1.jpg">
                
            <nav role="navigation" class="navbar navbar-default navbar-inverse">
        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand">Cooperacha</a>
        </div>
 
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="principal.jsp">Inicio</a></li>
            </ul>
        </div>
</nav>
           
           
        
           <form name="iniciativa" role="form" action="definirPorcentaje.jsp" >
         <div class="text-center container">
          <h1>DEFINIR PORCENTAJE GANANCIA</h1> 
          <div class="form-group">
              
              <table class="table table-striped table-bordered table-condensed">
                  <%!
                      String valor;
                  %>
                  
                        <% try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
        valor=port.consultarPorcentaje();
        
    }catch (Exception ex) {
	// TODO handle custom exceptions here
    }%>
                  		<tr>
                                    <td><h5>NUEVO % DE GANANCIA</h5></td><td><input type="text" name="porcentaje" value="<%=valor%>"></td>
                  		</tr>
                  		
 </table>
           <button class="btn btn-primary" type="submit" name="agregar">Modificar</button>
                    
           </div>
 
        </div>
            
            <%
        String porcentaje = request.getParameter("porcentaje");
        
        
    if(porcentaje!=null){  
        
    try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
        port.definirPorcentaje(porcentaje);
        
    }catch (Exception ex) {
	// TODO handle custom exceptions here
    }}
    %>
  
       </form>
        <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
       </body>
</html>

