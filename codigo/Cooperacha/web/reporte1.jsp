<%-- 
    Document   : reporte1
    Created on : 4/07/2016, 04:37:22 AM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="clases.conexionn" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            conexionn con= new conexionn();
          File reporte= new File(application.getRealPath("/reportes/usuarios.jasper"));
        Map parameters = new HashMap();
        
        byte[] bytes= JasperRunManager.runReportToPdf(reporte.getPath(),parameters, con.getconexion());
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream= response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        outputstream.flush();
        outputstream.close();
       
        
    %>
    </body>
</html>
