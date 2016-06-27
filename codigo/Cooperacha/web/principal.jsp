<%-- 
    Document   : principal
    Created on : 26/06/2016, 08:21:17 PM
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
        <title>Principal</title>
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
               <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                     Iniciativa <b></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="crearIniciativa.jsp">Crear Iniciativa</a></li>
                    <li><a href="busquedaIniciativa.jsp">Buscar Iniciativa por nombre</a></li>
                    <li><a href="iniciativasPublicadas.jsp">Iniciativas publicadas</a></li>
                     <li><a href="asignarModerador.jsp">asignar moderador</a></li>
                     <li><a href="eliminarBorrador.jsp">eliminar borrador</a></li>
                </ul>
                </li> 
                <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                     Recompensa <b></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="crearRecompensa.jsp">ingresar recompensa</a></li>
                    
                     
                </ul>
                </li> 
                <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                     Usuario <b></b>
                </a>
                <ul class="dropdown-menu">
                    
                    <li><a href="modificarUsuario.jsp">Modificar Usuario</a></li>
                     
                </ul>
                </li> 
                <li><a href="index.jsp">Salir</a></li>
                
                <%
                    HttpSession s= request.getSession();
                    String codigo=(String)s.getAttribute("cod_usuario");
                    
%><input type="text" name="saludo" placeholder="<%=codigo%>">
                
               </ul>
        </div>
</nav>

        
      <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>
