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
<%@page import="constants.Constants" %>

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
                color: #445668; 
                margin: 0 0 35px 0; 
                text-shadow: 0px 1px 0px #f2f2f2;
            }
            
            #question-head  {
                display: inline-block;
                
    text-align: justify;
                font-size: xx-large;
    font-family: sans-serif;
    font-variant: small-caps;
    font-weight: bolder;
  width: 100%;
  margin: 1em;
            }
            #answer-start {
                font-size: xx-large; 
                color: #445668; 
                text-align: center; 
                margin: 0 0 35px 0; 
                text-shadow: 0px 1px 0px #f2f2f2;
            }
            
            #answer-body {
                    font-size: large;
    font-family: sans-serif;
    font-weight: 400;
    text-align: justify;
            }
            
            #answer-start {
                
            }
        </style>
        
       
        
        <script type="text/javascript" >
            function add_answer(text) {
                if(text==="Logout") {
                    return true;
                } else if(text==="Login") {
                    alert('You must Login/Signup to answer question');
                    return false;
                }
            }
        </script>
    </head>
    <body  style="background: url('assets/img/talk2.png'); background-size: cover; overflow-x: hidden;">
        
        <%@include file="header.jsp" %>
        
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
                    out.println(Constants.DATABASE_CONN_ERR);
                }
                dbengine.closeConnection();
            } catch(Exception e) {
                e.printStackTrace();
                out.println(Constants.DATABASE_CONN_ERR);
            }
        %>
        
        <div id="question-wrapper">
            <div id="question-head">
                <%= question.getHead() %>
            </div>
            
            <div id="question-body" style="padding-left: 2em">
                <%= question.getBody() %>
            </div>
            
            <div id="username" style="float: right; padding-right: 6.5em;">
                <%= question.getUsername() %>
            </div>
            <br>
            
            <div id="timestamp" style="float: right;padding-right: 6.5em;">
                <%= question.getTimestamp() %>
            </div>
        </div>
            <br><br>
        <div id="answer-start"> Answers </div>

        <div id="answers-wrapper">
            <%
                if(answers != null) {
                    for (Answer answer : answers) {
            %>
            <div id="answer" style="display: block; padding: 2em;">
                <div id="answer-body"><%= answer.getBody() %></div>
                <div id="answer-username" style="float: right; display: inline; padding-right: 5em;"><%= answer.getUsername() %></div> 
                <br>
                <div id="answer-timestamp" style="float: right;  padding-right: 5em;"><%= answer.getTimestamp() %></div>
            </div>
            <%
                    }
                }
            %>
              
        </div>   
        
        <div id="write-answer" style="bottom: 0; position: fixed; width: 100%; padding-left: 4em; padding-bottom: 1em;">
            <form name="answer-form" action="addanswer.jsp" onsubmit="return add_answer('<%= text%>')" method="post">
                <input name="answer-body" type="text" id="answer-body" size="100" style="width: 85%;"/>
                <input name="submit_answer" type="submit"  id="submit-answer" value="Answer"  style="width: 5%;"/>
            </form>
        </div>
    </body>
</html>
