/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 * The Question class
 * @author arka
 */
public class Question {
    private int id;
    private String head;
    private String body;
    private String username;
    private Timestamp timestamp;
    
    public Question(int id, String head, String body, 
            String username, Timestamp timestamp) {
        this.body = body;
        this.id = id;
        this.head = head;
        this.username = username;
        this.timestamp = timestamp;
    }
    
    public int getId() {
        return this.id;
    }
    
    public String getHead() {
        return this.head;
    }
    
    public String getBody() {
        return this.body;
    }
    
    public String getUsername() {
        return this.username;
    }
    
    public Timestamp getTimestamp() {
        return this.timestamp;
    }
    
    public void setHead(String head) {
        this.head = head;
    }
    
    public void setBody(String body) {
        this.body = body;
    }
}
