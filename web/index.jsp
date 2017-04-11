<%@page import="java.io.File"%>
<%@page import="java.nio.file.Paths"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
	<title>
		Discussion Forum
	</title>
    
    <style type="text/css">
        <%@include file="css/animate.css" %>
        #tagline {
            height: 5em;
            width: 20em;
            font-size: -webkit-xxx-large;
            position: fixed;
            top: 40%;
            left: 50%;
            margin-top: -100px;
            margin-left: -200px;
            color: blanchedalmond;
        }
        
        .delay-1 {
            animation-delay: 0.5s;
        }
    </style>
    
    <%@include file="header.jsp" %>
    <%
        String uri = request.getRequestURI();
        String pageName = uri.substring(uri.lastIndexOf("/")+1);
        session.setAttribute("current_loc", pageName);
    %>
</head>
<body style="background: url('assets/img/talk.png'); background-size: cover;">
    <h1 class="animated fadeInDown delay-1" id="tagline">Make Things Happen</h1>
</body>