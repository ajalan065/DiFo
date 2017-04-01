/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBControl;

import java.sql.*;

import constants.Constants;

/**
 * DAO for Questions_Tag table
 * @author arka
 */
public class QuestionsTagDAO {
    private final String TABLE = Constants.DB_TABLE_QT;
    private final Connection connection;
    
    /**
     * Constructor method
     * @param connection 
     */
    public QuestionsTagDAO(Connection connection) {
        this.connection = connection;
    }
    
    /**
     * Method to insert a tag in database
     * @param qid
     * @param tid
     * @return 
     * @throws java.sql.SQLException
     */
    public int insert(int qid, int tid)throws SQLException {
        String query = "INSERT INTO " + TABLE + "(qid, tid) values(?,?)";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, qid);
        ps.setInt(2, tid);
        int res = ps.executeUpdate();
        return res;
    }
}
