/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBControl;

import constants.Constants;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 * DAO for Users
 * @author arka
 */
public class UserDAO {
    private String TABLE = Constants.DB_TABLE_USER;
    private Connection connection;
    
    /**
     * Constructor method
     * @param connection 
     */
    public UserDAO(Connection connection) {
        this.connection = connection;
    }
    
    /**
     * Insert a new user
     * @param username
     * @param email
     * @param password
     * @return
     * @throws SQLException 
     */
    public int insertUser(String username, String email, 
            String password)throws SQLException {
        String query = "insert into " + TABLE + 
                "(username, email, password) values(?,?,?)";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, email);
        ps.setString(3, password);
        int res = ps.executeUpdate();
        return res;
    }
    
    /**
     * Get all User Profiles. 
     * Get only public data of User Profile
     * @return
     * @throws SQLException 
     */
    public List<User> getUsersProfile()throws SQLException {
        List<User> userProfiles = new ArrayList<>();
        String query = "SELECT username, FName, MName, LName, Status, Bio FROM " 
                + TABLE;
        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet rst = ps.executeQuery();
        
        while(rst.next()) {
            User user = new User(rst.getString("username"), "", "", 
            rst.getString("FName"), rst.getString("MName"), rst.getString("LName"), 
            rst.getString("Status"), rst.getString("Bio"));
            userProfiles.add(user);
        }
        
        return userProfiles;
    }
    
    /**
     * Get a user's public Profile by username
     * @param username
     * @return
     * @throws SQLException 
     */
    public User getUserProfileByUsername(String username) throws SQLException {
        String query = "SELECT username, FName, MName, LName, Status, Bio FROM " 
                + TABLE + " WHERE username=?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, username);
        ResultSet rst = ps.executeQuery();
        User user = null;
        if(rst.next()) {
            user = new User(rst.getString("username"), "", "", 
            rst.getString("FName"), rst.getString("MName"), rst.getString("LName"), 
            rst.getString("Status"), rst.getString("Bio"));
            return user;
        }
        return user;
    }
}
