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
        <title>Edit Profile | DiFo</title>
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
    <body style="overflow-x: hidden;" >
        <%@include file="header.jsp" %>
        <%
            String name=(String)session.getAttribute("user_name");
            String email=(String)session.getAttribute("user_email");
            String fname=(String)session.getAttribute("f_name");
            String mname=(String)session.getAttribute("m_name");
            String lname=(String)session.getAttribute("l_name");
            String status=(String)session.getAttribute("user_status");
            String picture=(String)session.getAttribute("user_picture");
            String filepath=(String)session.getAttribute("file_path");
            String gender=(String)session.getAttribute("user_gender");
            
            String uri = request.getRequestURI();
            String pageName = uri.substring(uri.lastIndexOf("/")+1);
            session.setAttribute("current_loc", pageName);
        %>
        
        <h1 style="font-size: 1.5em; font-weight: bold; padding-left: 1.5em;"><em>Welcome <%out.println(name);%></em>. Edit your profile...</h1>
        <form method="post" action="upload_picture.jsp" enctype="multipart/form-data" id="prof_form" class="cd-form">
            
                <img src="<%out.println(filepath+picture);%>" id="profile_pic"/>
                <br>
                
                <span  style="float:right; width: 15%; right: 3em; top: 23.5em; position: absolute;">
                    <!--<label for="prof_pic">Upload Picture </label>-->
                    <input type="file" name="prof_pic" id="prof_pic" style="display:block; cursor: pointer;"/>
                </span>
                   <!-- <button style="border-radius:50%; float:right;  width: 14em; height: 14em;" name="prof_btn"></button>-->
                <!--<input type="image" src="assets/img/profile.png" name="saveForm" class="" id="profile_pic" />-->
                <!--<button class="btn btn-success" id="submit_pic" style="width:12%;"><img src="assets/img/profile.png" id="profile_pic"/></button>-->
            
        </form>
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
		<label for="signup-email" id="lab">Gender</label>
                <input  type="text" placeholder="<%out.println(gender);%>" name="gender" required style="width: 70%;">
		
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
    
    <!-- Automatically submit profile picture form on image upload -->
    <script type="text/javascript">
            document.getElementById("prof_pic").onchange = function() {
                document.getElementById("prof_form").submit();
            };
    </script>
</html>