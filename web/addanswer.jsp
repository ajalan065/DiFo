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
    try {
        String body = request.getParameter("answer-body");
        int id = (Integer)session.getAttribute("current_question");
        String username = (String)session.getAttribute("user_name");

        try {
            DBEngine dbengine = new DBEngine();
            dbengine.establishConnection();
            try {
                Connection con = dbengine.getConnection();
                AnswerDAO answerDAO = new AnswerDAO(con);

                int res = answerDAO.insertAnswer(body, username, id);
                if (res > 0) {
                    response.sendRedirect("qa.jsp?param=" + id);
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
    } catch(Exception e) {
        e.printStackTrace();
        out.println(Constants.NOT_FOUND_ERR);
    }
%>