<%-- 
    Document   : register_page
    Created on : 15 Apr, 2023, 4:16:04 AM
    Author     : gaura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/my_css.css" rel="stylesheet" type="text/css"/>  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
        .banner-background{
          clip-path: polygon(0% 0%, 100% 0%, 100% 75%, 100% 96%, 60% 99%, 0 99%, 0% 75%);
        }
    </style>
        <title>Register_Page</title>
    </head>
    <body>
        
        <%@include file="noramal_navbar.jsp" %>

        <main class="primary-background banner-background p-5">
            <div class="container" >
                <div class="col-md-6 offset-md-3" >
                    <div class="card">
                        <div class="card-header text-center">
                            <span class="fa fa-id-card " ></span>
                            Register Here
                        </div>

                        <div class="card-body" >
                            <form action="Register_servlet" method="POST" id="reg-form">

                                <div class="form-group">
                                    <label  for="user_name">User name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter user name">
                                    <small id="emailHelp" class="form-text text-muted"></small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted"></small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                
                                <div class="form-group">
                                    <label for="gender" >Select gender</label> 
                                    <br>
                                    <input type="radio" name="gender" value="Male"> Male
                                    <input type="radio" name="gender" value="Female"> Female
                                    <input type="radio" name="gender" value="other"> Other
                                </div>
                                
                                
                                <div class="form-group">
                                    <textarea name="about" class="form-control" cols="30" rows="10"  placeholder="Write something about you "></textarea>
                                </div>


                                <div class="form-check">
                                    <input  name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1"> Agree term and Condition </label>
                                </div>
                                <br>  
                                <div class="container text-center" id="loader" style="display:none" >
                                   <span class="fa fa-refresh fa-spin fa-4x"></span>  
                                   <h2>Please Wait...</h2>
                                   </div>
                                   <br>
                                   <button  id="sumbimt-btn" type="submit" class="btn btn-primary">
                                     Submit</button>
                            </form>
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
        <!--swit alert url--> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        
        <!--why we took following script--> 
<!--        as we know when we click want on submit button then our data send to register servlet and page also 
        migrate to avoid than we use java script 
        our data is send to servet but we remain on same page -->
           <script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#reg-form').on('submit', function (event) { 
                    
//                    preventing to goining  next page 
                    event.preventDefault();    
                    let form = new FormData(this);
                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "Register_servlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            if (data.trim() === 'done')
                            {
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login_page.jsp"
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script

    </body>
</html>
