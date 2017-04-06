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
<%@page import="constants.Constants" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
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
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 60px;
        }

	</style>
        <%
            String name=(String)session.getAttribute("user_name");
            String text;
            if(name==null)
                text="Login";
            else
                text="Logout";
        %>
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
        
        <script type="text/javascript">
            function open_thread(id) {
                window.location = "qa.jsp?param=" + id;
            }
            function ask_question(text) {
                if(text==="Logout") {
                    window.location="askquestion.html";
                } else if(text==="Login") {
                    alert('You must Login/Signup to ask question');
                }
            }
        </script>
    </head>
    <body>
        
        <div class="my-topnav my-card my-top my-light-grey" id="head">
            <a href="index.jsp" >DiFo</a>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" style="float: right;">
                    <li role="presentation"><a href="index.jsp" aria-controls="home" role="tab" >Home</a></li>
                    <li role="presentation"><a href="#" aria-controls="messages" role="tab" >Questions</a></li>
                    <li role="presentation"><a href="chatwithus.jsp" aria-controls="settings" role="tab" >Chat</a></li>
                    <li role="presentation"><a href="users.jsp" aria-controls="profile" role="tab" >Users</a></li>
                    <li role="presentation"><a href="showprofile.jsp?param=me" aria-controls="profile" role="tab" >Profile</a></li>
                    <li role="presentation"><a href="aboutus.jsp" aria-controls="profile" role="tab" >About Us</a></li>
                    <li><button onclick="func('<%=text %>');" class="btn btn-block btn-info"><%out.println(text);%></button></li>
            </ul>
  	</div>
        
        <div id="id01" class="modal"> <!-- log in form -->
            <div class="cd-user-modal-container">
            <form class="cd-form" action="login.jsp" method="post">
		<p class="fieldset">
		<label class="image-replace cd-email" for="signin-email">E-mail</label>
                <input name="email" class="full-width has-padding has-border" id="signin-email" type="email" placeholder="E-mail">
		<span class="cd-error-message">Error message here!</span>
		</p>

		<p class="fieldset">
		<label class="image-replace cd-password" for="signin-password">Password</label>
		<input class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="Password" name="password">
		<a href="#0" class="hide-password">Show</a>
		<span class="cd-error-message">Error message here!</span>
		</p>

		<p class="fieldset">
		<input type="checkbox" id="remember-me" checked>
		<label for="remember-me">Remember me</label>
		</p>

                <p class="fieldset">
		<button class="full-width" id="login_form" onclick="login_form_submit()" type="submit">Login</button>
		</p>
            </form>
				
            <p class="cd-form-bottom-message"><a href="#0">Forgot your password?</a></p>
            
            <div id="cd-reset-password"> <!-- reset password form -->
				<p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="reset-email">E-mail</label>
						<input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="Reset password">
					</p>
				</form>

				<p class="cd-form-bottom-message"><a href="#0">Back to log-in</a></p>
			</div> <!-- cd-reset-password -->
			<a href="#0" class="cd-close-form">Close</a>
            </div>            
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
                    out.println(Constants.DATABASE_CONN_ERR);
                }
                dbengine.closeConnection();
            } catch(Exception e) {
                e.printStackTrace();
                out.println(Constants.DATABASE_CONN_ERR);
            }
        %>
        <div id="all-questions">
            <div id="ask-question">
                <button onclick="ask_question('<%=text %>')" >Add Question</button> 
            </div>
            
            <table id="question-table">
                <%
                    if(questions != null) {
                        for (Question question : questions) {
                            int id = question.getId();
                %>
                <tr id="question-tr">
                    <td onclick="open_thread(<%= id %>)"><%= question.getHead() %></td>
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
    <script type="text/javascript">
        function func(text) {
           if(text==="Logout")
                window.location="logout.jsp";
           else if(text==="Login")
                document.getElementById('id01').style.display='block';
        }
        var modal = document.getElementById('id01');
        window.onclick = function(event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }
        
    </script>
</html>
