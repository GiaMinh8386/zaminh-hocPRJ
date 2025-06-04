/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ReviewDAO;
import model.ReviewDTO;
import model.ServiceDAO;
import model.ServiceDTO;

/**
 *
 * @author ADMIN
 */
public class ReviewServiceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReviewServiceController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReviewServiceController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          ServiceDAO serviceDAO = new ServiceDAO();
            HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        List<ServiceDTO> services = serviceDAO.getServiceCompletedByUserId(userID);
        
        // Set the services list as a request attribute
        request.setAttribute("services", services);
        
        // Forward the request to bookAppointment.jsp to display the list of services
        request.getRequestDispatcher("reviewService.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rating = request.getParameter("rating");
        String comments = request.getParameter("comments");
        String serviceID = request.getParameter("serviceID");
        
         HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");
        ReviewDAO dao = new ReviewDAO();
        String reviewId = UUID.randomUUID().toString();
        
        ReviewDTO review = new ReviewDTO();
        review.setReviewID(reviewId);
        review.setUserID(userID);
        review.setServiceID(serviceID);
        review.setRating(Integer.parseInt(rating));
        review.setComments(comments);
        
        boolean isCreated = dao.createReview(review);
        if (isCreated) {
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("error", "Failed to book the appointment. Please try again.");
            doGet(request, response);  // Show the service list again if there is an error
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
