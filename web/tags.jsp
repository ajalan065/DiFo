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
        <%@include file="header.jsp" %>
        <%
            String uri = request.getRequestURI();
            String pageName = uri.substring(uri.lastIndexOf("/")+1);
            session.setAttribute("current_loc", pageName);
            List<Tag> tags = null;
            DBEngine dbengine = null;
            Connection con =null;
            try {
                dbengine = new DBEngine();
                dbengine.establishConnection();
                try {
                    con = dbengine.getConnection();
                    TagDAO tagDAO = new TagDAO(con);
                    tags = tagDAO.getTags();
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
        
        <div id="Tags Table">
            <table style="width:100%" border="1">
                <tr>
                    <th>Tag Name</th>
                </tr>
                <% 
                    if(tags!=null){
                        for(Tag tag : tags){              
                %>
                <tr>
                    <td><%= tag.getName() %></td>
                </tr>
                  <% }
            }
            %>
            </table>
        </div>
            
    </body>
</html>

