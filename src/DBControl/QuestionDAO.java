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
import model.Question;

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
    
    /**
     * Get all questions from database 
     * @return A list of questions
     * @throws java.sql.SQLException
     */
    public List<Question> getQuestions()throws SQLException {
        List<Question> questions = new ArrayList<>();
        String query = "SELECT * FROM " + TABLE;
        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet rst = ps.executeQuery();
        
        while(rst.next()) {
            Question question = new Question(rst.getInt("id"), 
                    rst.getString("head"), rst.getString("body"), 
                    rst.getString("username"), rst.getTimestamp("timestamp"));
            questions.add(question);
        }
        
        return questions;
    }
    
    /**
     * Get question corresponding to the id in parameter
     * @param id
     * @return
     * @throws SQLException 
     */
    public Question getQuestionById(int id)throws SQLException {
        String query = "SELECT * FROM " + TABLE + " WHERE id=?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, id);
        ResultSet rst = ps.executeQuery();
        Question question = null;
        if(rst.next()) {
            question = new Question(rst.getInt("id"), rst.getString("head"), 
                    rst.getString("body"), rst.getString("username"), 
                    rst.getTimestamp("timestamp"));
            return question;
        }
        return question;
    }
    
    /**
     * Get the id of the last row inserted
     * @return
     * @throws SQLException 
     */
    public int getLastInsertId()throws SQLException {
        String query = "SELECT MAX(id) AS id FROM " + TABLE;
        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet rst = ps.executeQuery();
        return rst.getInt("id");
    }
}
