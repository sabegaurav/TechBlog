//this class use to insert like get like 
package com.techblog.dao;

/**
 *
 * @author gaura
 */ 
import java.sql.*;
public class LikeDao {
    private Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    } 
    
    public boolean isLike(int pid,int uid) {
        boolean f=false;
        
        try {
            String q="select * from postlike where pid=? and uid=?";
            PreparedStatement smt=con.prepareStatement(q);
            smt.setInt(1,pid);
            smt.setInt(2,uid);
            ResultSet rs=smt.executeQuery();
            while(rs.next()){
                f=true;
                break;
            }
        }
        
        catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
//    insert like in db 
    public boolean insertLike(int pid,int uid) {
        boolean f=false;  
//        to check wether frist user like or not if he made frist like then retur from here
        if(isLike(pid,uid)) {
        return false;
        }
        try {
        String q="insert into postlike(pid,uid) values(?,?)";
        PreparedStatement smt=con.prepareStatement(q);
        smt.setInt(1,pid);
        smt.setInt(2, uid);
        smt.executeUpdate();
        f=true;
        
        }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    
//    count like on post by ussing post id 
    public int countLikeOnPost(int pid) {
        int count=0;
        
        try {
            String q="select count(*) from postlike where pid=?";
            PreparedStatement smt=con.prepareStatement(q); 
            smt.setInt(1,pid);
            ResultSet rs=smt.executeQuery();
            while(rs.next()){
                count=rs.getInt(1);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        
        return count;
    }
    
//    to check if user has liked before 
     public boolean isLikeByUser(int pid,int uid) {
         boolean f=false;
         
         try {
             String q="select * from postlike where pid=? and uid=?";
             PreparedStatement smt=con.prepareStatement(q);
             smt.setInt(1,pid);
             smt.setInt(2, uid);
             ResultSet rs=smt.executeQuery();
             while(rs.next()){
                 f=true;
             }
             
         }
         
         catch (Exception e) {
             e.printStackTrace();
         }
         
         return f;
     }
     
     public boolean deleteLike(int pid,int uid) {
         boolean f=false;
         
         try {
             String q="delete from postlike where pid=? and uid=?";
             PreparedStatement smt=con.prepareStatement(q);
             smt.setInt(1, pid);
             smt.setInt(2, uid);
             smt.executeUpdate();
             f=true;
         }
         
         catch (Exception e) {
             e.printStackTrace();
         }
         
         
         return f;
     }
}

