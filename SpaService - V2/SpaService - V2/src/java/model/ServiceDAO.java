package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class ServiceDAO extends DBUtils {

    public List<ServiceDTO> getAllServices() {
        List<ServiceDTO> services = new ArrayList<>();
        String query = "SELECT * FROM tblServices";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ServiceDTO service = new ServiceDTO(
                        resultSet.getString("serviceID"),
                        resultSet.getString("serviceName"),
                        resultSet.getString("description"),
                        resultSet.getDouble("price")
                );
                services.add(service);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return services;
    }
    
    public List<ServiceDTO> getServiceCompletedByUserId(String userId){
        List<ServiceDTO> services = new ArrayList<>();
        String query = " select s.serviceID, s.serviceName, s.description, s.price from tblServices s join tblAppointments a on s.serviceID = a.serviceID where userID = ? and a.status = 'completed'";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ServiceDTO service = new ServiceDTO(
                        resultSet.getString("serviceID"),
                        resultSet.getString("serviceName"),
                        resultSet.getString("description"),
                        resultSet.getDouble("price")
                );
                services.add(service);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return services;
    }

    public ServiceDTO getServiceById(String serviceID) {
        String query = "SELECT * FROM tblServices WHERE serviceID = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, serviceID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new ServiceDTO(
                        resultSet.getString("serviceID"),
                        resultSet.getString("serviceName"),
                        resultSet.getString("description"),
                        resultSet.getDouble("price")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean createService(ServiceDTO service) {
        String query = "INSERT INTO tblServices (serviceID, serviceName, description, price) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, service.getServiceID());
            statement.setString(2, service.getServiceName());
            statement.setString(3, service.getDescription());
            statement.setDouble(4, service.getPrice());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean updateService(ServiceDTO service) {
        String query = "UPDATE tblServices SET serviceName = ?, description = ?, price = ? WHERE serviceID = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, service.getServiceName());
            statement.setString(2, service.getDescription());
            statement.setDouble(3, service.getPrice());
            statement.setString(4, service.getServiceID());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean deleteService(String serviceID) {
        String query = "DELETE FROM tblServices WHERE serviceID = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, serviceID);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        ServiceDAO serviceDAO = new ServiceDAO();
        System.out.println("---- Testing ServiceDAO ----");

        // 1. Create a new service
        ServiceDTO newService = new ServiceDTO("svc3", "Hot Stone Massage", "Relaxing hot stone therapy", 60.00);
        if (serviceDAO.createService(newService)) {
            System.out.println("Service created successfully!");
        } else {
            System.out.println("Failed to create service.");
        }

        // 2. Get all services
        List<ServiceDTO> services = serviceDAO.getAllServices();
        System.out.println("List of services:");
        for (ServiceDTO service : services) {
            System.out.println(service.getServiceID() + ": " + service.getServiceName() + " - $" + service.getPrice());
        }

//        // 3. Update a service
        newService.setPrice(65.00);
        if (serviceDAO.updateService(newService)) {
            System.out.println("Service updated successfully!");
        } else {
            System.out.println("Failed to update service.");
        }

        // 4. Get service by ID
        ServiceDTO serviceById = serviceDAO.getServiceById("svc3");
        if (serviceById != null) {
            System.out.println("Retrieved service: " + serviceById.getServiceName() + " - $" + serviceById.getPrice());
        } else {
            System.out.println("Service not found.");
        }

//        // 5. Delete a service
//        if (serviceDAO.deleteService("svc3")) {
//            System.out.println("Service deleted successfully!");
//        } else {
//            System.out.println("Failed to delete service.");
//        }
    }
}
