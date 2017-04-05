<%-- 
    Document   : addanswer
    Created on : 3 Apr, 2017, 3:43:40 PM
    Author     : arka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="constants.DatabaseLogin" %>
<%@page import="constants.Constants" %>
<%@page import="DBControl.DBEngine" %>
<%@page import="DBControl.AnswerDAO" %>

<%
    String body = request.getParameter("answer-body");
    int id = (Integer)session.getAttribute("current_question");
    String username = (String)session.getAttribute("user_name");
    
    try {
        DBEngine dbengine = new DBEngine();
        dbengine.establishConnection();
        try {
            Connection con = dbengine.getConnection();
            AnswerDAO answerDAO = new AnswerDAO(con);
            
            int res = answerDAO.insertAnswer(body, username, id); // keep dummy username for now
            if (res > 0) {
                response.sendRedirect("qa.jsp?param=" + id);
            } else  {
                out.println("Your question was not posted. Please try again!!");
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