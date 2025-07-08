<%-- 
    Document   : login_page
    Created on : 15 Apr, 2023, 3:15:01 AM
    Author     : gaura
--%>

<%@page import="com.techblog.entities.message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/my_css.css" rel="stylesheet" type="text/css"/>  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Login Page</title>
        <style>
            .banner-background{
                clip-path: polygon(0% 0%, 100% 0%, 100% 75%, 100% 96%, 52% 94%, 0 99%, 0% 75%);
            }
        </style>
    </head>
    <body>

        <!--navbar-->
        <%@include file="noramal_navbar.jsp" %>

        <!--form-->
        <main class="d-flex align-items-center primary-background banner-background" style="height:90vh ">

            <div class="container">

                <div class="row" >
                    <div class="col-md-4 offset-md-4">
                        <div class="card" >
                            <div class="card-header  text-white primary-background text-center" > 
                                <span class="fa fa-user-plus fa-3x text-center"></span>
                                <p>Login </p>
                            </div> 




                            <!--following java logic for display error on login page--> 
                            <%

                                message msg = (message) session.getAttribute("msg");
                                if (msg != null) {

                            %>

                            <div 
                                class="alert <%=msg.getCssClass()%>" role = "alert"
                                > 
                                <%=msg.getContent()%>
                            </div >


                            <%

                                    session.removeAttribute("msg");
                                }
                            %>





                            <div class="card-body" >
                                <form action="Login_servlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>

                                    <div class="container text-center" >
                                        <button type="submit" class="btn btn-primary">Submit</button> 
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script
            src="https://code.jquery.com/jquery-3.6.4.min.js"
            integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="java script/myjs.js" type="text/javascript"></script>
    </body>
</html>
