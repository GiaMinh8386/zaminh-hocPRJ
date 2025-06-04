<%-- 
    Document   : login
    Created on : May 23, 2025, 7:24:30 AM
    Author     : GIA MINH
--%>

<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap 5 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <!-- FontAwesome for show/hide password icon -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
        
        
        
         <style>
            body {
                margin: 0;
                padding: 0;
                background: url('https://img.freepik.com/free-photo/japan-fantasy-landscape_23-2151870150.jpg?semt=ais_hybrid&w=740') no-repeat center center fixed;
                background-size: cover;
                font-family: Arial, sans-serif;
            }
            body::before {
                content: "";
                position: fixed;
                top: 0; left: 0; right: 0; bottom: 0;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 0;
            }
            .container {
                position: relative;
                z-index: 1;
            }
            .login-box {
                background: rgba(255, 255, 255, 0.15);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 30px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                color: #fff;
            }
        </style>
    </head>
    <body>

        <%
            Object objUser = session.getAttribute("user");
            UserDTO user = (objUser != null) ? (UserDTO) objUser : null;
            if (user != null) {
                response.sendRedirect("welcome.jsp");
            } else {
        %>
        <body class="d-flex align-items-center" style="min-height: 100vh;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="login-box">
                        <h3 class="card-title text-center mb-4">Login</h3>
                        <form action="MainController" method="post">
                            <input type="hidden" name="action" value="login" />
                            <div class="mb-3">
                                <label for="txtUsername" class="form-label">Username</label>
                                <input type="text" class="form-control" id="txtUsername" name="strUsername" required />
                            </div>
                            <div class="mb-3">
                                <label for="txtPassword" class="form-label">Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control" id="txtPassword" name="strPassword" required />
                                    <span class="input-group-text" onclick="togglePassword()">
                                        <i id="toggleIcon" class="fa fa-eye"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <button type="submit" class="btn btn-primary">Login</button>
                               
                            </div>
                        </form>
                            </div>
                    </div>
                </div>
            </div>
         <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Script Show/Hide password -->
        <script>
            function togglePassword() {
                const pw = document.getElementById('txtPassword');
                const icon = document.getElementById('toggleIcon');
                if (pw.type === "password") {
                    pw.type = "text";
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    pw.type = "password";
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            }
        </script>
                     
        <%
            Object objMessage = request.getAttribute("message");
            String message = (objMessage == null) ? "" : (objMessage + "");
        %>
        <span style="color: red"><%=message%></span>
        <%
            }
        %>
    </body>
</html>