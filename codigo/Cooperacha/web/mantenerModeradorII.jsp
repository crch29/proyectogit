<%-- 
    Document   : mantenerModeradorII
    Created on : 29/06/2016, 06:53:12 AM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>Eliminar Moderador</title>
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
           
           
        
           <form name="iniciativa" role="form" action="mantenerModeradorII.jsp">
         <div class="text-center container">
          <h1>MODERADORES ASIGNADOS A INICIATIVA</h1> 
          <div class="form-group">
              
            
              
              <table class="table table-striped table-bordered table-condensed">
                  		<tr>
                                    <td>codigo usuario</td><td>nickname</td><td>nombre</td><td>accion</td>
                  		</tr>
              
              <%
                        HttpSession s= request.getSession();
                        String usuario=(String)s.getAttribute("cod_usuario");
                        String cod_iniciativa=(String)s.getAttribute("codigo");
                        
                      
                    try {
                        cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
                        cooperacha.Operaciones port = service.getOperacionesPort();
                        
                        java.util.List<cooperacha.Usuario> result = port.gestionarmoderador(cod_iniciativa);
                        for(int i=0;i<result.size();i++){
                            cooperacha.Usuario usuarios = new cooperacha.Usuario();
                            usuarios= result.get(i);
                            String codigousuario= String.valueOf(usuarios.getCodusuario());
                            String nombre= usuarios.getNombre();
                            String nickname= usuarios.getNickname();
                            
                            
                            
              %><tr>
                 
                  <td><%=codigousuario%></td><td><%=nickname%></td><td><%=nombre%></td><td><button class="form-control btn btn-primary" type="submit" value="<%=codigousuario%>" name="<%=codigousuario%>">quitar moderador</button></td>
               </tr><%
                        String clave=request.getParameter(String.valueOf(codigousuario));
                        if(clave!=null){
                           
                            String uno=clave;
                            port.eliminarmoderadoriniciativa(uno, cod_iniciativa);
                            
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

