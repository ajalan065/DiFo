<%@page import="java.io.File"%>
<%@page import="java.nio.file.Paths"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
	<title>
		Discussion Forum
	</title>
    <%@include file="header.jsp" %>
    <%
        String session_filePath= Paths.get("assets/img")+File.separator;
        session.setAttribute("file_path", session_filePath);
        String uri = request.getRequestURI();
            String pageName = uri.substring(uri.lastIndexOf("/")+1);
            session.setAttribute("current_loc", pageName);
    %>
</head>
<body>
    
</body>