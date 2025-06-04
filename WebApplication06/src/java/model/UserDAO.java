package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import utils.DbUtils;

public class UserDAO {

    public UserDAO() {
    }

    public boolean login(String userID, String password) {
        try {
            UserDTO user = getUserById(userID);
            if (user != null) {
                if (user.getPassword().equals(password)) {
                    if (user.isStatus()) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
        }
        return false;
    }

    public UserDTO getUserById(String userID) {
        try {
            String sql = "SELECT * FROM tblUsers WHERE userID=?";
            Connection conn = DbUtils.getConnection();
            PreparedStatement pr = conn.prepareStatement(sql);
            pr.setString(1, userID);
            ResultSet rs = pr.executeQuery();

            while (rs.next()) {
                String userId = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String password1 = rs.getString("password");
                String roleID = rs.getString("roleID");
                boolean status = rs.getBoolean("status");

                UserDTO userDTO = new UserDTO(userId, fullName, password1, roleID, status);
                return userDTO;
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    // ✅ Hàm mới để lấy danh sách tất cả user
    public List<UserDTO> getAllUser() {
        List<UserDTO> users = new ArrayList<>();
        String sql = "SELECT userID, fullName, password, roleID, status FROM tblUsers";

        try (Connection conn = DbUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String userId = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String password1 = rs.getString("password");
                String roleID = rs.getString("roleID");
                boolean status = rs.getBoolean("status");

                UserDTO user = new UserDTO(userId, fullName, password1, roleID, status);
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }
}
