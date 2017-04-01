<%-- 
    Document   : questions
    Created on : 30 Mar, 2017, 3:31:52 PM
    Author     : arka
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.Part" %>
<%@page import="java.io.*" %>
<%@page import="DBControl.DBEngine" %>
<%@page import="DBControl.QuestionDAO" %>
<%@page import="model.Question" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Questions | DiFo</title>
        
        <style type="text/css">
    	<%@include file="assets/bootstrap/css/bootstrap.min.css" %>
    	<%@include file="assets/css/form-elements.css" %>
    	<%@include file="my.css" %>
    	<%@include file="style.css" %>
    	<%@include file="css/style.css" %>
    	<%@include file="css/reset.css" %>
    	<%@include file="font-awesome.min.css" %>        
	</style>

        <script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script src="js/modernizr.js"></script>
        
        <style type="text/css">
            #ask-question {
                text-align:center;
            }
        </style>
    </head>
    <body>
        
        <div class="my-topnav my-card my-top my-light-grey" id="head">
            <a href="index.jsp" >DiFo</a>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" style="float: right;">
                    <li role="presentation"><a href="index.jsp" aria-controls="home" role="tab" >Home</a></li>
                    <li role="presentation"><a href="#" aria-controls="messages" role="tab" >Questions</a></li>
                    <li role="presentation"><a href="chat.jsp" aria-controls="settings" role="tab" >Chat</a></li>
                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" >Users</a></li>
                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" >Profile</a></li>
                    <li role="presentation"><a href="aboutus.jsp" aria-controls="profile" role="tab" >About Us</a></li>
                    <li><button onclick="logout();">Logout</button></li>
            </ul>
  	</div>
        
        <%
            List<Question> questions = null;
            try {
                DBEngine dbengine = new DBEngine();
                dbengine.establishConnection();
                try {
                    Connection con = dbengine.getConnection();
                    QuestionDAO questionDAO = new QuestionDAO(con);
                    questions = questionDAO.getQuestions();
                } catch(Exception ex) {
                    ex.printStackTrace();
                }
                dbengine.closeConnection();
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
        <div id="all-questions">
            <div id="ask-question">
                <a href="askquestion.html" >Add Question</a>
            </div>
            
            <table id="question-table">
                <%
                    if(questions != null) {
                        for (Question question : questions) {
                %>
                <tr>
                    <td><%= question.getHead() %></td>
                    <td><%= question.getBody() %></td>
                    <td><%= question.getUsername() %></td>
                    <td><%= question.getTimestamp() %></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
    </body>
</html>
