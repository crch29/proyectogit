<%-- 
    Document   : porCategoria
    Created on : 8/07/2016, 09:12:46 PM
    Author     : carlosrene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="clases.*" %>
<%@page import="javax.servlet.ServletResponse" %>
<%@page import="net.sf.jasperreports.view.JasperViewer" %>
<%@page import="java.sql.*" %>

<%
            Connection cone = null;
            Class.forName("org.postgresql.Driver").newInstance();
            cone = DriverManager.getConnection("jdbc:postgresql://localhost:5432/cooperachadb", "postgres", "112016f2"); 
            File reporte= new File(application.getRealPath("//reportes//porCategoria.jasper"));
            Map parameters= new HashMap();
           
            
            byte[] bytes=JasperRunManager.runReportToPdf(reporte.getPath(), parameters, cone);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputstream= response.getOutputStream();
            outputstream.write(bytes,0,bytes.length);
            outputstream.flush();
            outputstream.close();
        %>

