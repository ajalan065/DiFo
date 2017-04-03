/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 * The Answer class
 * @author arka
 */
public class Answer {
    private int id;
    private String body;
    private String username;
    private int qid;
    private Timestamp timestamp;
    
    public Answer(int id, String body, String username, int qid, 
            Timestamp timestamp) {
        this.id = id;
        this.body = body;
        this.username = username;
        this.qid = qid;
        this.timestamp = timestamp;
    }
    
    public int getId() {
        return this.id;
    }
    
    public String getBody() {
        return this.body;
    }
    
    public String getUsername() {
        return this.username;
    }
    
    public int getQid() {
        return this.qid;
    }
    
    public Timestamp getTimestamp() {
        return this.timestamp;
    }
    
    public void setBody(String body) {
        this.body = body;
    }
}
