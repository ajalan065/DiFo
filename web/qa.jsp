<%-- 
    Document   : qa
    Created on : 3 Apr, 2017, 8:51:54 AM
    Author     : arka
--%>

<%@page import="DBControl.AnswerDAO"%>
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
<%@page import="model.Answer" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Thread | DiFo</title>
        
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
            #question-head {
                font-size: 20px; 
                color: #445668; 
                text-transform: uppercase;
                text-align: center; 
                margin: 0 0 35px 0; 
                text-shadow: 0px 1px 0px #f2f2f2;
            }
            
            #answer-start {
                font-size: 20px; 
                color: #445668; 
                text-align: center; 
                margin: 0 0 35px 0; 
                text-shadow: 0px 1px 0px #f2f2f2;
            }
        </style>
    </head>
    <body>
        
        <div class="my-topnav my-card my-top my-light-grey" id="head">
            <a href="index.jsp" >DiFo</a>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" style="float: right;">
                    <li role="presentation"><a href="index.jsp" aria-controls="home" role="tab" >Home</a></li>
                    <li role="presentation"><a href="questions.jsp" aria-controls="messages" role="tab" >Questions</a></li>
                    <li role="presentation"><a href="chat.jsp" aria-controls="settings" role="tab" >Chat</a></li>
                    <li role="presentation"><a href="users.jsp" aria-controls="profile" role="tab" >Users</a></li>
                    <li role="presentation"><a href="showprofile.jsp" aria-controls="profile" role="tab" >Profile</a></li>
                    <li role="presentation"><a href="aboutus.jsp" aria-controls="profile" role="tab" >About Us</a></li>
                    <li><button onclick="logout();">Logout</button></li>
            </ul>
  	</div>
        
        <%
            Question question = null;
            List<Answer> answers = null;
            try {
                DBEngine dbengine = new DBEngine();
                dbengine.establishConnection();
                try {
                    Connection con = dbengine.getConnection();
                    QuestionDAO questionDAO = new QuestionDAO(con);
                    String param = request.getParameter("param");
                    int id = Integer.parseInt(param);
                    question = questionDAO.getQuestionById(id);
                    session.setAttribute("current_question", id);
                    
                    AnswerDAO answerDAO = new AnswerDAO(con);
                    answers = answerDAO.getAnswersByQid(id);
                } catch(Exception ex) {
                    ex.printStackTrace();
                }
                dbengine.closeConnection();
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
        
        <div id="question-wrapper">
            <div id="question-head">
                <%= question.getHead() %>
            </div>
            
            <div id="question-body">
                <%= question.getBody() %>
            </div>
            
            <div id="username">
                <%= question.getUsername() %>
            </div>
            
            <div id="timestamp">
                <%= question.getTimestamp() %>
            </div>
        </div>
        
        <div id="answer-start"> Answers </div>

        <div id="answers-wrapper">
            <%
                if(answers != null) {
                    for (Answer answer : answers) {
            %>
            <div id="answer" >
                <div id="answer-body"><%= answer.getBody() %></div>
                <div id="answer-username"><%= answer.getUsername() %></div>
                <div id="answer-timestamp"><%= answer.getTimestamp() %></div>
            </div>
            <%
                    }
                }
            %>
              
        </div>   
        
        <div id="write-answer">
            <form name="answer-form" action="addanswer.jsp" method="post">
                <input name="answer-body" type="text" id="answer-body" size="100" />
                <input name="submit_answer" type="submit"  id="submit-answer" value="Answer" />
            </form>
        </div>
    </body>
</html>
