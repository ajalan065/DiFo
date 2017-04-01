/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 * The Tag class
 * @author arka
 */
public class Tag {
    private int id;
    private String name;
    
    public Tag(int id, String name) {
        this.id = id;
        this.name = name;
    }
    
    public String getName() {
        return this.name;
    }
    
    public int getId() {
        return this.id;
    }
}
