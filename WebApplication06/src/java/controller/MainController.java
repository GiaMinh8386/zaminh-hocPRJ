package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.UserDAO;
import model.UserDTO;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String WELCOME_PAGE = "welcome.jsp";
    private static final String ADMIN_CONTROLLER = "AdminController";

    private boolean isUserAction(String action) {
        return "register".equals(action)
                || "updateProfile".equals(action)
                || "viewProfile".equals(action)
                || "changePassword".equals(action);
    }

    private boolean isProductAction(String action) {
        return "listProducts".equals(action)
                || "addProduct".equals(action)
                || "updateProduct".equals(action)
                || "deleteProduct".equals(action)
                || "searchProduct".equals(action);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;

        try {
            String action = request.getParameter("action");

            if ("login".equals(action)) {
                String userID = request.getParameter("userID");
                String password = request.getParameter("password");

                UserDAO dao = new UserDAO();
                boolean isValid = dao.login(userID, password);

                if (isValid) {
                    UserDTO user = dao.getUserById(userID);
                    HttpSession session = request.getSession();
                    session.setAttribute("LOGIN_USER", user);

                    if ("AD".equals(user.getRoleID())) {
                        url = ADMIN_CONTROLLER; // chuyển tới AdminController
                    } else {
                        url = WELCOME_PAGE; // chuyển tới welcome.jsp cho user thường
                    }
                } else {
                    request.setAttribute("ERROR", "Tên đăng nhập hoặc mật khẩu không đúng hoặc tài khoản bị khóa!");
                    url = LOGIN_PAGE;
                }
            } else if ("logout".equals(action)) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                url = LOGIN_PAGE;
            } else if (isUserAction(action)) {
                url = "/UserController";
            } else if (isProductAction(action)) {
                url = "/ProductController";
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Lỗi hệ thống!");
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "MainController handles login logic and redirects to Admin or Welcome.";
    }
}
