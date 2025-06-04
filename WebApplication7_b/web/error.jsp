<%-- 
    Document   : error
    Created on : Jun 2, 2025, 5:05:46 PM
    Author     : GIA MINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.String"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String msg = request.getAttribute("message")+""; %>
        <h1><%=msg%></h1>
    </body>
</html>
