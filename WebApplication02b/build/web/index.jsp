<%-- 
    Document   : index
    Created on : May 16, 2025, 8:19:27 AM
    Author     : GIA MINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/style.css">

    </head>
    <body>
        <h1>HTML Form</h1>
        <form action="index.html">
            Textbox <input type="text" name="txtText" value="" size="5" /><br/>
            Password <input type="password" name="txtPassword" value=""/><br/>
            Hidden <input type="hidden" name="txtHidden" value="" /><br/>
            Male <input type="checkbox" name="chkCheck" value="ON" checked="checked" /><br      />     
            Status
            Status:
            <input type="radio" name="rdostatus" value="Single" checked="checked" /> Single
            <input type="radio" name="rdostatus" value="Married" /> Married
            <input type="radio" name="rdostatus" value="Divorsed" /> Divorsed <br/>

            ComboBox <select name="txtCombo">
                <option value="Servlet">JSP and Servlet </option>
                <option value="Servlet">EJB </option>
            </select><br/>
            Multiple <select name="txtList" multiple="multiple" size="3">
                <option value="Servlet" selected>JSP and Servlet </option>
                <option value="Servlet" selected>ẸJB </option>
                <option value="Servlet" selected>Core Java </option>
            </select><br/>
            TextArea <textarea name="txtArea" rows="4" cols="20">
                  This is form parameters demo!!!!
            </textarea><br/>
            <input type="submit" name="txtB" />
            <input type="submit" value="Register" name="action"/>
            <input type="reset" name="txtB"/>
            <input type="reset" value="JavaScrip" name="txtB" onclick=""/>
        </form>
    </body>
</html>
