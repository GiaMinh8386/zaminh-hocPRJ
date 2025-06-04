/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UserDAO;
import model.UserDTO;

/**
 *
 * @author GIA MINH
 */

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        UserDTO loginUser = (session != null) ? (UserDTO) session.getAttribute("LOGIN_USER") : null;

        if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
            // Không có quyền truy cập admin
            response.sendRedirect("login.jsp"); // hoặc về home.jsp
            return;
        }

        // Người dùng là Admin → hiển thị danh sách user
        UserDAO dao = new UserDAO();
        List<UserDTO> userList = dao.getAllUser();

        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
        dispatcher.forward(request, response);
    }
}