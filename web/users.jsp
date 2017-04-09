<%-- 
    Document   : users
    Created on : 5 Apr, 2017, 1:30:02 PM
    Author     : arka
--%>

<%@page import="DBControl.UserDAO"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.Part" %>
<%@page import="java.io.*" %>
<%@page import="DBControl.DBEngine" %>
<%@page import="constants.Constants" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Users | DiFo</title>
        
        <style type="text/css">
    	<%@include file="assets/bootstrap/css/bootstrap.min.css" %>
    	<%@include file="assets/css/form-elements.css" %>
    	<%@include file="my.css" %>
    	<%@include file="style.css" %>
    	<%@include file="css/style.css" %>
    	<%@include file="css/reset.css" %>
    	<%@include file="font-awesome.min.css" %> 
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 60px;
        }

	</style>
        <script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script src="js/modernizr.js"></script>
        
        <script type="text/javascript" >
            function show_profile(username) {
                window.location = "showprofile.jsp?param=" + username;
            }
        </script>
    </head>
        
    <body>
        <%@include file="header.jsp" %>
            
        <%
            List<User> userProfiles = null;
            try {
                DBEngine dbengine = new DBEngine();
                dbengine.establishConnection();
                try {
                    Connection con = dbengine.getConnection();
                    UserDAO userDAO = new UserDAO(con);
                    userProfiles = userDAO.getUsersProfile();
                } catch (Exception ex) {
                    ex.printStackTrace();
                    out.println(Constants.DATABASE_CONN_ERR+"\n");
                    out.println(ex.getMessage());
                }
            } catch(Exception e) {
                e.printStackTrace();
                out.println(Constants.DATABASE_CONN_ERR);
            }
        %>
        <table id="user-table" >
        <%
            
            if (userProfiles != null) {
                for (User user : userProfiles) {
        %>
        <tr id="user-tr">
            <td onclick="show_profile('<%= user.getUsername()%>')" style="cursor: pointer;"><%= user.getUsername()%></td>
            <td><%= user.getFName()%></td>
            <td><%= user.getMName()%></td>
            <td><%= user.getLName()%></td>
            <td><%= user.getStatus()%></td>
            <td><%= user.getGender()%></td>
        </tr>
        <%
                }
            }
        %>
        </table>
    </body>
</html>
