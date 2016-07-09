<%-- 
    Document   : cargarRecompensaII
    Created on : 8/07/2016, 04:34:53 PM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="java.util.*" %>
<%@page import="org.apache.commons.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <title>CARGAR RECOMPENSAS</title>
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
           
           
        
           <form  action="cargarRecompensaII.jsp" enctype="multipart/form-data" method="post">
                    <div class="text-center container">
               <h1>CARGAR SUBCATEGORIAS</h1> 
               <div class="form-group text-center container">
                  
                    <input class="input input-lg text-center" type="file" name="fichero"/></br> 
                    <input class="btn btn-primary"type="submit" value="Subir archivo"/> 

               </div>
                   
                    </div>
           </form>
           <%
                String nombrearchivo=null;
                HttpSession s = request.getSession();
                String codigo=(String)s.getAttribute("codigo");
		File destino = new File("C:\\subidos");
		ServletRequestContext src = new ServletRequestContext(request);
 
		if(ServletFileUpload.isMultipartContent(src)){
			DiskFileItemFactory factory = new DiskFileItemFactory((1024*1024),destino);
			ServletFileUpload upload = new  ServletFileUpload(factory);
 
			java.util.List lista = upload.parseRequest(src);
			File file = null;
			java.util.Iterator it = lista.iterator();
 
			while(it.hasNext()){
				FileItem item=(FileItem)it.next();
				if(item.isFormField())
					out.println(item.getFieldName()+"<br>");
				else
				{
					file=new File(item.getName());
					item.write(new File(destino,file.getName()));
                                        nombrearchivo=file.getName();
                                        try {
                                            cooperacha.Operaciones_Service service = new cooperacha.Operaciones_Service();
                                            cooperacha.Operaciones port = service.getOperacionesPort();
                                             
                                            port.cargarRecompensa(nombrearchivo);
                                            port.actualizarRecompensa(codigo);
                                        } catch (Exception ex) {
                                            out.println("ARCHIVO TIENE SUBCATEGORIAS REPETIDAS");
                                        }
					out.println("RECOMPENSAS CARGADAS");
				} // end if
			} // end while
		} // end if
                
            %>
        <script src="js/jquery.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
       </body>
</html>
