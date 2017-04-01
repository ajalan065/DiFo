<%-- 
    Document   : addquestion
    Created on : 31 Mar, 2017, 10:17:13 PM
    Author     : arka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="constants.DatabaseLogin" %>
<%@page import="constants.Constants" %>
<%@page import="DBControl.DBEngine" %>
<%@page import="DBControl.QuestionDAO" %>
<%@page import="DBControl.TagDAO" %>

<%
    String head = request.getParameter("qhead");
    String body = request.getParameter("qbody");
    String tags = request.getParameter("qtags");
    
    try {
        DBEngine dbengine = new DBEngine();
        dbengine.establishConnection();
        try {
            Connection con = dbengine.getConnection();
            QuestionDAO questionDAO = new QuestionDAO(con);
            TagDAO tagDAO = new TagDAO(con);
            
            int res = questionDAO.insertQuestion(head, body, "yolo"); // keep dummy username for now
            tagDAO.insertTag(tags);
            if (res > 0) {
                response.sendRedirect("questions.jsp");
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