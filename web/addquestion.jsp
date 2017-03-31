<%-- 
    Document   : addquestion
    Created on : 31 Mar, 2017, 10:17:13 PM
    Author     : arka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ask Question | DiFo</title>
        
        <style type="text/css">
            body {
            font:12px arial;
            color: #222;
            text-align:center;
            padding:35px; }
            
            form {
                margin: 0;
                padding: 0;
            }
            
            input { font:12px arial; }
            
        </style>
    </head>
    <body>
        <h1>Ask a Question!</h1>
        
        <div id="ask-question">
            
            <form name="question" action="SaveQuestion.java" method="post">
                <input name="qhead" type="text" id="qhead" value="Enter Question" onfocus="if (this.value == 'Enter Question') this.value=''" size="500" />
                <input name="qbody" type="text" id="qbody" value="Description (Optional)" onfocus="if (this.value == 'Description (Optional)') this.value=''" size="1000" />
                <input name="qtags" type="text" id="qtags" value="Enter tags (Optional)" onfocus="if (this.value == 'Enter tags (Optional)') this.value=''" size="1000" />
                <input name="submitques" type="submit"  id="submitques" value="Submit" />
            </form>
            
        </div>
    </body>
</html>
