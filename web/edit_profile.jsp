<%-- 
    Document   : edit_profile
    Created on : 24 Mar, 2017, 10:48:24 PM
    Author     : ajalan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.Part" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
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
            input[type="text"], input[type="email"] {
                border-top: none;
                border-left: none;
                border-right: none;
                border-bottom-color: bisque;
                background: transparent;
            }
            input[type="text"]:focus, input[type="email"]:focus {
                outline: none;
                background: transparent;
            }
            #lab {
                font-size: 1.3em;
                font-weight: bolder;
            }
        </style>
        
    </head>
    <body>
        <%
            String name=(String)session.getAttribute("user_name");
            String email=(String)session.getAttribute("user_email");
            String fname=(String)session.getAttribute("f_name");
            String mname=(String)session.getAttribute("m_name");
            String lname=(String)session.getAttribute("l_name");
            String status=(String)session.getAttribute("user_status");
            
        %>
        <div class="my-topnav my-card my-top my-light-grey" id="head">
    	<a href="#" >Discussion Forum</a>
    	<!-- Nav tabs -->
    	<ul class="nav nav-tabs" role="tablist" style="float: right;">
      		<li role="presentation"><a href="#" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
      		<li role="presentation"><a href="http://oopadai.com/packages.php" aria-controls="messages" role="tab" data-toggle="tab">Questions</a></li>
      		<li role="presentation"><a href="chat.jsp" aria-controls="settings" role="tab" data-toggle="tab">Chat</a></li>
                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Users</a></li>
                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">About Us</a></li>
                <li><button onclick="logout();">Logout</button></li>
    	</ul>
  	</div>
        <h1 style="font-size: 1.5em; font-weight: bold;"><em>Welcome <%out.println(name);%></em>. Edit your profile...</h1>
        <form method="post" action="complete_form.jsp" class="cd-form">
            <p class="fieldset">
		<label for="signup-username" id="lab">Name</label>
		<input type="text" placeholder="<%out.println(fname);%>" name="fname" required size="20">
                <input type="text" placeholder="<%out.println(mname);%>" name="mname" size="20">
                <input type="text" placeholder="<%out.println(lname);%>" name="lname" required size="20">
            </p>
            <br>
            <p class="fieldset">
		<label for="signup-username" id="lab">Username</label>
                <input type="text" placeholder="<%out.println(name);%>" name="username" required style="width: 50%;" disabled>
		
            </p>
            <br>
	    <p class="fieldset">
		<label for="signup-email" id="lab">E-mail</label>
                <input  type="email" placeholder="<%out.println(email);%>" name="email" required style="width: 70%;" disabled>
		
            </p>
            <br>
	    <p class="fieldset">
		<label for="signup-email" id="lab">Status</label>
		<input type="text" placeholder="<%out.println(status);%>" name="status" style="width: 70%;">
		
            </p>
            <br>
            <p class="fieldset">
                <input type="submit" value="Save Changes" id="cd-submit"/>
            </p>
        </form>
    </body>
    <script type="text/javascript">
        function logout() {
            window.location="logout.jsp";
        }
    </script>
</html>