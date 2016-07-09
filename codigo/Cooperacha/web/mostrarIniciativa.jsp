<%-- 
    Document   : mostrarIniciativa
    Created on : 26/06/2016, 03:58:39 AM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>Iniciativa</title>
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
           
           
        
           <form name="iniciativa" role="form" method="post">
         <div class="text-center container">
          <h1>INICIATIVA</h1> 
          <div class="form-group">
              
              <table class="table table-striped table-bordered table-condensed">
              
              <%
                  HttpSession s=request.getSession();
                  String dato=(String)s.getAttribute("codigo");
                  int codiniciativa=Integer.parseInt(dato);
                  try {
                    cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
                    cooperacha.Operaciones port = service.getOperacionesPort();
                     
                    java.util.List<cooperacha.Iniciativa> result = port.mostrarIniciativa(codiniciativa);
                    cooperacha.Iniciativa iniciativa = new cooperacha.Iniciativa();
                    iniciativa= result.get(0);
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
                  <td>NOMBRE</td><td><%=nombre%></td>
                </tr>
                <tr>
                    <td>DESCRIPCION</td><td><%=descripcion%></td>
                </tr>
                <tr>
                    <td>META</td><td><%=meta%></td>
                </tr>
                <tr>
                    <td>TIEMPO</td><td><%=tiempo%></td>
                </tr>
                <tr>
                    <td>MONTO ALCANZADO</td><td><%=monto%></td>
                </tr><%
                    
                } catch (Exception ex) {
                    // TODO handle custom exceptions here
                }
    %>
    

              </table>
    <h2>RECOMPENSAS ASOCIADAS</h2>
    
    <table class="table table-striped table-bordered table-condensed">
        <tr>
            <td>CODIGO RECOMPENSA</td><td>DESCRIPCION</td><td>PRECIO X UNIDAD</td>
        </tr>
    <%
        java.util.ArrayList<String> codigoss= new java.util.ArrayList<String>();
        codigoss.add("vacio");
    try {
	cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
	cooperacha.Operaciones port = service.getOperacionesPort();
	java.util.List<cooperacha.Recompensa> result = port.consultaRecompensaIniciativa(codiniciativa);
	for(int i=0;i<result.size();i++){
                            cooperacha.Recompensa recompensa = new cooperacha.Recompensa();
                            recompensa= result.get(i);
                            String cod_recompensa= String.valueOf(recompensa.getCodRecompensa());
                            String stock=String.valueOf(recompensa.getStock());
                            String descripcion= recompensa.getDescripcion();
                            String estado= recompensa.getEstado();
                            String tipo= recompensa.getTipo();
                            String cod_iniciativa= String.valueOf(recompensa.getCodIniciativa());
                            String precio_unidad= String.valueOf(recompensa.getPrecioUnidad());
                            codigoss.add(cod_recompensa);
              %><tr>
                 
                  <td><%=cod_recompensa%></td><td><%=descripcion%></td><td><%=precio_unidad%></td>
               </tr><%
                        
                        
                        }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    
    
    </table>
     </div>
         </div>
    
   </form>
    
    <form action="mostrarIniciativa.jsp">
        <div class="text-center container">
        <div class="form-group">
         <table class="table table-striped table-bordered table-condensed">
            <td>SELECCIONE RECOMPENSA</td><td><select name="codrecompensa" class="form-group"><%
            for(int i=0;i<codigoss.size();i++){
                %><option><%=codigoss.get(i)%></option>
            <%}%> </select></td>
        </table>
        <button class="form-control btn btn-primary" type="submit" value="donar" name="donar">donar</button>
            
        <%
            if(request.getParameter("donar")!=null){
                String recompensas= request.getParameter("codrecompensa");
                s.setAttribute("cod_recompensa", recompensas);
                out.println("valor "+recompensas);
                %><jsp:forward page="realizardonacion.jsp"></jsp:forward><%
            }
        %>
            
            
        
        </div>
        </div>
    </form>
        
       
    
    
      

             
       
        <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
       </body>
</html>
