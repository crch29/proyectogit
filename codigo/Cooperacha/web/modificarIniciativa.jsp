<%-- 
    Document   : modificarIniciativa
    Created on : 27/06/2016, 02:17:45 AM
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
 
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="principal.jsp">Inicio</a></li>
               
                
                
               </ul>
        </div>
</nav>
        
        
        <form role="form" action="modificarIniciativa.jsp">
            <div class="form-group col-lg-offset-5">
            
            </div>
        
                <%! 
                    String a;
                    String b,c;
                    
                %>
        
                 <%-- start web service invocation --%><hr/>
    <%
        HttpSession s= request.getSession();
        String cod_iniciativa=(String)s.getAttribute("codigo");
    try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
	
	java.util.List<cooperacha.Iniciativa> result = port.consultarIniciativa(cod_iniciativa);
        %><div class="container"><table class="table table-bordered table-responsive table-striped"><%
        for(int i=0;i<result.size();i++){
            cooperacha.Iniciativa iniciativa=new cooperacha.Iniciativa();
            iniciativa =result.get(i);
            %><tr><td><h4>Campos</h4></td><td><h4>Datos Nuevos</h4></td></tr><%
                %><tr><td><h6>Tiempo</h6></td><td><input type="text" name="tiempo" value="<%out.println(iniciativa.getTiempo());%>" readonly="false"></td></tr><%
            %><tr><td><h6>Descripcion</h6></td><td><input type="text" name="descripcion" value="<%out.println(iniciativa.getDescripcion());%>"></td></tr><%
            %><tr><td><h6>Meta</h6></td><td><input type="text" name="meta" value="<%out.println(iniciativa.getMeta());%>"></td></tr><%
            
                
                
        }
%></table></div><%   
                a=request.getParameter("tiempo");
                b=request.getParameter("descripcion");
                c=request.getParameter("meta");
               
                
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }

%>
        <div class="container center-block form-group">
            <button type="submit" class="btn btn-primary" name="guardar" value="guardar">Guardar Cambios</button>
        </div>

<%
    if(b!=null){
        if(request.getParameter("guardar")!=null){
        try {
            cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
            cooperacha.Operaciones port = service.getOperacionesPort();

           port.actualizarIniciativa(a, b, c, cod_iniciativa);
%><jsp:forward page="modificarIniciativaI.jsp"></jsp:forward><%

        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }
        }
    }
    


%></form>
    

    
           

   

        

        
      <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>


