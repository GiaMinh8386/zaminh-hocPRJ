CREATE DATABASE SpaConsultationPortal;
GO
USE SpaConsultationPortal;
GO
CREATE TABLE tblUsers (
    userID VARCHAR(50) PRIMARY KEY NOT NULL,
    fullName NVARCHAR(500) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phoneNumber VARCHAR(15) NOT NULL,
    roleID NVARCHAR(5) NOT NULL,  -- 'ADM' (Admin), 'USR' (User), 'STF' (Staff)
    password VARCHAR(50) NOT NULL
);
GO
INSERT INTO tblUsers (userID, fullName, email, phoneNumber, roleID, password) VALUES
('admin1', 'Admin User', 'admin@example.com', '1234567890', 'ADM', 'adminpass'),
('user1', 'John Doe', 'john@example.com', '0987654321', 'USR', 'userpass'),
('staff1', 'Staff Member', 'staff@example.com', '1122334455', 'STF', 'staffpass');
GO
CREATE TABLE tblServices (
    serviceID VARCHAR(50) PRIMARY KEY NOT NULL,
    serviceName NVARCHAR(200) NOT NULL,
    description NVARCHAR(1000) NOT NULL,
    price DECIMAL(18, 2) NOT NULL
);
GO
CREATE TABLE tblAppointments (
    appointmentID VARCHAR(50) PRIMARY KEY NOT NULL,
    userID VARCHAR(50) NOT NULL,
    serviceID VARCHAR(50) NOT NULL,
    appointmentDate DATETIME NOT NULL,
    status NVARCHAR(20) NOT NULL,  -- 'Pending', 'Completed', 'Cancelled'
    staffID VARCHAR(50) NULL,  -- The staff member assigned to the appointment
    FOREIGN KEY (userID) REFERENCES tblUsers(userID),
    FOREIGN KEY (serviceID) REFERENCES tblServices(serviceID),
    FOREIGN KEY (staffID) REFERENCES tblUsers(userID)
);
GO
CREATE TABLE tblReviews (
    reviewID VARCHAR(50) PRIMARY KEY NOT NULL,
    userID VARCHAR(50) NOT NULL,
    serviceID VARCHAR(50) NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5) NOT NULL,
    comments NVARCHAR(1000),
    FOREIGN KEY (userID) REFERENCES tblUsers(userID),
    FOREIGN KEY (serviceID) REFERENCES tblServices(serviceID)
);
GO
