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
        <%@include file="header.jsp" %>
        </style>
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
        <script language="javascript" type="text/javascript">

            var timeout = setInterval(reloadChat, 1000);    
            function reloadChat () {

                 $('#chatbox').load('chat.jsp');

            }
            function init() {
                var objDiv = document.getElementById("chatbox");
                objDiv.scrollTop = objDiv.scrollHeight;
            }
        </script>
<%
    String name = (String)session.getAttribute("user_name");
    String uri = request.getRequestURI();
            String pageName = uri.substring(uri.lastIndexOf("/")+1);
            session.setAttribute("current_loc", pageName);
    %>
      
    </head>
<body onload="init()">
    
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
   
        
<div id="inputs">
<form name="message" action="inputmessage.jsp" method="post">
                <input name="usermsg" type="text" id="usermsg" size="100" />
                <input name="submitmsg" type="submit"  id="submitmsg" value="Send"/>
            </form>
</div>
            </div>
            </body>
</html>
