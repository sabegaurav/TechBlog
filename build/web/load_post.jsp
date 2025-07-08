<%@page import="com.techblog.entities.user"%>
<%@page import="com.techblog.dao.LikeDao"%>
<!--this page responsible for loading post either by catgory id or all post --> 
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techblog.dao.PostDao"%>

<div class="row ">
    <%
        user user_obj = (user) session.getAttribute("currentUser");
        PostDao pd = new PostDao(ConnectionProvider.getConnection());

    //    we pass catId 0 when we load profile page frist time.after if user click on any category then respective category pass we will fetch post as oer category id 
        int catId = Integer.parseInt(request.getParameter("cid"));
        List<Post> post = null;

        if (catId == 0) {
            post = pd.getAllPost();
        } else {
            post = pd.getPostById(catId);
        }

    //     if no most found in any categort then 
        if (post.size() == 0) {
            out.println("<h3 class='display-3 text-center text-white'> No Post In This Category</h3>");
            return;
        }
        for (Post p : post) {
    %>

    <div class="col-md-6 mt-2 ">
        <div class="card" >
            <img class="card-img-top" src="photo/<%=p.getpPic()%>" alt="Card image cap">
            <div class="card-body">

                <b><%=p.getpTitle()%></b> 
                <!--<p><%=p.getpContent()%></p>-->

            </div>
            <!--like comment and read more--> 
            <div class="card-footer primary-background text-center">
                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>

                <button onclick="doLike(<%= p.getPid()%>,<%= user_obj.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </button>

                <!--we send postid with help of urlrewriting so in show_blog_page we can access post ussing post id-->             
                <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read More</a>
                <a href="" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o">20</i></a>
            </div>
        </div>
    </div>

    <%
        }

    %>
    
</div>
    <script src="js/myjs.js" type="text/javascript"></script>
