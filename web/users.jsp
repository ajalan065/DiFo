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
            
String uri = request.getRequestURI();
            String pageName = uri.substring(uri.lastIndexOf("/")+1);
            session.setAttribute("current_loc", pageName);
        %>
        <table id="user-table" >
            <tr id="user-tr">
                <td>First Name</td>
                <td>Middle Name</td>
                <td>Last Name</td>
                <td>Status</td>
                <td>Gender</td>   
            </tr>
        <%
            
            if (userProfiles != null) {
                for (User user : userProfiles) {
                    String fname=null, mname=null, lname=null, status=null, gender=null;
                    if (user.getFName()==null) {
                        fname="";
                    }
                    else fname=user.getFName();
                    
                    if (user.getMName() == null) {
                        mname="";
                    }
                    else mname=user.getMName();
                    
                    if (user.getLName() == null) {
                        lname="";
                    }
                    else lname=user.getLName();
                    
                    if (user.getStatus() == null) {
                        status="";
                    }
                    else status=user.getStatus();
                    
                    if (user.getGender()  == null) {
                        gender="";
                    }
                    else gender=user.getGender();
        %>
        <tr id="user-tr">
            <td onclick="show_profile('<%= user.getUsername()%>')" style="cursor: pointer;"><%= user.getUsername()%></td>
            <td><%= fname%></td>
            <td><%= mname%></td>
            <td><%= lname%></td>
            <td><%= status%></td>
            <td><%= gender%></td>
        </tr>
        <%
                }
            }
        %>
        </table>
    </body>
</html>
