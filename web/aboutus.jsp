<%-- 
    Document   : aboutus
    Created on : 30 Mar, 2017, 7:18:36 PM
    Author     : arka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us | DiFo</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%
            String uri = request.getRequestURI();
            String pageName = uri.substring(uri.lastIndexOf("/")+1);
            session.setAttribute("current_loc", pageName);
        %>
        <h1>Welcome to DiFo! This is just the beginning.</h1>
    </body>
</html>
