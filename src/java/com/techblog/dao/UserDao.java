/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techblog.dao;

/**
 *
 * @author gaura
 */
import com.techblog.entities.Post;
import com.techblog.entities.user;
import java.sql.*;
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    
    
    public boolean saveUser(user user) {
        boolean isexecute=false;
        try {
            String query="insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement smt=con.prepareStatement(query);
            
            smt.setString(1,user.getName());
            smt.setString(2,user.getEmail());
            smt.setString(3,user.getPassword());
            smt.setString(4,user.getGender());
            smt.setString(5,user.getAbout());
            
            smt.executeUpdate();
           isexecute=true;
        } 
        
        catch (Exception e) {
            System.out.println(e);
        }
        
        return isexecute;
    }
    
    
    
//    user provide email and password on login page we have to check whether he has did registation or not 
//            if he did registation then we return his all login detail other wise we show error page to him
    public user getUserByEmailAndPassword (String email,String password) {
        user user_obj=null;
        
        String query="select * from user where email=? and password=?"; 
        try {
        PreparedStatement smt=con.prepareStatement(query); 
        smt.setString(1,email);
        smt.setString(2,password);
        ResultSet rs=smt.executeQuery();
        
        if(rs.next()) {
            user_obj=new user();
           user_obj.setName(rs.getString("name"));
           user_obj.setEmail(rs.getString("email"));
           user_obj.setPassword(rs.getString("password"));
           user_obj.setGender(rs.getString("gender"));
           user_obj.setAbout(rs.getString("about"));
           user_obj.setRdate(rs.getTimestamp("r_date"));
           user_obj.setProfile(rs.getString("profile")); 
           user_obj.setId(rs.getInt("id"));
           
           
           
        }
        
        else {
            
        }
        }
        
        catch(Exception e) {
            e.printStackTrace();
        }
        return user_obj;
    }
    
//    following function use for updated edit data of user 
    
    public boolean updateUser(user u) { 
        boolean f=false;
        try {
            String query="update user set name=?, email=?,password=?,gender=?,about=?,profile=? where id=?";
            PreparedStatement smt=con.prepareStatement(query);
            
            smt.setString(1,u.getName());
            smt.setString(2,u.getEmail());
            smt.setString(3,u.getPassword());
            smt.setString(4,u.getGender());
            smt.setString(5,u.getAbout());
            smt.setString(6,u.getProfile());  
            smt.setInt(7,u.getId());
            smt.executeUpdate(); 
            f=true;
         
            
        }
        
        catch (Exception e) { 
           
            System.out.println(e);
        }
        
        return f;
    }
    
//    following method used to show user informatio  this used in show_blog_page .this method has called from show_blog_page,jsp
    
    public user getUserByUserId(int user_id) {
   user user_obj=null;
   
   
   try{
       String q="select * from user where id=?";
       PreparedStatement smt=con.prepareStatement(q);
       smt.setInt(1,user_id);
       ResultSet rs=smt.executeQuery();
       
       while(rs.next()) {
           user_obj=new user();
            user_obj.setName(rs.getString("name"));
           user_obj.setEmail(rs.getString("email"));
           user_obj.setPassword(rs.getString("password"));
           user_obj.setGender(rs.getString("gender"));
           user_obj.setAbout(rs.getString("about"));
           user_obj.setId(rs.getInt("id"));
           user_obj.setRdate(rs.getTimestamp("r_date"));
           user_obj.setProfile(rs.getString("profile"));  
           
       }
   }
   
   catch(Exception e) {
       e.printStackTrace();
   }
   
   
   return user_obj;
}
    

}
