/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techblog.helper;

/**
 *
 * @author gaura
 */ 
import java.sql.*;
public class ConnectionProvider {
    private static Connection con; 
    
    public static Connection getConnection () {
        try {
            if(con==null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","wt258");
            }
        }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        
        return con;
    }
}
