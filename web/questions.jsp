<%-- 
    Document   : questions
    Created on : 30 Mar, 2017, 3:31:52 PM
    Author     : arka
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
<%@page import="model.Question" %>
<%@page import="constants.Constants" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Questions | DiFo</title>
        
        <style type="text/css">
    	<%@include file="assets/bootstrap/css/bootstrap.min.css" %>
    	<%@include file="assets/css/form-elements.css" %>
    	<%@include file="my.css" %>
    	<%@include file="style.css" %>
    	<%@include file="css/style.css" %>
    	<%@include file="css/reset.css" %>
    	<%@include file="font-awesome.min.css" %> 
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 60px;
        }

	</style>
        
        
        <script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script src="js/modernizr.js"></script>
        
        <style type="text/css">
            #ask-question {
                text-align:center;
            }
            .summary {
                float: left;
                width: 630px;
            }
            .excerpt {
                padding: 0;
                padding-bottom: 5px;
                margin: 0;
                color: #3b4045;
            }
            .tags {
                line-height: 18px;
                float: left;
            }
            .user-info {
                box-sizing: border-box;
                padding: 5px 6px 7px 7px;
                width: 200px;
                color: #6a737c;
            }
            .user-info .user-gravatar32+.user-details {
                margin-left: 8px;
                width: calc(100% - 40px);
            }
            .user-info .user-details {
                float: left;
                width: 100%;
            }
            .user-details {
                line-height: 17px;
                word-wrap: break-word;
                
            }
            
            #questions {
                clear: both;
                float: left;
                width: 728px;
                margin-bottom: 20px;
                padding: 2em 15em;
            }

            .question-summary {
                padding: 12px 0 10px 0;
                border-bottom: 1px solid #e4e6e8;
                
            }
            .question-summary {
                overflow: hidden;
                padding: 15px 0;
                float: left;
                width: 728px;
                border-bottom: 1px solid #eff0f1;
            }
        </style>
        
        <script type="text/javascript">
            function open_thread(id) {
                window.location = "qa.jsp?param=" + id;
            }
            function ask_question(text) {
                if(text==="Logout") {
                    window.location="askquestion.html";
                } else if(text==="Login") {
                    alert('You must Login/Signup to ask question');
                }
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        

        <%
            String filepath = (String)session.getAttribute("file_path");
            String uri = request.getRequestURI();
            String pageName = uri.substring(uri.lastIndexOf("/")+1);
            session.setAttribute("current_loc", pageName);
            List<Question> questions = null;
            DBEngine dbengine = null;
            Connection con =null;
            try {
                dbengine = new DBEngine();
                dbengine.establishConnection();
                try {
                    con = dbengine.getConnection();
                    QuestionDAO questionDAO = new QuestionDAO(con);
                    questions = questionDAO.getQuestions();
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
       
        <div id="all-questions">
            <div id="ask-question">
                <button onclick="ask_question('<%=text %>')" >Add Question</button> 
            </div>
        </div>
        <div id="questions">
            <%
                if(questions != null) {
                    for (Question question : questions) {
                        int id = question.getId();
            %>

            <div class="question-summary">

                <div class="summary">
                    <h2><a style="font-size: 1.5em;" onclick="open_thread(<%= id %>)" class="question-hyperlink"><%= question.getHead() %></a></h2>
                    <div class="excerpt">
                        <%= question.getBody() %>
                    </div>          
                    <div class="tags t-ruby-on-rails t-config t-ruby-on-rails-5 t-production t-secret-key">
                        <%
                            QuestionsTagDAO questionsTagDAO = new QuestionsTagDAO(con);
                            List<Tag> tags = questionsTagDAO.getTagsByQid(id);
                            for (Tag tag : tags) {
                        %>
                        <a><%= tag.getName() %></a>
                        <%
                            }
                        %>
                    </div>
                    &nbsp;
                    <div class="started fr">
                        <div class="user-info ">
                            <div class="user-action-time">
                                asked by <span class="user-details">
                                <a><%= question.getUsername() %></a> &nbsp; <%= question.getTimestamp() %>
                                </span>
                            </div>
                            <div class="user-gravatar32">
                                <a onclick="" >
                                    <div class="gravatar-wrapper-32">
                                        <%
                                            UserDAO userDAO = new UserDAO(con);
                                            User user  = userDAO.getUserProfileByUsername(question.getUsername());
                                        %>
                                        <img src="<%out.println(filepath+user.getPicture());%>" alt="" width="32" height="32">
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>  
                </div>
            </div>

            <%
                    }
                }
            %>
        </div>
    </body>
</html>
