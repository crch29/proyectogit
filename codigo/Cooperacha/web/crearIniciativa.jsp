<%-- 
    Document   : crearIniciativa
    Created on : 25/06/2016, 10:00:06 AM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>CREAR INICIATIVA</title>
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
           
           
        
           <form name="iniciativa" role="form" >
         <div class="text-center container">
          <h1>CREAR INICIATIVA</h1> 
          <div class="form-group">
              
              <table class="table table-striped table-bordered table-condensed">
                  		<tr>
                                    <td><h5>NOMBRE</h5></td><td><input type="text" name="nombre"></td>
                  		</tr>
                  		<tr>
                                    <td><h5>DESCRIPCION</h5></td><td><textarea name="descripcion" rows="2"></textarea></td>
                  		</tr>
                  		<tr>
                                    <td><h5>META</h5></td><td><input type="text"  name="meta"></td>
                                </tr>
                  		<tr>
                  			<td><h5>TIEMPO</h5></td><td><input type="text" name="tiempo"></td>
                  		</tr>
                  		<tr>
                  			<td><h5>CATEGORIA</h5></td><td><%
        try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
	 // TODO initialize WS operation arguments here
	java.lang.String tabla = "subcategoria";
	java.lang.String campo = "cod_subcategoria";

	// TODO process result here
	java.util.List<java.lang.Object> result = port.consultarListas(tabla, campo);
        
        %> <select name="subcategoria" class="form-group"><%
            for(int i=0;i<result.size();i++){
                %><option><%=result.get(i)%></option><%
            }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
%></select></td>
                  		</tr>
                                <tr>
                                    <td><h5>Estado</h5></td><td><select name="estado" class="form-group"><option>borrador</option><option>publicar</option></select></td>
                  		</tr>
                                
                  		
                  		
            </table>
           <button class="btn btn-primary" type="submit" name="agregar">agregar</button>
                    
           </div>
 
        </div>
            
            <%
        String nombre = request.getParameter("nombre");
        
        
    if(nombre!=null){  
        String descripcion = request.getParameter("descripcion");
        String meta = request.getParameter("meta");
        String tiempo = request.getParameter("tiempo");
        String subcategoria = request.getParameter("subcategoria");
        HttpSession s = request.getSession();
        String cod_usuario=(String)s.getAttribute("cod_usuario");
        String estado= request.getParameter("estado");
    try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
        String estad="true";
	 if(estado.equals("borrador")){
             estad="false";
         }
         port.ingresarIniciativaborrador(nombre, descripcion, tiempo, subcategoria, cod_usuario, meta, estad);
    }catch (Exception ex) {
	// TODO handle custom exceptions here
    }}
    %>
  
       </form>
        <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
       </body>
</html>
