<%-- 
    Document   : chat
    Created on : 29 Mar, 2017, 11:03:31 AM
    Author     : arka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="constants.DatabaseLogin" %>
<%@page import="constants.Constants" %>
<%@page import="DBControl.DBEngine" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
        </style>
        <script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script src="js/modernizr.js"></script>
        
    </head>

    <body>
                    <%
                        try {
                            DBEngine dbengine = new DBEngine();
                            dbengine.establishConnection();
                            try {
                                Connection con = dbengine.getConnection();
                                String query="SELECT * from "+Constants.DB_TABLE_CHAT;
                                PreparedStatement s = con.prepareStatement(query);
                                ResultSet rs = s.executeQuery();
                                if (rs.next()) {
                                    while(rs.next()) {
                                    %>
                                    <<%= rs.getTime("timestamp") %>>
                                    <strong><%= rs.getString("username") %></strong>
                                    <%= rs.getString("chat") %>
                                    <br>
                                    <%
                                    }
                                }
                            }
                            catch(Exception ex) {
                                ex.printStackTrace();
                                out.println(Constants.DATABASE_CONN_ERR);
                            }
                        }
                        catch(Exception e) {
                            e.printStackTrace();
                            out.println(Constants.DATABASE_CONN_ERR);
                        }
                    %>
    </body>
</html>
