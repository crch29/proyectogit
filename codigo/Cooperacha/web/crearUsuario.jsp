<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>REGISTRO</title>
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
                <li class="active"><a href="index.jsp">Login</a></li>
            </ul>
        </div>
</nav>
           
           
        
           <form name="iniciativa" role="form" method="post">
         <div class="text-center container">
          <h1>Registro</h1> 
          <div class="form-group">
              
              <table class="table table-striped table-bordered table-condensed">
                  		<tr>
                                    <td><h5>NICKNAME</h5></td><td><input type="text" name="nickname"></td>
                  		</tr>
                  		<tr>
                                    <td><h5>NOMBRE</h5></td><td><textarea name="nombre" rows="2"></textarea></td>
                  		</tr>
                  		<tr>
                                    <td><h5>PASSWORD</h5></td><td><input type="text"  name="password"></td>
                                </tr>
                  		<tr>
                  			<td><h5>FECHA NACIMIENTO</h5></td><td><input type="text" name="fechanacimiento"></td>
                  		</tr>
                                <tr>
                                    <td><h5>DIRECCION</h5></td><td><input type="text" name="direccion"></td>
                  		</tr>
                                <tr>
                                    <td><h5>TELEFONO</h5></td><td><input type="text" name="telefono"></td>
                  		</tr>
                  		<tr>
                  			<td><h5>FORMA PAGO</h5></td><td><%
        try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
	 // TODO initialize WS operation arguments here
	java.lang.String tabla = "formapago";
	java.lang.String campo = "cod_formapago";

	// TODO process result here
	java.util.List<java.lang.Object> result = port.consultarListas(tabla, campo);
        
        %> <select name="formapago" class="form-group"><%
            for(int i=0;i<result.size();i++){
                %><option><%=result.get(i)%></option><%
            }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
%></select></td>
                  		</tr>
                               
                                
                  		
                  		
            </table>
           <button class="btn btn-primary" type="submit" name="agregar">Registrarse</button>
                    
           </div>
 
        </div>
            
            <%
        String nickname = request.getParameter("nickname");
        String nombre = request.getParameter("nombre");
        String password = request.getParameter("password");
        String fecha_nac = request.getParameter("fechanacimiento");
        String direccion = request.getParameter("direccion");
        String telefono= request.getParameter("telefono");
        String formapago= request.getParameter("formapago");
        
        
      
    try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
	 if(nickname!=null){
             port.crearusuario(nickname, nombre, password, fecha_nac, direccion, telefono, formapago);
             
             
         }
        
    } catch (Exception ex) {
	JOptionPane.showMessageDialog(null, "usuario ya utilizado, elija otro");
    }
    %>
  
       </form>
        <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
       </body>
</html>
