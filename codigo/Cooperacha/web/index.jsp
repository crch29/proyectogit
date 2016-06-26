<%-- 
    Document   : index
    Created on : 25/06/2016, 10:39:18 PM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
                <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <title>INICIO</title>
    </head>
    <body class="bg-success">
        <br><br><br>
        
        <div class="panel panel-default center-block">
            <div class="panel-heading">
                <h3 class="panel-title">LOGIN</h3>
            </div>
                <div class="panel-body">
                <form name="login" role="form">
                    <div class="form-group">
                        <label for="log">ingrese usuario</label>
                        <input type="text" class="form-control" placeholder="usuario" name="usuario">
                    </div>
                    <div class="form-group">
                        <label for="contraseñl">ingrese contraseña</label>
                        <input type="password" method="post" class="form-control" placeholder="contraseña" name="contraseña">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn-primary">ingresar</button>
                        <a href="administrador/estudiante.jsp"/><button type="button" class="btn-primary">registrarse</button>
                    </div>
                </form>
            </div>
            
        </div>
        <%!          
            String nickname;
            String contraseña;
        %>
        
        <%
            if((request.getParameter("usuario")!=null)){
        String nickname = request.getParameter("usuario");
        String contraseña= request.getParameter("contraseña");
        session.setAttribute("nickname", nickname);
        
    try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
	java.lang.String result = port.validarusuario(nickname, contraseña);
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
            }
    %>
    <%-- end web service invocation --%><hr/>

        
     <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>

