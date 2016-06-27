<%-- 
    Document   : ingresarModerador
    Created on : 27/06/2016, 12:33:58 AM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>REALIZAR DONACION</title>
    </head>
       <body class="bg-success">
                
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
           
           
        
           <form name="iniciativa" role="form" action="ingresarModerador.jsp">
         <div class="text-center container">
          <h1>ASIGNAR MODERADOR</h1> 
          <div class="form-group">
                 
              <table class="table table-striped table-bordered table-condensed">
                  		<tr>
                                    <td><h5>Usuario</h5></td><td><%
        try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
	 // TODO initialize WS operation arguments here
	java.lang.String tabla = "Usuario";
	java.lang.String campo = "cod_usuario";

	// TODO process result here
	java.util.List<java.lang.Object> result = port.consultarListas(tabla, campo);
        
        %> <select name="usuario" class="form-group"><%
            for(int i=0;i<result.size();i++){
                %><option><%=result.get(i)%></option><%
            }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
%></select></td>
                  		</tr>
                  		
                
            </table>
           <button class="btn btn-primary" type="submit" name="agregar">Asignar Moderador</button>
           <%
                if(request.getParameter("agregar")!=null){
                    HttpSession s=request.getSession();
                    String cod_iniciativa=(String)s.getAttribute("codigo");
                    String cod_usuario = request.getParameter("usuario");
                    
                    
     
    try {
        
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
	port.ingresarModerador(cod_iniciativa, cod_usuario);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
                }              
    %>
  

                        
           </div>
 
        </div>
            
          
 


   
       </form>
        <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
       </body>
</html>

