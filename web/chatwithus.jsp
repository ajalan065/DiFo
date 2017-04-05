<%-- 
    Document   : chatwithus
    Created on : 4 Apr, 2017, 7:18:14 PM
    Author     : ajalan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="constants.DatabaseLogin" %>
<%@page import="constants.Constants" %>
<%@page import="DBControl.DBEngine" %>
<!DOCTYPE html>
<html>
<head>
         <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
        <title>Chat | DiFo</title>
        
        <style type="text/css">
        <%@include file="assets/bootstrap/css/bootstrap.min.css" %>
    	<%@include file="assets/css/form-elements.css" %>
    	<%@include file="my.css" %>
    	<%@include file="style.css" %>
    	<%@include file="css/style.css" %>
        <%@include file="css/chat_style.css" %>
    	<%@include file="css/reset.css" %>
    	<%@include file="font-awesome.min.css" %>
        </style>
        <script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script src="js/modernizr.js"></script>
        
        <%
            String name=(String)session.getAttribute("user_name");
            String text;
            if(name==null) {
                name="anonymous";
                text="Login";
            }
            else
                text="Logout";
        %>
        <style type="text/css">
            #ask-question {
                text-align:center;
            }
        </style>
        <script language="javascript" type="text/javascript">

var timeout = setInterval(reloadChat, 1000);    
function reloadChat () {

     $('#chatbox').load('chat.jsp');
}
</script>
      
    </head>
<body>
<div class="my-topnav my-card my-top my-light-grey" id="head">
            <a href="index.jsp" >DiFo</a>
            <!---Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" style="float: right;">
                    <li role="presentation"><a href="index.jsp" aria-controls="home" role="tab" >Home</a></li>
                    <li role="presentation"><a href="questions.jsp" aria-controls="messages" role="tab" >Questions</a></li>
                    <li role="presentation"><a href="chatwithus.jsp" aria-controls="settings" role="tab" >Chat</a></li>
                    <li role="presentation"><a href="users.jsp" aria-controls="profile" role="tab" >Users</a></li>
                    <li role="presentation"><a href="showprofile.jsp?param=me" aria-controls="profile" role="tab" >Profile</a></li>
                    <li role="presentation"><a href="aboutus.jsp" aria-controls="profile" role="tab" >About Us</a></li>
                    <li><button onclick="func('<%=text %>');" class="btn btn-block btn-info"><%out.println(text);%></button></li>
            </ul>
        </div>
            <div id="wrapper">
            <div id="menu">
                <p class="welcome">Welcome, <% out.println(name);%> <b></b></p>
                <!--<p class="logout"><a id="exit" href="logout.jsp">Exit Chat</a></p>-->
                <div style="clear:both"></div>
                
            </div>
                <div id="chatbox">
                    
                </div>
                <script>
$( "#chatbox" ).load( "chat.jsp" );
</script>
                
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
    
        
    <!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>-->
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
<div id="inputs">
<form name="message" action="inputmessage.jsp" method="post">
                <input name="usermsg" type="text" id="usermsg" size="100" />
                <input name="submitmsg" type="submit"  id="submitmsg" value="Send"/>
            </form>
</div>
            </body>
</html>
