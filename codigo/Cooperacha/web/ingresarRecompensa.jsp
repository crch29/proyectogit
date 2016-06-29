<%-- 
    Document   : ingresarRecompensa
    Created on : 27/06/2016, 09:58:31 AM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>CREAR RECOMPENSA</title>
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
           
           
        
           <form name="recompensa" role="form" action="ingresarRecompensa.jsp">
         <div class="text-center container">
          <h1>CREAR RECOMPENSA</h1> 
          <div class="form-group">
              
              <table class="table table-striped table-bordered table-condensed">
                  		<tr>
                                    <td><h5>STOCK</h5></td><td><input class="form-control" type="text" name="stock"></td>
                  		</tr>
                  		<tr>
                                    <td><h5>DESCRIPCION</h5></td><td><textarea class="form-control" name="descripcion" rows="2"></textarea></td>
                  		</tr>
                  		<tr>
                                    <td><h5>TIPO</h5></td><td><select class="form-control" name="tipo"><option>limitada</option><option>ilimitada</option></select></td>
                                </tr>
                  		<tr>
                  			<td><h5>PRECIO</h5></td><td><input class="form-control" type="text" name="precio"></td>
                  		</tr>
                  		
                                
                  		
                  		
            </table>
           <button class="btn btn-primary form-control" type="submit" value="agregar" name="agregar">agregar</button>
                    
           </div>
 
        </div>
            
            <%
        String stock = request.getParameter("stock");
        String descripcion = request.getParameter("descripcion");
        String tipo = request.getParameter("tipo");
        String precio = request.getParameter("precio");
        HttpSession s = request.getSession();
        String cod_iniciativa=(String)s.getAttribute("codigo");
      
        
      if(descripcion!=null){
         
    try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
	port.ingresarRecompensa(stock, descripcion, tipo,cod_iniciativa, precio);
        
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
          
      }
    %>
  
       </form>
        <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
       </body>
</html>

