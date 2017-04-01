<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="constants.DatabaseLogin" %>
<%@page import="constants.Constants" %>
<%@page import="DBControl.DBEngine" %>

<% 
  try {
    DBEngine dbengine = new DBEngine();
    dbengine.establishConnection();
    try {
        Connection con = dbengine.getConnection();
        
        String name=request.getParameter("username");
        String email=request.getParameter("email");
        String password = request.getParameter("password");
        session.setAttribute("user_email", email);
        session.setAttribute("user_name", name);
        String query = "SELECT * FROM " + Constants.DB_TABLE_USER + " WHERE username='" + name + "' OR email='" + email + "'";
        PreparedStatement s = con.prepareStatement(query);

        ResultSet result = s.executeQuery();
    
        if (result.next()) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Username or email exists');");
            out.println("</script>");
            request.getSession().invalidate();
            out.println("<script type=\"text/javascript\">");
            out.println("location='index.jsp';");
            out.println("</script>");
        }
        else {
            PreparedStatement ps=con.prepareStatement("insert into " + Constants.DB_TABLE_USER + "(username, email, password) values(?,?,?)");
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, password);
                    int i = ps.executeUpdate();

                    if (i>0) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('You are successfully registered');");
                            out.println("</script>");
                            response.sendRedirect("edit_profile.jsp");


                            //Use JOptions instead to display the above message.
                    }
                    else {
                    out.println("Could not register.. Try again!!");
                    }
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