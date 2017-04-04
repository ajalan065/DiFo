<%-- 
    Document   : inputmessage
    Created on : 4 Apr, 2017, 2:18:09 PM
    Author     : ajalan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBControl.ChatMessage" %>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="constants.DatabaseLogin" %>
<%@page import="constants.Constants" %>
<%@page import="DBControl.DBEngine" %>

<%
    String msg = request.getParameter("usermsg");
    String name=(String)session.getAttribute("user_name");
    
    try {
        DBEngine dbengine = new DBEngine();
        dbengine.establishConnection();
        try {
            Connection con = dbengine.getConnection();
            ChatMessage chatMessage = new ChatMessage(con);
            
            int res = chatMessage.insertChatMessage(name, msg); // keep dummy username for now
            
            if (res > 0) {
                response.sendRedirect("chatwithus.jsp");
            } else  {
                out.println("Could not send message.. Try again!!");
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        dbengine.closeConnection();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Could not connect");
    }
%>
