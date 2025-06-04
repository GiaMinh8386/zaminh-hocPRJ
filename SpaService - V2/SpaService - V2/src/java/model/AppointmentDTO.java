/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class AppointmentDTO {
    private String appointmentID;
    private String userID;
    private String serviceID;
    private Date appointmentDate;
    private String status;
    private String staffID;

    public AppointmentDTO() {
    }

    public AppointmentDTO(String appointmentID, String userID, String serviceID, Date appointmentDate, String status, String staffID) {
        this.appointmentID = appointmentID;
        this.userID = userID;
        this.serviceID = serviceID;
        this.appointmentDate = appointmentDate;
        this.status = status;
        this.staffID = staffID;
    }

    public String getAppointmentID() {
        return appointmentID;
    }

    public void setAppointmentID(String appointmentID) {
        this.appointmentID = appointmentID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getServiceID() {
        return serviceID;
    }

    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    public Date getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }
    
    
    
}
