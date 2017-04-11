<%-- 
    Document   : users
    Created on : 5 Apr, 2017, 1:30:02 PM
    Author     : arka
--%>

<%@page import="java.awt.Toolkit"%>
<%@page import="java.awt.Dimension"%>
<%@page import="java.util.ArrayList"%>
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
            function init() {
                var screenWidth = screen.width;
            }
        </script>
        
        <style type="text/css">
            .users-page #user-browser, .users-page #user-browser table {
                width: 100%;
            }
            .users-page #user-browser {
                margin-top: -15px;
            }
            
            #user_pic {
                border-radius: 50%;
                width: 4em;
                height: 4em;
            }
        </style>
    </head>
        
    <body onload="init()"  style="background: url('assets/img/talk2.png'); background-size: cover;">
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
            
//            Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
//            out.println("width=" + screenSize.getWidth());
            
            List<List<User>> userRows = null;
            if(userProfiles != null) {
                userRows = new ArrayList<List<User>>();
                List<User> row = new ArrayList<User>();
                int count = 0;
                for (User user : userProfiles) {
                    if(count%4 == 0 && count != 0) {
                        userRows.add(row);
                        row = null;
                        row = new ArrayList<User>();
                    }
                    row.add(user);
                    count++;
                }
                if(row != null) {
                    userRows.add(row);
                }
            }
            %>
            <div id="user-browser">
            <table>
                <tbody>
            <%
            if (userRows != null) {
                for(int i=0;i<userRows.size();i++) {
                    out.println("<tr>");
                    for(int j=0;j<userRows.get(i).size();j++) {
                        User user = userRows.get(i).get(j);
                        String picture = user.getPicture();
        %>
        <td style="padding-left: 9em; padding-top: 2em;">
            <div class="user-info  user-hover">
                <div class="user-gravatar48">
                    <a><div class="gravatar-wrapper-48"><img src="<%out.println((String)session.getAttribute("file_path") + picture);%>" alt="user_pic" id="user_pic"></div></a>
                </div>
                <div class="user-details">
                    <a onclick="show_profile('<%= user.getUsername()%>');" ><%= user.getUsername()%></a>
                    
                </div>
                
            </div>
        </td>
        <%
                    }
                    out.println("</tr>");
                }
            }
        %>
        </tbody></table>
            </div>
    </body>
</html>
