<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>

<% 
  try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    out.println("Connected");
    String url="jdbc:mysql://localhost:3306/Users";
    try {
    Connection con = DriverManager.getConnection(url, "root", "ajalan065");
    String name=request.getParameter("username");
    String email=request.getParameter("email");
    String password = request.getParameter("password");
    out.println(name+" "+email+" "+password);
    PreparedStatement ps=con.prepareStatement("insert into Users values(?,?,?)");
        	ps.setString(1, name);
        	ps.setString(2, email);
        	ps.setString(3, password);
        	int i = ps.executeUpdate();

        	if (i>0) {
        		out.println("You are successfully registered");

        		//Use JOptions instead to display the above message.
        	}
        	else {
        	out.println("Could not register");
        	}
    }
    catch(Exception ex) {
        ex.printStackTrace();
        
    }

  }
  catch(Exception e)
  {
      e.printStackTrace();
      out.println("Could not connect");
  }
%>