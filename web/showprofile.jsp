<%-- 
    Document   : showprofile
    Created on : 1 Apr, 2017, 11:08:01 AM
    Author     : srijit
--%>

<%@page import="java.lang.String"%>
<%@page import="model.User"%>
<%@page import="DBControl.UserDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBControl.DBEngine"%>
<%@page import="constants.Constants" %>
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
            //String bio = null;
            String text = "Logout";
            String picture=null;
            String gender=null;
            String filepath=(String)session.getAttribute("file_path");
            User user = null;
            try {            
                if (param.equals("me")) {
                    name=(String)session.getAttribute("user_name");
                    email=(String)session.getAttribute("user_email");
                    fname=(String)session.getAttribute("f_name");
                    mname=(String)session.getAttribute("m_name");
                    lname=(String)session.getAttribute("l_name");
                    status=(String)session.getAttribute("user_status");
                    picture=(String)session.getAttribute("user_picture");
                    gender=(String)session.getAttribute("user_gender");
                    
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
                           out.println(Constants.DATABASE_CONN_ERR);
                        }
                        dbengine.closeConnection();
                    } catch(Exception e) {
                        e.printStackTrace();
                        out.println(Constants.DATABASE_CONN_ERR);
                        
                    }

                    if(user != null) {
                        fname = user.getFName();
                        mname = user.getMName();
                        lname = user.getLName();
                        status = user.getStatus();
                        //email = user.getEmail();
                        picture = user.getPicture();
                        gender = user.getGender();
                    }
                }
            } catch(Exception e) {
                e.printStackTrace();
                out.println(Constants.NOT_FOUND_ERR);
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
        
            <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title"><%out.println(name);%></h3>
            </div>
            <div class="panel-body">
              <div class="row">
                  <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="<%out.println(filepath+picture);%>" class="img-circle img-responsive" style="width: 7em; height: 7em;"> </div>
                
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>First Name:</td>
                        <td><%out.println(fname);%></td>
                      </tr>
                      <tr>
                        <td>Middle Name:</td>
                        <td><%out.println(mname);%></td>
                      </tr>
                      <tr>
                        <td>Last Name:</td>
                        <td><%out.println(lname);%></td>
                      </tr>
                      
                      <tr>
                        <td>Status</td>
                        <td><%out.println(status);%></td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>Gender</td>
                        <td><%out.println(gender);%></td>
                      </tr>
                    </tbody>
                  </table>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
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
        };
        
    </script>
   
</html>
