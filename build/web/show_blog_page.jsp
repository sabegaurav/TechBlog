<%@page import="com.techblog.dao.LikeDao"%>
<%@page import="com.techblog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="com.techblog.entities.message"%>
<%@page import="com.techblog.entities.user"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<!--when user click on read more in any post then he reacher here and here we are going to show details post ussing post id passed by url rewriting 
-->

<%
    user user_obj = (user) session.getAttribute("currentUser");

    if (user_obj == null) {
        response.sendRedirect("login_page.jsp");
    }

%>

<%    int post_id = Integer.parseInt(request.getParameter("post_id"));
    PostDao pd = new PostDao(ConnectionProvider.getConnection());

//object of post 
    Post post = pd.getPostByPostId(post_id);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/my_css.css" rel="stylesheet" type="text/css"/>  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <style>
        .post-title{
            font-weight: 220;
            font-size: 30px;
        }

        .post-content{
            font-weight: 300;
            font-size: 25px;

        }

        .post-date{
            font-style: italic;
            font-weight: bold;
        }

        .post-user-info{
            font-size: 25px;
        }

        .row-user{
            border: 1px solid black;
            padding-top: 15px;
        }

        body{
            background:url("img/bg2.jpg");
            background-size: cover;
            background-attachment: fixed;
        }
    </style>

    <title><%=post.getpTitle()%></title>


</head>
<body>
    
    <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v16.0" nonce="Jm0bLF2R"></script>





    <!--nav bar start--> 
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <a class="navbar-brand" href="index.jsp" > <span class="fa fa-blind"></span>Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#"> <span class="fa fa-child"></span>LearnCodeWithGaurav <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-calendar-check-o"></span> Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programing Language's</a>
                        <a class="dropdown-item" href="#">Data Stucture</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Project</a>
                    </div>
                </li> 

                <li class="nav-item">
                    <a class="nav-link" href="#"> <span class="fa fa-envelope"></span>Contact Us</a>
                </li> 

                <li class="nav-item">
                    <a href="$"  data-toggle="modal" data-target="#exampleModal" class="nav-link"><span class="fa fa-commenting mr-1 " ></span>Do Post</a>  

                </li> 




            </ul>
            <!--logout and name--> 
            <ul class="navbar-nav mr-right" >
                <li class="nav-item active" style="color:white ">
                    <a class="nav-link" href="$!" data-toggle="modal" data-target="#profile"> <span class="fa fa-user-plus" > </span> <%=user_obj.getName()%></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="logout_servlet"> <span class="fa fa-sign-out" ></span>Logout</a>
                </li> 
            </ul>
        </div>
    </nav> 
    <!--navbar end--> 



    <!--main body--> 
    <!--post show here--> 
    <div class="container" >

        <div class="row my-4" >

            <div class="col-md-10 offset-md-1">

                <!--cards--> 
                <div class="card" >

                    <div class="card-header primary-background text-white ">
                        <h3 class="post-title"><%=post.getpTitle()%> </h3>
                    </div>

                    <div class="card-body">
                        <img class="card-img-top" src="photo/<%=post.getpPic()%>" alt="Card image cap">

                        <!--for information of who made post and when-->  
                        <!--following are some classes i have build in this page .which is above of body plz check-->
                        <div class="row my-3 row-user" >
                            <div class="col-md-8"> 
                                <%
//                                         fetching user from by id who posted this post 
                                    UserDao ud = new UserDao(ConnectionProvider.getConnection());
