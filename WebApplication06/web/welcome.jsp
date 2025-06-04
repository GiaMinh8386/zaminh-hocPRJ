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
            Object objUser = session.getAttribute("user");
            UserDTO user = (objUser != null) ? (UserDTO) objUser : null;
            if(user==null){
                response.sendRedirect("MainController");
            }else{
        %>
                <h1>Welcome <%=user.getFullname()%> !</h1>
                <a href="MainController?action=logout">Logout</a>
              
               
        <%
            }
        %>
    </body>
</html>
