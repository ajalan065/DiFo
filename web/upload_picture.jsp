<%-- 
    Document   : upload_picture
    Created on : 6 Apr, 2017, 7:50:00 PM
    Author     : ajalan
--%>

<%@page import="java.nio.file.Paths"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="constants.DatabaseLogin" %>
<%@page import="constants.Constants" %>
<%@page import="DBControl.DBEngine" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.io.output.*" %>

<%
    try {
    DBEngine dbengine = new DBEngine();
    dbengine.establishConnection();
    try {
        
        String fileName="";
        FileInputStream fis=null;
        File dir=null;
        Connection con = dbengine.getConnection();
        
        File file=null ;
        ServletContext context = pageContext.getServletContext();
        
        dir = new File("profile_pictures");
        if (!dir.exists()) {
            dir.mkdir();
        }
        else {
        }
        
               String filePath= getServletContext().getRealPath("assets/img/")
                       +File.separator;
        /*String filePath = System.getProperty("user.dir")+File.separator
                +dir+File.separator;*/
        
        // Get the username and current time
        String username=(String)session.getAttribute("user_name");
        long time = System.currentTimeMillis();
        // Verify the content type
        String contentType = request.getContentType();
        if ((contentType.indexOf("multipart/form-data") >= 0)) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // maximum size that will be stored in memory
            // Location to save data that is larger than maxMemSize.
            factory.setRepository(new File(System.getProperty("user.dir")));

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            try{ 
                // Parse the request to get file items.
                List fileItems = upload.parseRequest(request);

                // Process the uploaded file items
                Iterator i = fileItems.iterator();

                while ( i.hasNext () ) {
                    FileItem fi = (FileItem)i.next();
                    if ( !fi.isFormField ()) {
                        fileName = username+"_"+time+"_"+fi.getName();
                        // Write the file
                        if( fileName.lastIndexOf("\\") >= 0 ){
                        
                            file = new File(filePath, fileName) ;
                                      
                            fi.write(file) ;
                        
                        }
                        else{
                        file = new File(filePath, fileName) ;
                        
                            fi.write(file) ;

                        }
                        
                        }
                    }
                }
                catch(Exception ex) {
                System.out.println(ex);
                }
            }
            else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Unable to upload picture!!');");
            out.println("</script>");
            response.sendRedirect("edit_profile.jsp");}
        String email=(String)session.getAttribute("user_email");
        session.setAttribute("user_picture", fileName);
        PreparedStatement ps=con.prepareStatement("UPDATE " + Constants.DB_TABLE_USER + " SET picture=? WHERE username=? AND email=?");
        
        ps.setString(1, fileName);
        ps.setString(2, username);
        ps.setString(3, email);
        //ps.setBlob(5, inputStream);
        
            //out.println();
        int i=0;
        try {
        i = ps.executeUpdate();
        }
        catch(Exception e) {
            
            out.println("error is : " + e.getMessage());
        }
        if (i>0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Your Changes Saved!!');");
            out.println("</script>");
            response.sendRedirect("edit_profile.jsp");
                        

        		//Use JOptions instead to display the above message.
        }
        else {
            out.println(Constants.DATA_NOT_SAVED_ERR);
        }
            
    }
    catch(Exception ex) {
        ex.printStackTrace();
        out.println("m here");
        out.println(Constants.DATABASE_CONN_ERR);
    }

    }
    catch(Exception e) {
        e.printStackTrace();
        out.println(Constants.DATABASE_CONN_ERR);
    }
%>
