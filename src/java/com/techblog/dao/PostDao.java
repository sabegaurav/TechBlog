//this class is used to display the categories from database on profile page.we fetch category from data base and retun to it profile page  ;
package com.techblog.dao;

/**
 *
 * @author gaura
 */import java.util.*;
import com.techblog.entities.Category;
import com.techblog.entities.Post;
import java.sql.*;
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategory(){
        ArrayList<Category> cat=new ArrayList<>();
        
        try {
            String q="select * from categories";
            
            Statement smt=con.createStatement();
            ResultSet rs=smt.executeQuery(q);
            
            while(rs.next()) {
                int id=rs.getInt("cid");
                String name=rs.getString("name");
                String description=rs.getString("description");
                Category c=new Category(id,name,description);
                cat.add(c);
            }
        }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        
        return cat;
    }
    
    public  boolean savePost(Post post) {
        boolean f=false;
        
        try {
            String q="insert into post(pTitle,pContent,pCode,pPic,catId,user_id) values (?,?,?,?,?,?)";
            PreparedStatement smt=con.prepareStatement(q);
            smt.setString(1, post.getpTitle());
            smt.setString(2, post.getpContent());
            smt.setString(3, post.getpCode());
            smt.setString(4, post.getpPic());
            smt.setInt(5,post.getCatId()); 
            smt.setInt(6,post.getUser_id());
            
            smt.execute();
            f=true;
            
            
            
        }
        
        catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
//    for display  post to user we use following two function 
    
    public List<Post> getAllPost() { 
//        return all post 
        List<Post> allPost=new ArrayList<>();
        
        try {
            
//            order by because we have to show data in last come frist display
        String q="select * from post order by pid desc";
        Statement smt=con.createStatement();
        ResultSet rs= smt.executeQuery(q);
        while(rs.next()) {
            int pId=rs.getInt(1);
            String pTitle=rs.getString(2);
            String pContent=rs.getString(3);
            String pCode =rs.getString(4);
            String pic=rs.getString(5);
            Timestamp pDate=rs.getTimestamp(6);
            int catId=rs.getInt(7);
            int user_id=rs.getInt(8);
            Post post=new Post(pId, pTitle, pContent, pCode, pic, pDate, catId,user_id);
            allPost.add(post);
;            
        }
                }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return allPost;
    }
//    getPostByCategoryId following method
    public List<Post> getPostById(int category_id){ 
//        return post by category 
           List<Post> Post=new ArrayList<>();
        
        try {
        String q="select * from post where catId=?";
        
        PreparedStatement smt=con.prepareStatement(q);
        smt.setInt(1, category_id);
        ResultSet rs= smt.executeQuery();
        
        while(rs.next()) {
            int pId=rs.getInt(1);
            String pTitle=rs.getString(2);
            String pContent=rs.getString(3);
            String pCode =rs.getString(4);
            String pic=rs.getString(5);
            Timestamp pDate=rs.getTimestamp(6);
            int catId=rs.getInt(7);
            int user_id=rs.getInt(8);
            Post p=new Post(pId, pTitle, pContent, pCode, pic, pDate, catId,user_id);
            Post.add(p);
;            
        }
                }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return Post;
    }
    
//    following method are used to find only single post made by user and we will show it in show_blog jsp page 
    public Post getPostByPostId(int pid) {
        Post p=null;
        
        
        try {
        String q="select * from post where pid=?";
        
        PreparedStatement smt=con.prepareStatement(q);
        smt.setInt(1,pid);
        ResultSet rs= smt.executeQuery();
        
        while(rs.next()) {
            int pId=rs.getInt(1);
            String pTitle=rs.getString(2);
            String pContent=rs.getString(3);
            String pCode =rs.getString(4);
            String pic=rs.getString(5);
            Timestamp pDate=rs.getTimestamp(6);
            int catId=rs.getInt(7);
            int user_id=rs.getInt(8);
             p=new Post(pId, pTitle, pContent, pCode, pic, pDate, catId,user_id);
            
;            
        }
                }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return p;
    }
    
}
