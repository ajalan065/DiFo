/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBControl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import constants.Constants;
/**
 *
 * @author ajalan
 */
public class ChatMessage {
    private final String TABLE = Constants.DB_TABLE_CHAT;
    private final Connection connection;
    
    /**
     * Constructor method
     * @param connection 
     */
    public ChatMessage(Connection connection) {
        this.connection = connection;
    }
    
    /**
     * Method to insert chat messages into database
     * @param username
     * @param message
     * @return
     * @throws SQLException 
     */
    public int insertChatMessage(String username, String message)throws SQLException {
        String query = "INSERT INTO "+TABLE+" VALUES(?,?,?)";
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setTimestamp(1, date);
        ps.setString(2, username);
        ps.setString(3, message);
        
        int res = ps.executeUpdate();
        return res;
    }
    
}
