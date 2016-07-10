<%-- 
    Document   : denunciarComentarioII
    Created on : 9/07/2016, 08:33:14 AM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>Denuncia Comentario</title>
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
           
           
        
           <form name="iniciativa" role="form" action="denunciarComentarioII.jsp">
         <div class="text-center container">
          <h1>COMENTARIOS EN INICIATIVA</h1> 
          <div class="form-group">
              
            
              
              <table class="table table-striped table-bordered table-condensed">
                  		<tr>
                                    <td>fecha</td><td>descripcion</td><td>codigo usuario</td><td>accion</td>
                  		</tr>
              
              <%
                        HttpSession s= request.getSession();
                        String usuario=(String)s.getAttribute("cod_usuario");
                        String cod_iniciativa=(String)s.getAttribute("codigo");
                      java.util.ArrayList<String> codigos= new java.util.ArrayList<String>();
                    try {
                         cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
                         cooperacha.Operaciones port = service.getOperacionesPort();
                        
                        java.util.List<cooperacha.Comentario> result = port.buscarcomentario(cod_iniciativa);
                        for(int i=0;i<result.size();i++){
                            cooperacha.Comentario comentario=new cooperacha.Comentario();
                            comentario= result.get(i);
                            String fecha= comentario.getFecha();
                            String descripcion= comentario.getDescripcion();
                            String cod_usuario=String.valueOf(comentario.getCodUsuario());
                            String cod_comentario= String.valueOf(comentario.getCodComentario());
              %><tr>
                 
                  <td><%=fecha%></td><td><%=descripcion%></td><td><%=cod_usuario%></td><td><button class="form-control btn btn-primary" type="submit" value="<%=cod_comentario%>" name="<%=cod_comentario%>">Denunciar</button></td>
               </tr><%
                        String claves=request.getParameter(String.valueOf(cod_comentario));
                        if(claves!=null){
                           
                            port.denunciaComentario(cod_iniciativa,claves,cod_usuario);
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
