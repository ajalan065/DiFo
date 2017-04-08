/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 * The User model
 * @author arka
 */
public class User {
    private final String username;
    private final String email;
    private final String password;
    private final String fName, mName, lName;
    private final String status;
    private final String picture;
    private final String gender;
    
    public User(String username, String email, String password, String fName,
            String mName, String lName, String status, String picture, String gender) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.fName = fName;
        this.mName = mName;
        this.lName = lName;
        this.status = status;
        this.picture=picture;
        this.gender=gender;
    }
    
    public String getUsername() {
        return this.username;
    }
    
    public String getEmail() {
        return this.email;
    }
    
    public String getPassword() {
        return this.password;
    }
    
    public String getFName() {
        return this.fName;
    }
    
    public String getMName() {
        return this.mName;
    }
    
    public String getLName() {
        return this.lName;
    }
    
    public String getStatus() {
        return this.status;
    }
    
    public String getPicture() {
        return this.picture;
    }
    
    public String getGender() {
        return this.gender;
    }
}
