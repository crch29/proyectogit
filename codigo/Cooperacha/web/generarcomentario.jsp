<%-- 
    Document   : generarcomentario
    Created on : 29/06/2016, 09:48:34 AM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>BUSCAR INICIATIVA</title>
    </head>
       <body background="startup-1.jpg">
                
            <nav role="navigation" class="navbar navbar-default navbar-inverse">
        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only"></span>
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
          <h1>BUSCAR INICIATIVA</h1> 
          <div class="form-group">
              
              <div class="text-center container">
                <div class="input-group">
                  <input type="text" class="form-control" name="clave">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">Buscar</button>
                  </span>
                </div>
                </div>
              </div>
              
              <table class="table table-striped table-bordered table-condensed">
                  		<tr>
                                    <td>cod_iniciativa</td><td>nombre</td><td>descripcion</td><td>tiempo</td><td>cod_categoria</td><td>cod_usuario</td><td>estado</td><td>meta</td><td>monto</td><td>comentarios</td>
                  		</tr>
              
              <%
                  if((request.getParameter("clave")!=null)){
                      String base= request.getParameter("clave");
                      HttpSession s= request.getSession();
                    try {
                        cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
                        cooperacha.Operaciones port = service.getOperacionesPort();
                        java.util.List<cooperacha.Iniciativa> result = port.busquedainiciativa(base);
                        
                        for(int i=0;i<result.size();i++){
                            cooperacha.Iniciativa iniciativa = new cooperacha.Iniciativa();
                            iniciativa= result.get(i);
                            String cod_iniciativa= String.valueOf(iniciativa.getCodiniciativa());
                            String nombre= iniciativa.getNombre();
                            String descripcion= iniciativa.getDescripcion();
                            String tiempo= iniciativa.getTiempo();
                            String cod_categoria= String.valueOf(iniciativa.getCodsubcategoria());
                            String cod_usuario= String.valueOf(iniciativa.getCodusuario());
                            String estado= iniciativa.getEstado();
                            String meta = String.valueOf(iniciativa.getMeta());
                            String monto= String.valueOf(iniciativa.getMonto());
              %><tr>
                  <td><%=cod_iniciativa%></td><td><%=nombre%></td><td><%=descripcion%></td><td><%=tiempo%></td><td><%=cod_categoria%></td><td><%=cod_usuario%></td><td>activado</td><td><%=meta%></td><td><%=monto%></td><td><button class="form-control btn btn-primary" type="submit" value="<%=cod_iniciativa%>" name="<%=cod_iniciativa%>">comentar</button></td>
               </tr><%
                   
                        String clave=request.getParameter(String.valueOf(cod_iniciativa));
                        if(clave!=null){
                            s.setAttribute("codigo",clave);
                            String uno=(String)s.getAttribute("codigo");
                            
                            %><jsp:forward page="generarcomentarioII.jsp"></jsp:forward><%
                        }
                        }
                    } catch (Exception ex) {
                        // TODO handle custom exceptions here
                    }
                  }
    %>
              
              
              
              
             
   

                  
                  
              </table>


   
       </form>
        <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
       </body>
</html>

