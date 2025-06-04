/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AppointmentDAO;
import model.AppointmentDTO;
import model.ServiceDAO;
import model.ServiceDTO;

/**
 *
 * @author ADMIN
 */
public class BookAppointmentController extends HttpServlet {

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
            out.println("<title>Servlet BookAppointmentController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookAppointmentController at " + request.getContextPath() + "</h1>");
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
        List<ServiceDTO> services = serviceDAO.getAllServices();
        
        // Set the services list as a request attribute
        request.setAttribute("services", services);
        
        // Forward the request to bookAppointment.jsp to display the list of services
        request.getRequestDispatcher("bookAppointment.jsp").forward(request, response);
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
       // Retrieve the form parameters
        String serviceID = request.getParameter("serviceID");
        String appointmentDateStr = request.getParameter("appointmentDate");

        // Get the current user ID from the session
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("userID");

        // Convert the appointmentDateStr to a Timestamp
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        Timestamp appointmentDate = null;
        try {
            appointmentDate = new Timestamp(dateFormat.parse(appointmentDateStr).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid date format. Please select a valid appointment date.");
            doGet(request, response);
            return;
        }
         String appointmentId = UUID.randomUUID().toString();
        // Create a new appointment object
        AppointmentDTO appointment = new AppointmentDTO(appointmentId, userID, serviceID, appointmentDate, "Pending", "staff1");

        // Call the DAO to save the appointment
        AppointmentDAO appointmentDAO = new AppointmentDAO();
        boolean isCreated = appointmentDAO.createAppointment(appointment);

        // Redirect or forward based on success/failure
        if (isCreated) {
            response.sendRedirect("ViewAppointmentsController");
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
