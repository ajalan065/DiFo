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
        .tagline {
            height: 200px;
            width: 400px;

            position: fixed;
            top: 50%;
            left: 50%;
            margin-top: -100px;
            margin-left: -200px;
        }
    </style>
    
    <link rel="stylesheet" href="<%@include file="css/animate.css" %>">
    <%@include file="header.jsp" %>
    <%
        String uri = request.getRequestURI();
        String pageName = uri.substring(uri.lastIndexOf("/")+1);
        session.setAttribute("current_loc", pageName);
    %>
</head>
<body style="background: url('assets/img/talk.png'); background-size: cover;">
    <div class="animated fadeInDown">Make Things Happen</div>
</body>