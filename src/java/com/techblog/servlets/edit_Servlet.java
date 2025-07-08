/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techblog.servlets;

import com.techblog.dao.UserDao;
import com.techblog.entities.message;
import com.techblog.entities.user;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author gaura
 */
@MultipartConfig
public class edit_Servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet edit_Servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession ht=request.getSession();
            user u=(user)ht.getAttribute("currentUser");
            String name=request.getParameter("user_new_name");
            String email=request.getParameter("user_new_email");
            String password=request.getParameter("user_new_password");
            String about=request.getParameter("user_new_about");
            
            Part part=request.getPart("user_new_profile");
            String profile=part.getSubmittedFileName();
            
            u.setName(name);
            u.setPassword(password);
            u.setEmail(email);  
//            in below we take path of old file and deleete it  
            String old=u.getProfile();
            u.setProfile(profile);
            u.setAbout(about);
            UserDao ud=new UserDao(ConnectionProvider.getConnection());
            boolean f=ud.updateUser(u);
            if(f) {
//                below is new path of file 
                String path=request.getRealPath("/")+File.separator+"profile_img"+u.getProfile();
//                following is old path 
                String old_path=request.getRealPath("/")+File.separator+"profile_img"+old; 
                
                if(!old.equals("default.png")) {
                Helper.deleteFile(old_path); 
                }
                
//                save the photo in databases; 
              if(profile.length()!=0) 
               Helper.saveFile(part.getInputStream(), path); 
               
               message msg = new message("Succesfully ! updated..", "success", "alert-success");
                
                ht.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
                
                
                
                
            }
            
            else {
                message msg = new message("something went wrong ! Check data again..", "error", "alert-danger");
                
                ht.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
