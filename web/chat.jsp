<%-- 
    Document   : chat
    Created on : 29 Mar, 2017, 11:03:31 AM
    Author     : arka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Chat | DiFo</title>
        <style type="text/css">
            body {
            font:12px arial;
            color: #222;
            text-align:center;
            padding:35px; }

        form, p, span {
            margin:0;
            padding:0; }

        input { font:12px arial; }

        a {
            color:#0000FF;
            text-decoration:none; }

            a:hover { text-decoration:underline; }

        #wrapper, #loginform {
            margin:0 auto;
            background:#EBF4FB;
            width:95%;
            height: 90%;
            position: absolute;
            overflow: hidden;
            border:1px solid #ACD8F0; }

        #loginform { padding-top:18px; }

            #loginform p { margin: 5px; }

        #chatbox {
            text-align:left;
            margin:0 auto;
            margin-bottom:25px;
            /*padding:10px;*/
            background:#fff;
            height:80%;
            width:98%;
            border:1px solid #ACD8F0;
            overflow:auto; }

        #usermsg {
            width:90%;
            border:1px solid #ACD8F0; }

        #submit { width: 60px; }

        .error { color: #ff0000; }

        #menu { padding:12.5px 25px 12.5px 25px; }

        .welcome { float:left; }

        .logout { float:right; }

        .msgln { margin:0 0 2px 0; }
        </style>
        <%
            String name=(String)session.getAttribute("user_name");
        %>
    </head>

    <body>

        <div id="wrapper">
            <div id="menu">
                <p class="welcome">Welcome, <% out.println(name);%> <b></b></p>
                <p class="home"><a id="home" href="index.jsp">Return to Home</a></p>
                <p class="logout"><a id="exit" href="logout.jsp">Exit chat & Logout</a></p>
                <div style="clear:both"></div>
            </div>

            <div id="chatbox"></div>

            <form name="message" action="SaveMessage.java" method="post">
                <input name="usermsg" type="text" id="usermsg" size="100" />
                <input name="submitmsg" type="submit"  id="submitmsg" value="Send" />
            </form>
        </div>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
    </body>
</html>