//                                         following method return user object now we can fetch all the information from that regarding user 
                                    user u = ud.getUserByUserId(post.getUser_id());
                                %>
                                <p class="post-user-info"><a href="%"><%=u.getName()%></a> <span>Has Posted</span></p>
                            </div>

                            <div class="col-md-4">
                                <p class="post-date"><%=post.getpDate().toLocaleString()%> </p>
                            </div>
                        </div>
                        <p class="post-content"><%=post.getpContent()%></p>

                        <pre class="post-code"><%=post.getpCode()%></pre>


                    </div>

                    <div class="card-footer primary-background text-center">
                        <!--we have calculate post and user_obj(login user) above this parameter goes to doloke for like and dislike -->  
                        <%
                            LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                        %>

                        <a  onclick="doLike(<%= post.getPid()%>,<%= user_obj.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(post.getPid())%></span>  </a>

                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o">220</i></a>

                    </div>
                        <div class="card-footer" >
                            <div class="fb-comments" data-href="http://localhost:8084/Techblog/show_blog_page.jsp?post_id=<%=post_id%>" data-width="" data-numposts="5"></div>
                        </div>
                  
                </div>
            </div>
        </div> 
    </div>

    <!--main body end--> 


    <!--POST modal start--> 
    <!-- Modal Post  -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide Post Details !</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body"> 

                    <form  id="add-post-form"action="Post_Servlet" method="post" > 

                        <div class="form-group" > 

                            <!--show category to user ussing postdao function het allcategory--> 
                            <select class="form-control" name="category"> 
                                <option selected disabled >---Select Category---</option>
                                <%                                        PostDao p = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> allCatgory = p.getAllCategory();

                                    for (Category cat : allCatgory) {
                                %>
                                <option value="<%=cat.getId()%>"><%=cat.getName()%></option> 
                                <%
                                    }
                                %>




                            </select>
                        </div>
                        <div class="form-group" >
                            <input name="pTitle" type="text" placeholder="Enter the title of post" class="form-control" />
                        </div> 

                        <div class="form-group">
                            <textarea name="pContent" class="form-control" placeholder="Enter your content" style="height: 200px;"></textarea>
                        </div>

                        <div class="form-group">
                            <textarea  name="pCode" class="form-control" placeholder="Enter your Code(if any)" style="height: 200px;"></textarea>
                        </div> 

                        <div class="form-group">
                            <label>Select img(if any)</label>
                            <br>
                            <input type="file" name="pic" />
                        </div> 

                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary">Post</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>





    <!--after updation msg-->  
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









    <!--  profile Modal -->
    <div class="modal fade" id="profile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white">
                    <h1> Techblog </h1>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <img src="profile_img/<%=user_obj.getProfile()%>" class=" mb-2" style="height: 150px " /> 

                        <h5 class="modal-title" id="exampleModalLabel"><%=user_obj.getName()%></h5> 

                    </div> 



                    <!--details show ussing modal on bootstrap--> 
                    <div id="profile-detail" >
                        <table class="table">

                            <tbody>
                                <tr>
                                    <th scope="row">ID:</th>
                                    <td><%=user_obj.getId()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Email:</th>
                                    <td><%=user_obj.getEmail()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Gender:</th>
                                    <td><%=user_obj.getGender()%></td>

                                </tr>

                                <tr>
                                    <th scope="row">Status:</th>
                                    <td><%=user_obj.getAbout()%></td>

                                </tr>

                                <tr>
                                    <th scope="row">Resistered Date:</th>
                                    <td><%=user_obj.getRdate().toString()%></td>

                                </tr>
                            </tbody>
                        </table> 

                    </div>


                    <!--EDIT-->
                    <!--after clking on edit button then following div will execuete-->
                    <div  class="container text-center" id="profile-edit" style="display: none;" >
                        <h3 class="mt-3"> Edit Data Carefully ! Save It </h3> 

                        <!--enctype tag for tell multiple data type in our form--> 
                        <form action="edit_Servlet" method="POST" enctype="multipart/form-data" >
                            <table class="table form-group " >
                                <tr>
                                    <td>ID</td>
                                    <td><%=user_obj.getId()%></td>
                                </tr>

                                <tr>
                                    <td>Name</td>
                                    <td><input type="text" value="<%=user_obj.getName()%>" name="user_new_name" class="form-control"/> </td>
                                </tr>

                                <tr>
                                    <td>Password</td>
                                    <td><input type="password" value="<%=user_obj.getPassword()%>" name="user_new_password" class="form-control" /></td>
                                </tr>



                                <tr>
                                    <td>Email</td>
                                    <td><input type="email" value="<%=user_obj.getEmail()%>" name="user_new_email" class="form-control"/> </td>
                                </tr>



                                <tr>
                                    <td>Gender</td>
                                    <td><%=user_obj.getGender()%></td>
                                </tr>

                                <tr>
                                    <td>Profile Img</td>
                                    <td>
                                        <input type="file" name="user_new_profile" class="form-control" />
                                    </td>
                                </tr> 

                                <tr>
                                    <td>About</td>
                                    <td>
                                        <textarea rows="4" cols="30" name="user_new_about" class="form-control">
                                            <%=user_obj.getAbout()%>
                                        </textarea>
                                    </td>
                                </tr> 


                            </table> 
                            <div class="container text-center" class="form-control" >
                                <button type="submit" class="btn btn-outline-primary" >Save</button>
                            </div>
                        </form>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary " id="profile-edit-button">Edit</button>
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
    <!--following script for swit alert--> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js//myjs.js" type="text/javascript"></script>
    
    <script src="java script//myjs.js" type="text/javascript"></script> 
    <script>
                            $(document).ready(function () {

                                let edit = true;

                                $('#profile-edit-button').click(function () {
                                    if (edit == true) {
                                        $('#profile-detail').hide();
                                        $('#profile-edit').show();
                                        $(this).text('Back');
                                        edit = false;
                                    } else {
                                        $('#profile-detail').show();
                                        $('#profile-edit').hide();

                                        $(this).text('Edit');
                                        edit = true;
                                    }
                                })
                            })
    </script> 



    <!--facebook commenting--> 


</body>
</html>
