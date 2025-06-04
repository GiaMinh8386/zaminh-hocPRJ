<%-- 
    Document   : error
    Created on : May 30, 2025, 8:41:07 AM
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
