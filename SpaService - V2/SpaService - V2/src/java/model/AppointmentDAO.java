package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class AppointmentDAO extends DBUtils {
    
    public List<AppointmentDTO> getAllAppointments() {
        List<AppointmentDTO> appointments = new ArrayList<>();
        String query = "SELECT * FROM tblAppointments";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                AppointmentDTO appointment = new AppointmentDTO(
                        resultSet.getString("appointmentID"),
                        resultSet.getString("userID"),
                        resultSet.getString("serviceID"),
                        resultSet.getTimestamp("appointmentDate"),
                        resultSet.getString("status"),
                        resultSet.getString("staffID")
                );
                appointments.add(appointment);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return appointments;
    }

    public AppointmentDTO getAppointmentById(String appointmentID) {
        String query = "SELECT * FROM tblAppointments WHERE appointmentID = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, appointmentID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new AppointmentDTO(
                        resultSet.getString("appointmentID"),
                        resultSet.getString("userID"),
                        resultSet.getString("serviceID"),
                        resultSet.getTimestamp("appointmentDate"),
                        resultSet.getString("status"),
                        resultSet.getString("staffID")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public List<AppointmentDTO> getAllAppointmentsByUserId(String userId) {
        List<AppointmentDTO> appointments = new ArrayList<>();
        String query = "SELECT * FROM tblAppointments WHERE userID = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                AppointmentDTO appointment = new AppointmentDTO(
                        resultSet.getString("appointmentID"),
                        resultSet.getString("userID"),
                        resultSet.getString("serviceID"),
                        resultSet.getTimestamp("appointmentDate"),
                        resultSet.getString("status"),
                        resultSet.getString("staffID")
                );
                appointments.add(appointment);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return appointments;
    }

    public boolean createAppointment(AppointmentDTO appointment) {
        String query = "INSERT INTO tblAppointments (appointmentID, userID, serviceID, appointmentDate, status, staffID) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, appointment.getAppointmentID());
            statement.setString(2, appointment.getUserID());
            statement.setString(3, appointment.getServiceID());
            statement.setTimestamp(4, new java.sql.Timestamp(appointment.getAppointmentDate().getTime()));
            statement.setString(5, appointment.getStatus());
            statement.setString(6, appointment.getStaffID());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean updateAppointment(AppointmentDTO appointment) {
        String query = "UPDATE tblAppointments SET userID = ?, serviceID = ?, appointmentDate = ?, status = ?, staffID = ? WHERE appointmentID = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, appointment.getUserID());
            statement.setString(2, appointment.getServiceID());
            statement.setTimestamp(3, new java.sql.Timestamp(appointment.getAppointmentDate().getTime()));
            statement.setString(4, appointment.getStatus());
            statement.setString(5, appointment.getStaffID());
            statement.setString(6, appointment.getAppointmentID());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
    public boolean markAppointmentAsCompleted(String appointmentID) {
        String query = "UPDATE tblAppointments SET status = 'Completed' WHERE appointmentID = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, appointmentID);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;  // Return true if the status was successfully updated
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Method to update appointment status to "Cancelled"
    public boolean cancelAppointment(String appointmentID) {
        String query = "UPDATE tblAppointments SET status = 'Cancelled' WHERE appointmentID = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, appointmentID);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;  // Return true if the status was successfully updated
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean deleteAppointment(String appointmentID) {
        String query = "DELETE FROM tblAppointments WHERE appointmentID = ?";
        try (Connection connection = DBUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, appointmentID);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
