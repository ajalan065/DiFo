<%-- 
    Document   : login
    Created on : 28 Mar, 2017, 1:09:25 AM
    Author     : ajalan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="constants.DatabaseLogin" %>
<%@page import="constants.Constants" %>

<%
    //String name=request.getParameter("username");
    String email=request.getParameter("email");
    session.setAttribute("user_email", email);
    String password=request.getParameter("password");
    /*session.setAttribute("user_name", name);
    
    session.setAttribute("m_name", mname);
    session.setAttribute("l_name", lname);
    session.setAttribute("user_status", status);*/
    
    try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String url="jdbc:mysql://localhost:3306/" + Constants.DB_NAME;
    try {
        DatabaseLogin connection = new DatabaseLogin();
        Connection con = DriverManager.getConnection(url, connection.getUser(), connection.getPassword());
        
        String login="SELECT * from " + Constants.DB_TABLE_USER + " WHERE email='"+email+"' AND password='"+password+"'";
        PreparedStatement log=con.prepareStatement(login);
        ResultSet result=log.executeQuery();
        
        if(result.next()) {
        String q1="SELECT FName from " + Constants.DB_TABLE_USER + " WHERE email='"+email+"'";
        PreparedStatement ps1=con.prepareStatement(q1);
        
        ResultSet res = ps1.executeQuery();

        if (res.next()) {
            String fname=res.getString("FName");
            	session.setAttribute("f_name", fname);
        }
        
        //for middle name
        String q2="SELECT MName from " + Constants.DB_TABLE_USER + " WHERE email='"+email+"'";
        PreparedStatement ps2=con.prepareStatement(q2);
        
        ResultSet res2 = ps2.executeQuery();

        if (res2.next()) {
            String mname=res2.getString("MName");
            	session.setAttribute("m_name", mname);
        }
        
        //for last name
        String q3="SELECT LName from " + Constants.DB_TABLE_USER + " WHERE email='"+email+"'";
        PreparedStatement ps3=con.prepareStatement(q3);
        
        ResultSet res3 = ps3.executeQuery();

        if (res3.next()) {
            String lname=res3.getString("LName");
            	session.setAttribute("l_name", lname);
        }
        
        // for username
        String q4="SELECT username from " + Constants.DB_TABLE_USER + " WHERE email='"+email+"'";
        PreparedStatement ps4=con.prepareStatement(q4);
        
        ResultSet res4 = ps4.executeQuery();

        if (res4.next()) {
            String name=res4.getString("username");
            	session.setAttribute("user_name", name);
        }
        
        // for status
        String q5="SELECT Status from " + Constants.DB_TABLE_USER + " WHERE email='"+email+"'";
        PreparedStatement ps5=con.prepareStatement(q5);
        
        ResultSet res5 = ps5.executeQuery();

        if (res5.next()) {
            String status=res5.getString("Status");
            	session.setAttribute("user_status", status);
                
        }
        out.println("<script type=\"text/javascript\">");
        out.println("location='chat.jsp';");
        out.println("</script>");
        }
        else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid credentials!!');");
            out.println("location='index.jsp';");
            out.println("</script>");
                        
        }
            
    }
    catch(Exception ex) {
        ex.printStackTrace();    
    }

    }
    catch(Exception e) {
        e.printStackTrace();
        out.println("Could not connect");
    }
    
    
%>
