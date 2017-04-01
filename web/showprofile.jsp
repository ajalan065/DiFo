<%-- 
    Document   : showprofile
    Created on : 1 Apr, 2017, 11:08:01 AM
    Author     : srijit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
        <title>Profile Page</title>
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
        <%
            String name=(String)session.getAttribute("user_name");
            String email=(String)session.getAttribute("user_email");
            String fname=(String)session.getAttribute("f_name");
            String mname=(String)session.getAttribute("m_name");
            String lname=(String)session.getAttribute("l_name");
            String status=(String)session.getAttribute("user_status");
        %>
    </head>
    <body>
        <div class="my-topnav my-card my-top my-light-grey" id="head">
    	<a href="index.jsp" >DiFo</a>
    	<!-- Nav tabs -->
    	<ul class="nav nav-tabs" role="tablist" style="float: right;">
      		<li role="presentation"><a href="index.jsp" aria-controls="home" role="tab" >Home</a></li>
      		<li role="presentation"><a href="questions.jsp" aria-controls="messages" role="tab" >Questions</a></li>
      		<li role="presentation"><a href="chat.jsp" aria-controls="settings" role="tab" >Chat</a></li>
                <li><button class="btn btn-block btn-info" onclick="logout();">Logout</button></li>
    	</ul>
  	</div>
        
            <p><span style="color:black;font-weight: bold">Username:</span><%out.println(name);%></p><br/>
            <p><span style="color:black;font-weight: bold">First Name:</span><%out.println(fname);%></p><br/>
            <p><span style="color:black;font-weight: bold">Middle Name:</span><%out.println(mname);%></p><br/>
            <p><span style="color:black;font-weight: bold">Last Name:</span><%out.println(lname);%></p><br/>
            <p><span style="color:black;font-weight: bold">Email Address:</span><%out.println(email);%></p><br/>
            <p><span style="color:black;font-weight: bold">Status:</span><%out.println(status);%></p><br/>
        
    </body>
    <script type="text/javascript">
        function logout() {
            window.location="logout.jsp";
        }
    </script>
</html>
