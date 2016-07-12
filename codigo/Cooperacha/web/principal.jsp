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
    <body background="startup-1.jpg">
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
        <%
                    HttpSession s= request.getSession();
                    String codigo=(String)s.getAttribute("cod_usuario");
                    String nick=(String)s.getAttribute("nickname");
                    String cod=(String)s.getAttribute("cod_rol");
                    int cod_rol=Integer.parseInt(cod);
        %>
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
               <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                     Iniciativa <b></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="crearIniciativa.jsp">Crear Iniciativa/Borrador</a></li>
                    <li><a href="busquedaIniciativa.jsp">Buscar Iniciativa por nombre</a></li>
                    <li><a href="iniciativasPublicadas.jsp">Iniciativas publicadas en plataforma</a></li>
                    <li><a href="denunciaIniciativa.jsp">Denunciar iniciativa</a></li>
                     <li><a href="eliminarBorrador.jsp">eliminar borrador</a></li>
                     <li><a href="eliminarIniciativa.jsp">eliminar iniciativa publicada</a></li>
                     <li><a href="publicarBorradorI.jsp">publicar borrador</a></li>
                     <li><a href="modificarIniciativaI.jsp">Modificar Iniciativa</a></li>
                </ul>
                </li> 
                <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                     Cometarios <b></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="generarcomentario.jsp">Comentar</a></li>
                    <li><a href="eliminarcomentario.jsp">eliminar comentario</a></li>
                    <li><a href="denunciarComentario.jsp">denunciar comentario</a></li>
                     
                </ul>
                </li> 
                <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                     Recompensa <b></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="crearRecompensa.jsp">ingresar recompensa</a></li>
                    <li><a href="cargarRecompensa.jsp">Cargar Recompensas</a></li>
                     
                </ul>
                </li> 
                <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                     Moderador <b></b>
                </a>
                <ul class="dropdown-menu">
                     <li><a href="asignarModerador.jsp">asignar moderador</a></li>
                    <li><a href="mantenerModerador.jsp">Gestionar Moderador</a></li>
                    <li><a href="reportes.jsp">Gestionar Moderador</a></li>
                     
                </ul>
                </li> 
                <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                     Usuario <b></b>
                </a>
                <ul class="dropdown-menu">
                    
                    <li><a href="modificarUsuario.jsp">Modificar Usuario</a></li>
                    <%if(cod_rol==1){%>
                    <li><a href="eliminarUsuario.jsp">Eliminar Usuarios</a></li>
                    <li><a href="modificarUsuarios.jsp">Modificar Usuarios</a></li>
                    <%}%>
                </ul>
                </li> 
                <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                     Panel Administrativo<b></b>
                </a>
                <ul class="dropdown-menu">
                     
                     <%
                       
                    
                        if(cod_rol==1){
                            %><li><a href="CargaCategoria.jsp">Cargar Categorias</a></li>
                            <li><a href="definirPorcentaje.jsp">Modificar porcentaje Ganancia</a></li><%
                        }
                    
                    %>
                </ul>
                </li> 
                <% 
                    if(cod_rol==1){%>
                 <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                     Reportes Administrativos <b></b>
                </a>
                <ul class="dropdown-menu">
                     <li><a href="porSubcategoria.jsp">reporte por sub-categoria</a></li>
                     <li><a href="porCategoria.jsp">reporte por categoria</a></li>
                     <li><a href="recaudacionSubcategoria.jsp">recaudacion por subcategoria</a></li>
                     <li><a href="recaudacionCategoria.jsp">recaudacion por categoria</a></li>
                     <li><a href="montoReal.jsp">monto real ganancia</a></li>
                     <li><a href="donacionesporIniciativa.jsp">Donaciones por Iniciativa</a></li>
                     <li><a href="topiniciativasporusuarios.jsp">top 5 iniciativas por usuario</a></li>
                     <li><a href="topDonadores.jsp">top donadores</a></li>
                </ul>
                </li><%}%>
                <li><a href="index.jsp">Salir</a></li>
                
  <input type="text" name="saludo" placeholder="<%=nick%>">
                
               </ul>
        </div>
</nav>

        
      <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>

