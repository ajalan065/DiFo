/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBControl;

import java.sql.*;

import constants.Constants;
import constants.DatabaseLogin;

/**
 * Data Access Object for Questions
 * @author arka
 */
public class QuestionDAO {
    private String TABLE = Constants.DB_TABLE_QUES;
    private Connection connection;
    
    /**
     * Constructor method
     * @param connection 
     */
    public QuestionDAO(Connection connection) {
        this.connection = connection;
    }
    
    /**
     * Method to insert a new question in database
     * @param head
     * @param body
     * @param username 
     * @return The result after insertion
     */
    public int insertQuestion(String head, String body, String username)throws SQLException {
        String query = "INSERT INTO " + TABLE + 
                "(head, body, username, timestamp) values(?,?,?,?)";
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, head);
        ps.setString(2, body);
        ps.setString(3, username);
        ps.setTimestamp(4, date);
        
        int res = ps.executeUpdate();
        return res;
    }
}
