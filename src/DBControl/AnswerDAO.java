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
import model.Answer;

/**
 * DAO for Answer class
 * @author arka
 */
public class AnswerDAO {
    private final String TABLE = Constants.DB_TABLE_ANS;
    private final Connection connection;
    
    /**
     * Constructor method
     * @param connection 
     */
    public AnswerDAO(Connection connection) {
        this.connection = connection;
    }
    
    /**
     * Method to insert a new answer in database
     * @param body
     * @param username
     * @param qid
     * @return
     * @throws SQLException 
     */
    public int insertAnswer(String body, String username, 
            int qid)throws SQLException {
        String query = "INSERT INTO " + TABLE + 
                "(body, username, qid, timestamp) values(?,?,?,?)";
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, body);
        ps.setString(2, username);
        ps.setInt(3, qid);
        ps.setTimestamp(4, date);
        
        int res = ps.executeUpdate();
        return res;
    }
    
    /**
     * Get all answers from database for a qid
     * @return A list of questions
     * @throws java.sql.SQLException
     */
    public List<Answer> getAnswersByQid(int qid)throws SQLException {
        List<Answer> answers = new ArrayList<>();
        String query = "SELECT * FROM " + TABLE + " WHERE qid=?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, qid);
        ResultSet rst = ps.executeQuery();
        
        while(rst.next()) {
            Answer answer = new Answer(rst.getInt("id"), 
                    rst.getString("body"), rst.getString("username"), 
                    rst.getInt("qid"), rst.getTimestamp("timestamp"));
            answers.add(answer);
        }
        
        return answers;
    }
}
