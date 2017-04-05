<%-- 
    Document   : showprofile
    Created on : 1 Apr, 2017, 11:08:01 AM
    Author     : srijit
--%>

<%@page import="model.User"%>
<%@page import="DBControl.UserDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBControl.DBEngine"%>
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
            String param = request.getParameter("param");
            String name = null;
            String email = null;
            String fname = null, mname = null, lname = null;
            String status = null;
            String bio = null;
            String text = "Logout";
            User user = null;
            
            if (param.equals("me")) {
                name=(String)session.getAttribute("user_name");
                email=(String)session.getAttribute("user_email");
                fname=(String)session.getAttribute("f_name");
                mname=(String)session.getAttribute("m_name");
                lname=(String)session.getAttribute("l_name");
                status=(String)session.getAttribute("user_status");
                if(name==null)
                    text="Login";
                else
                    text="Logout";
            } else if(!param.equalsIgnoreCase("me")){
                name = (String)request.getParameter("param");
                try {
                    DBEngine dbengine = new DBEngine();
                    dbengine.establishConnection();
                    try {
                        Connection con = dbengine.getConnection();
                        UserDAO userDAO = new UserDAO(con);
                        user = userDAO.getUserProfileByUsername(name);
                    } catch(Exception ex) {
                        ex.printStackTrace();
                    }
                    dbengine.closeConnection();
                } catch(Exception e) {
                    e.printStackTrace();
                }
                
                if(user != null) {
                    fname = user.getFName();
                    mname = user.getMName();
                    lname = user.getLName();
                    status = user.getStatus();
                    bio = user.getBio();
                }
            }
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
        
            <p><span style="color:black;font-weight: bold">Username:</span><%out.println(name);%></p><br/>
            <p><span style="color:black;font-weight: bold">First Name:</span><%out.println(fname);%></p><br/>
            <p><span style="color:black;font-weight: bold">Middle Name:</span><%out.println(mname);%></p><br/>
            <p><span style="color:black;font-weight: bold">Last Name:</span><%out.println(lname);%></p><br/>
            <p><span style="color:black;font-weight: bold">Email Address:</span><%out.println(email);%></p><br/>
            <p><span style="color:black;font-weight: bold">Status:</span><%out.println(status);%></p><br/>
        
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
        };
        
    </script>
   
</html>
