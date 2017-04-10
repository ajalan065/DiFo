<%-- 
    Document   : addquestion
    Created on : 31 Mar, 2017, 10:17:13 PM
    Author     : arka
--%>

<%@page import="DBControl.QuestionsTagDAO"%>
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
    String username = (String)session.getAttribute("user_name");
    
    try {
        DBEngine dbengine = new DBEngine();
        dbengine.establishConnection();
        try {
            Connection con = dbengine.getConnection();
            QuestionDAO questionDAO = new QuestionDAO(con);
            TagDAO tagDAO = new TagDAO(con);
            
            int res = questionDAO.insertQuestion(head, body, username); 
            if (res > 0) {
                int qid;
                qid = questionDAO.getLastInsertId();
                tagDAO.insertTag(tags, qid);
                
                response.sendRedirect("questions.jsp");
            } else  {
                out.println(Constants.QUES_NOT_POSTED_ERR);
            }
        } catch(Exception ex) {
            ex.printStackTrace();
            out.println(Constants.DATABASE_CONN_ERR);
        }
        dbengine.closeConnection();
    } catch (Exception e) {
        e.printStackTrace();
        out.println(Constants.DATABASE_CONN_ERR);
    }
%>