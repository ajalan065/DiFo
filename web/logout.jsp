<%-- 
    Document   : logout
    Created on : 28 Mar, 2017, 1:04:02 AM
    Author     : ajalan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
    session.removeAttribute("user_email");
    session.removeAttribute("user_name");
    session.removeAttribute("f_name");
    session.removeAttribute("m_name");
    session.removeAttribute("l_name");
    session.removeAttribute("user_status");
    session.invalidate();
    out.println("<script type=\"text/javascript\">");
    out.println("location='index.jsp';");
    out.println("</script>");
    
%>