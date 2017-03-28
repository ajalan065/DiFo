/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package constants;

/**
 * This class will contain the mysql credentials 
 * Note : This is just a sample. Create a class DatabaseLogin
 * in this package with your credential.
 * @author arka
 */
public class DatabaseLoginSample {
    private final String user = "YOURUSERNAME";
    private final String password = "YOURPASSWORD";
    
    /**
     * Gives the mysql username
     * @return the mysql username
     */
    public String getUser() {
        return this.user;
    }
    
    /**
     * Gives the mysql password
     * @return the mysql password
     */
    public String getPassword() {
        return this.password;
    }
}