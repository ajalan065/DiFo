/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBControl;

import java.sql.*;

import constants.Constants;
import java.util.ArrayList;
import java.util.List;
import model.Tag;

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
    
    /**
     * Return list of all tags for a particular qid
     * @param qid
     * @return 
     */
    public List<Tag> getTagsByQid(int qid)throws SQLException {
        String query = "SELECT tid FROM " + TABLE + " WHERE qid=?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, qid);
        ResultSet rst = ps.executeQuery();
        
        List<Tag> tags = new ArrayList<>();
        while(rst.next()) {
            int tid = rst.getInt("tid");
            // get tag from db 
            query = "SELECT * FROM " + Constants.DB_TABLE_TAG + " WHERE id=?";
            ps = connection.prepareStatement(query);
            ps.setInt(1, tid);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                Tag tag = new Tag(res.getInt("id"), res.getString("name"));
                tags.add(tag);
            }
        }
        return tags;
    }
}
