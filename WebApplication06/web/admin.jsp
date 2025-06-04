
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang quản trị</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f9f9f9;
        }
        header {
            background-color: #343a40;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h2 {
            margin: 0;
        }
        .logout-button {
            background-color: #dc3545;
            color: white;
            padding: 8px 15px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .logout-button:hover {
            background-color: #c82333;
        }
        main {
            padding: 20px;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: white;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <h2>Xin chào, Admin</h2>
        <a class="logout-button" href="MainController?action=logout">Đăng xuất</a>
    </header>
    <main>
        <h3 style="text-align:center;">Danh sách người dùng</h3>
        <table>
            <tr>
                <th>UserID</th>
                <th>Họ tên</th>
                <th>Password</th>
                <th>RoleID</th>
                <th>Trạng thái</th>
            </tr>
            <%
                List<UserDTO> list = (List<UserDTO>) request.getAttribute("userList");
                if (list != null && !list.isEmpty()) {
                    for (UserDTO user : list) {
            %>
            <tr>
                <td><%= user.getUserID() %></td>
                <td><%= user.getFullname() %></td>
                <td><%= user.getPassword() %></td>
                <td><%= user.getRoleID() %></td>
                <td><%= user.isStatus() ? "Hoạt động" : "Bị khóa" %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5">Không có người dùng nào</td>
            </tr>
            <%
                }
            %>
        </table>
    </main>
</body>
</html>
