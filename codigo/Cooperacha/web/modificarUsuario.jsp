<%-- 
    Document   : modificarUsuario
    Created on : 26/06/2016, 10:42:24 PM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
         <!-- Latest compiled and minified CSS -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <title>Modificar Usuario</title>
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
            <a href="#" class="navbar-brand">COOPERACHA</a>
        </div>
 
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="principal.jsp">Inicio</a></li>
               
                
                
               </ul>
        </div>
</nav>
        
        
        <form role="form">
            <div class="form-group col-lg-offset-5">
            
            </div>
        
                <%! 
                    String a;
                    String b,c,d;
                    
                %>
        
                 <%-- start web service invocation --%><hr/>
    <%
        HttpSession s= request.getSession();
        String usuario=(String)s.getAttribute("cod_usuario");
    try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
	
	java.util.List<cooperacha.Usuario> result = port.consultarUsuario(usuario);
        %><div class="container"><table class="table table-bordered table-responsive table-striped"><%
        for(int i=0;i<result.size();i++){
            cooperacha.Usuario usuarios=new cooperacha.Usuario();
            usuarios =result.get(i);
            %><tr><td><h4>Campos</h4></td><td><h4>Datos Nuevos</h4></td></tr><%
                %><tr><td><h6>Nickname</h6></td><td><input type="text" name="nick" value="<%out.println(usuarios.getNickname());%>" readonly="false"></td></tr><%
            %><tr><td><h6>Contraseña</h6></td><td><input type="text" name="contra" value="<%out.println(usuarios.getContraseña());%>"></td></tr><%
            %><tr><td><h6>Direccion</h6></td><td><input type="text" name="dire" value="<%out.println(usuarios.getDireccion());%>"></td></tr>
              <tr><td><h6>Telefono</h6></td><td><input type="text" name="tel" value="<%out.println(usuarios.getTelefono());%>"></td></tr><%
            
                
                
        }
%></table></div><%   
                a=request.getParameter("nick");
                b=request.getParameter("contra");
                c=request.getParameter("dire");
                d=request.getParameter("tel");
                
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }

%><form role="form">
        <div class="container center-block form-group">
            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        </div>
<%
    if(b!=null){
        try {
            cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
            cooperacha.Operaciones port = service.getOperacionesPort();

            port.actualizarUsuario(b, c, d,usuario);

        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }
    }
    


%></form>
    

    
           

   

        

        
      <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>

