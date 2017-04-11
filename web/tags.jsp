<%-- 
    Document   : tags
    Created on : Apr 11, 2017, 10:31:10 PM
    Author     : anubhav
--%>

<%@page import="model.User"%>
<%@page import="DBControl.UserDAO"%>
<%@page import="DBControl.QuestionsTagDAO"%>
<%@page import="model.Tag"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.Part" %>
<%@page import="java.io.*" %>
<%@page import="DBControl.DBEngine" %>
<%@page import="DBControl.QuestionDAO" %>
<%@page import="DBControl.TagDAO" %>
<%@page import="model.Question" %>
<%@page import="constants.Constants" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tags | DiFo</title>
    </head>
    <body>
        <%
            List<Tag> tags2 = null;
            DBEngine dbengine2 = null;
            Connection con2 =null;
            try {
                dbengine2 = new DBEngine();
                dbengine2.establishConnection();
                try {
                    con2 = dbengine2.getConnection();
                    TagDAO tagDAO = new TagDAO(con2);
                    tags2 = tagDAO.getTags();
                } catch(Exception ex) {
                    ex.printStackTrace();
                    out.println(Constants.DATABASE_CONN_ERR);
                }
//                dbengine.closeConnection();
            } catch(Exception e) {
                e.printStackTrace();
                out.println(Constants.DATABASE_CONN_ERR);
            }
        %>
        
        
            
        
            <script>
               
            </script>
    </body>
</html>

