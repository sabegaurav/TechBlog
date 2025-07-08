<%--<%@page import="java.util.Collections.list(Enumeration)"%>--%>

<%@page import="java.util.*"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.message"%>
<%@page import="com.techblog.entities.user"%>
<!--if user login succesfully then this page send will execute and send dynamics response--> 

<%
    user user_obj = (user) session.getAttribute("currentUser");

    if (user_obj == null) {
        response.sendRedirect("login_page.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/my_css.css" rel="stylesheet" type="text/css"/>  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body{
                background:url("img/bg2.jpg");
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
        <title>profile page</title>
    </head>
    <body>

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
                        <a class="nav-link" href="$!" data-toggle="modal" data-target="#contact"> <span class="fa fa-envelope " ></span>Contact Us</a>
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


        <!--main body of--> 
        <!--main screen of profile page--> 
        <!--when user open the page they see post by othe user randomly after selecting category they able to see ony that category of post this all thing done by ussing folloig-->
        <!--start of main screen--> 
        <main> 
            <!--we are going to dived page into two part frist one is category and second is post--> 
            <div class="container  " >

                <div class="row mt-4 ">

                    <!--frist column-->
                    <div class="col-md-4">
                        <!--category--> 
                        <div class="list-group"> 

                            <!--we have to active those which currently vissited by user for that will give one class to all link then we will write our logic in java script-->
                            <a href="#" onclick="getPost(0, this)" class="c-link list-group-item list-group-item-action active">
                                All Post
                            </a>
                            <!--categories-->  
                            <!--we take category from postdao contain getAllcategory function--> 
                            <%
                                PostDao pd = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> all_cat = pd.getAllCategory();

                                for (Category c : all_cat) {
                            %> 

                            <!--if user click on certain category then getPost function fire and respective id pass then we will fetch it ussing load_post.jsp page--> 
                            <a href="#" onclick="getPost(<%=c.getId()%>, this)" class="c-link list-group-item list-group-item-action"><%=c.getName()%></a>
                            <%
                                }


                            %>


                        </div>
                    </div>

                    <!--second column--> 
                    <div class="col-md-8">
                        <!--post-->  

                        <!--refresh symbol-->
                        <div class="container text-center" id="loader" >
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading Post...</h3>
                        </div> 


                        <!--we will store data come from servler side in following div and display it to user--> 
                        <div class="container-fluid" id="post-container" >

                        </div>
                    </div>


                </div>
            </div>
        </main>
        <!--end of main screen--> 






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
                            <h6><span class="fa fa-star checked"></span></h6>
                                <%
                                    PostDao ppdd = new PostDao(ConnectionProvider.getConnection());

                                %>
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
                                <div class="container text-center form-control" >
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


        <!--contact us modal--> 
        <div class="modal fade" id="contact" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body"> 

                        <div class="container" >
                            <ul class="list-group">
                                <li class="list-group-item"><h5> Email Us On:</h5><span class="fa fa-envelope "></span><a href="gmail.com>">techblog@gmail.com</a></li>
                                <li class="list-group-item"><h5>Helpline Number: <span class="	fa fa-phone-square">932207123</span></h5></li>
                                <li class="list-group-item"><h5>Twiter Us On : <span class="	fa fa-mail-forward"><a href="twiter.com">techblog.Offitial.Com</a></span></h5></li>

                            </ul>
                            <br>  



                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

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
        <script src="java script/myjs.js" type="text/javascript"></script> 
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



        <!--following js is for submiting post form ussing ajax-->
        <script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#add-post-form').on('submit', function (event) {

//                    preventing to goining  next page 
                    event.preventDefault();
                    let form = new FormData(this);
                    console.log("submeted........")
                    //send register servlet:
                    $.ajax({
                        url: "Post_Servlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

//                            data is return from servlet 
                            if (data.trim() == "done") {
                                swal("Good job!", "Saved Succesfully !", "success");

                            } else {
                                swal("Error!", "Something went wrong !", "error");


                            }


                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!", "Something went wrong !", "error");

                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script> 

        <script>

//            reference of the link which user  click pass as object 
            function getPost(catId, reference) {
//                show loader to user when it is click on any category  
                $("#loader").show();
                $("#post-container").hide();
                $(".c-link").removeClass('active');

                $.ajax({
                    url: "load_post.jsp",

//                    follwing data se are sending to load_post.jsp in key value pair
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
//                        when server send response then loader hide
                        $("#loader").hide();
                        $("#post-container").show();
//                        we take response of load_post.jsp and display it to user 
                        $("#post-container").html(data);
                        $(reference).addClass('active');
                    }
                })
            }
            $(document).ready(function (e) {
//                by default 0  we have to show all category  
//                by default we are going to show all post and allpost is frist child of c-link class
                let allPost = $(".c-link")[0];
                getPost(0, allPost);

            })
        </script>
    </body>
</html>
