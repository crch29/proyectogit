<%-- 
    Document   : modificarUsuarios
    Created on : 12/07/2016, 12:46:02 AM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>Modificar Usuarios</title>
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
           
           
        
           <form name="iniciativa" role="form">
         <div class="text-center container">
          <h1>Usuarios en Plataforma</h1> 
          <div class="form-group">
              
            
              
              <table class="table table-striped table-bordered table-condensed">
                  		<tr>
                                    <td>codigo</td><td>nickname</td><td>nombre</td><td>accion</td>
                  		</tr>
              
              <%
                        HttpSession s= request.getSession();
                        String usuario=(String)s.getAttribute("cod_usuario");
                        String cod_iniciativa=(String)s.getAttribute("codigo");
                      java.util.ArrayList<String> codigos= new java.util.ArrayList<String>();
                    try {
                        cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
                        cooperacha.Operaciones port = service.getOperacionesPort();
                        
                        java.util.List<cooperacha.Usuario> result = port.consultarUsuarios();
                        for(int i=0;i<result.size();i++){
                            cooperacha.Usuario usuarios=new cooperacha.Usuario();
                            usuarios= result.get(i);
                            String codigo= String.valueOf(usuarios.getCodusuario());
                            String nickname= usuarios.getNickname();
                            String nombre=usuarios.getNombre();
                           
              %><tr>
                 
                  <td><%=codigo%></td><td><%=nickname%></td><td><%=nombre%></td><td><button class="form-control btn btn-primary" type="submit" value="<%=codigo%>" name="<%=codigo%>">Modifcar</button></td>
               </tr><%
                        String clave=request.getParameter(String.valueOf(codigo));
                        if(clave!=null){
                            s.setAttribute("modificar",clave);
                            %><jsp:forward page="modificarUsuariosI.jsp"></jsp:forward><%
                        }
                        }
                    }catch (Exception ex) {
                        // TODO handle custom exceptions here
                    }
                  
    %>
              </table>
          </div>
         </div>

         
       </form>
        <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
       </body>
</html>

