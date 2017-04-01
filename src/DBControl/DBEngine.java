/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBControl;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;

import constants.DatabaseLogin;
import constants.Constants;

/**
 * Sets up connection to database
 * @author arka
 */
public class DBEngine {
    private String DBName;
    private String url;
    private String user;
    private String password;
    private Connection connection;
    
    /**
     * Constructor to set url, username and password for DB
     */
    public DBEngine() {
        this.DBName = Constants.DB_NAME;
        this.url = "jdbc:mysql://localhost:3306/" + this.DBName;
        DatabaseLogin con = new DatabaseLogin();
        this.user = con.getUser();
        this.password = con.getPassword();
    }
    
    /**
    * Establishes the database connection.
    * @throws SQLException
    * @throws ClassNotFoundException 
    */
    public void establishConnection() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        this.connection = DriverManager.getConnection(this.url, this.user, this.password);
    }
    
    /**
     * Closes the database connection
     * @throws SQLException 
     */
    public void closeConnection() throws SQLException {
        connection.close();
    }
    
    /**
     * Retrieves the current connection
     * @return 
     */
    public Connection getConnection() {
        return this.connection;
    }
}
