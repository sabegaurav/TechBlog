<%-- 
    Document   : index
    Created on : 14 Apr, 2023, 11:15:33 PM
    Author     : gaura
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/my_css.css" rel="stylesheet" type="text/css"/>  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%@page import="java.sql.*" %>
    <title>JSP Page</title> 
    <style>
        .banner-background{
           clip-path: polygon(0 0, 100% 0, 100% 50%, 100% 95%, 57% 87%, 0 96%);
        }
        
        body{
                background:url("img/bg2.jpg");
                background-size: cover;
                background-attachment: fixed;
            }
            .category-card{
                border: 1px solid black;
                background-color: honeydew;
            }
    </style>
</head>
<body> 
    <!--navbar--> 
    <%--jsp comment this comment is not visible in source code  --%> 
    <!--html commentthis comment is visible in source code-->  
    <%@include file="noramal_navbar.jsp" %> 

    <!--banner-->
    <div class="container-fluild" >
        <div class="jumbotron primary-background text-white m-0 p-5 banner-background" > 
            <div class="container text-center">
                <h1 class="disply-3">WelCome To My TechBlog</h1> 
                <p1>Hi, welcome to techblog.here you find all information regarding technical which shared by other users.
                    <br>
                    You can see code also posted by other pepole or else if you want to do post on certain technology then you can also do that
               <br>
               For better experiences sinup to our techblog.
               <br>
               Thanks You!!!
         
                </p1>
                
                
                <br>
                <br>
                
                <a href="login_page.jsp" class="btn btn-outline-light"> <span class="fa fa-address-book-o"></span>Login<a>
                  <hr>
            </div> 



        </div>
    </div>

    <!--cards-->

    <div class="container" >
        <div class="row mb-2 mt-2 pading-5" > 
            <%  
                
//                dispay category 
                PostDao pd=new PostDao(ConnectionProvider.getConnection());
                ArrayList<Category> allCat=pd.getAllCategory();
                  
                 for(Category c:allCat) {
                     %>
                     <div class="card col-md-6 mt-4 category-card " >
                <div class="card-body">
                    <h5 class="card-title"><%=c.getName()%></h5>
                    <p class="card-text"><%=c.getDescription()%></p> 
                    <br>
                    <a href="profile.jsp" class="btn btn-primary">See Post</a>
                </div>
            </div>
                     <%
                 }
                %>
               

<!--            <div class="card col-md-6" >
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>-->

<!--            <div class="card col-md-4" >
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div> -->


        </div>

<!--        <div class="row" >
            <div class="card col-md-4" >
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>   

            <div class="card col-md-4" >
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div> 

            <div class="card col-md-4" >
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>   


        </div>-->
    </div>
                
<!--              Button trigger modal 
<button type="button" class="btn btn-" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>-->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    <script
        src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="java script/myjs.js" type="text/javascript"></script>
</body>

