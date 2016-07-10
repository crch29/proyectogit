<%-- 
    Document   : generarcomentarioII
    Created on : 29/06/2016, 09:52:42 AM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>REALIZAR COMENTARIO</title>
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
           
           
        
           <form name="iniciativa" role="form" action="generarcomentarioII.jsp">
         <div class="text-center container">
          <h1>NUEVO COMENTARIO</h1> 
          <div class="form-group">
                 
              <table class="table table-striped table-bordered table-condensed">
                  		
                  		
                  		<tr>
                                    <td><h5>COMENTARIO</h5></td><td><textarea rows="2" name="comentario" class="form-control"></textarea></td>
                                </tr>
                
            </table>
              <button class="btn btn-primary" type="submit" name="agregar">agregar comentario</button>
          
           <%
                
                    HttpSession s=request.getSession();
                    String cod_iniciativa=(String)s.getAttribute("codigo");
                    String codusuario=(String)s.getAttribute("cod_usuario");
                    String comentario = request.getParameter("comentario");
                    
                    if(comentario!=null){
                    
                    
     
    try {
        
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
        String fecha= port.obtenerfecha();
	 
	port.ingresarcomentario(comentario,fecha,codusuario,cod_iniciativa);
	
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
