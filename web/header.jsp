<%-- 
    Document   : header.jsp
    Created on : 10 Apr, 2017, 12:12:15 AM
    Author     : ajalan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
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
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script src="js/modernizr.js"></script>
        
        <%
            String isLoggedIn = (String)session.getAttribute("isloggedIn");
            String icon=null;
            if(session == null || session.getAttribute("isloggedIn") == null) {
                icon = "fa fa-user-plus fa-lg";
            }
            else {
                icon= "fa fa-user fa-lg";
            }
            
String usname=(String)session.getAttribute("user_name");
            String text;
            if(usname==null)
                text="Login";
            else
                text="Logout";
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <body>

	<div class="my-topnav my-card my-top my-light-grey" id="head">
            <a href="index.jsp" >DiFo</a>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" style="float: right;">
                    <li role="presentation"><a href="index.jsp" aria-controls="home" role="tab" >Home</a></li>
                    <li role="presentation"><a href="questions.jsp" aria-controls="messages" role="tab" >Questions</a></li>
                    <li role="presentation"><a onclick="seeChat('<%=text %>');" aria-controls="settings" role="tab" >Chat</a></li>
                    <li role="presentation"><a href="users.jsp" aria-controls="profile" role="tab" >Users</a></li>
                    <li role="presentation"><a href="showprofile.jsp?param=me" aria-controls="profile" role="tab" >Profile</a></li>
                    <li role="presentation"><a href="aboutus.jsp" aria-controls="profile" role="tab" >About Us</a></li>
                    <li><a onclick="func('<%=text %>');"><i class="<%out.println(icon);%>" style="color: darkcyan;"></i></a></li>
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


	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript">
            function reg_form_submit() {
              document.getElementById("reg_form").submit();
            } 
            function login_form_submit() {
                  document.getElementById("login_form").submit();
            }
            function check() {
                if (document.getElementById('signup-password-confirm').value==document.getElementById('signup-password').value){
                }
                else {
                    alert("Password do not match");
                    document.getElementById('signup-password-confirm').value='';
                    document.getElementById('signup-password').value='';


                }
            }
            
            function password_check() {
                var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z]) (?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
                var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
                var enoughRegex = new RegExp("(?=.{6,}).*", "g");
                var pwd = document.getElementById("signup-password");
                
                if (pwd.value.length==0) {
                    document.getElementById('check').innerHTML = 'Type Password';
                } else if (false == enoughRegex.test(pwd.value)) {
                    document.getElementById('check').innerHTML = 'More Characters';
                } else if (strongRegex.test(pwd.value)) {
                    document.getElementById('check').innerHTML = '<b><span style="color:green">Strong!</span>';
                } else if (mediumRegex.test(pwd.value)) {
                    document.getElementById('check').innerHTML = '</b><b><span style="color:orange">Medium!</span>';
                } else {
                    document.getElementById('check').innerHTML = '</b><b><span style="color:red">Weak!</span>';
                }
            }
            
            function func(text) {
           if(text==="Logout")
                window.location="logout.jsp";
           else if(text==="Login")
                document.getElementById('id01').style.display='block';
        }
        
        function seeChat(text) {
            if(text==="Logout")
                window.location="chatwithus.jsp";
           else if(text==="Login") {
               alert('You must login to continue..');
                document.getElementById('id01').style.display='block';
            }
        }
        var modal = document.getElementById('id01');
        window.onclick = function(event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }
            
    
        </script>
</body>
    </body>
</html>
