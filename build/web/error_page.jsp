<%-- 
    Document   : error_page
    Created on : 15 Apr, 2023, 5:20:23 PM
    Author     : gaura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/my_css.css" rel="stylesheet" type="text/css"/>  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%@page import="java.sql.*" %>
   
    <style>
        .banner-background{
           clip-path: polygon(0 0, 100% 0, 100% 50%, 100% 95%, 57% 87%, 0 96%);
        }
    </style>
        <title>Something! Went Wrong</title>
    </head>
    <body>
        <div class="container text-center" >
            <img src="img/error.png"/>
            <h1 class="disply-3">Something went Wrong !</h1> 
            <a class="btn btn-primary" href="index.jsp" role="button">Home</a>
            
        </div>
    </body>
</html>
