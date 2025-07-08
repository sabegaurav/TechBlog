/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techblog.entities;

import java.sql.*;
public class user {
    private int id;
    private String name;
    private String password;
    private String email;
    private String gender;
    private String about;
    private Timestamp rdate; 
    private String profile;

    public user(int id, String name, String password, String email, String gender, String about, Timestamp rdate) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.about = about;
        this.rdate = rdate;
    }

    public user(String name, String password, String email, String gender, String about) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.about = about;
        
    }

    public user() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Timestamp getRdate() {
        return rdate;
    }

    public void setRdate(Timestamp rdate) {
        this.rdate = rdate;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
    
    
 
    
    
}
