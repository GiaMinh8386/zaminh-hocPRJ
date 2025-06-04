/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author GIA MINH
 */
public class UserDTO {
    private String userID;
    private String fullname;
    private String password;
    private String roleID;
    private boolean status;
    private String role; 

    public UserDTO() {
    }

    public UserDTO(String userID, String fullname, String password, String roleID, boolean status) {
        this.userID = userID;
        this.fullname = fullname;
        this.password = password;
        this.roleID = roleID;
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public String getRole() {
    return role;
}

public void setRole(String role) {
    this.role = role;
}
    
    
}
