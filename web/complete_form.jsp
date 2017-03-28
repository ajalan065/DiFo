<%-- 
    Document   : complete_form
    Created on : 27 Mar, 2017, 3:06:55 PM
    Author     : ajalan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%
    try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String url="jdbc:mysql://localhost:3306/Users";
    try {
        Connection con = DriverManager.getConnection(url, "root", "ajalan065");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String mname=request.getParameter("mname");
        String status=request.getParameter("status");
        //Part filePart = request.getPart("bio");
        session.setAttribute("f_name", fname);
        session.setAttribute("m_name", mname);        
        session.setAttribute("l_name", lname);
        session.setAttribute("user_status", status);
        String name=(String)session.getAttribute("user_name");
        String email=(String)session.getAttribute("user_email");
        //InputStream inputStream=null;
        /*if (filePart!=null) {
            inputStream = filePart.getInputStream();
        }*/
        PreparedStatement ps=con.prepareStatement("UPDATE Users SET FName=?, MName=?, LName=?, Status=? WHERE username=? AND email=?");
        ps.setString(1, fname);
        ps.setString(2, mname);
        ps.setString(3, lname);
        ps.setString(4, status);
        ps.setString(5, name);
        ps.setString(6, email);
        //ps.setBlob(5, inputStream);
        int i = ps.executeUpdate();

        if (i>0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Changes Saved!!');");
            out.println("</script>");
            response.sendRedirect("edit_profile.jsp");
                        

        		//Use JOptions instead to display the above message.
        }
        else {
            out.println("Could not save data.. Try again!!");
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