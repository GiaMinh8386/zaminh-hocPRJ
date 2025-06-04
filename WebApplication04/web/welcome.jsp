<%-- 
    Document   : welcome
    Created on : May 23, 2025, 7:49:21 AM
    Author     : GIA MINH
--%>

<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO)request.getAttribute("user");  
            %>
            
             <h1>Welcome <%=user.getFullname()%> !</h1>
    </body>
</html>
