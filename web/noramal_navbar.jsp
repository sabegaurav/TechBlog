 
<body>
<nav class="navbar navbar-expand-lg navbar-dark primary-background text-white">
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
                <a class="nav-link" href="$!" data-toggle="modal" data-target="#exampleModal"> <span class="fa fa-envelope " ></span>Contact Us</a>
            </li> 

            <li class="nav-item active">
                <a class="nav-link" href="login_page.jsp"> <span class="fa fa-globe fa-spin "></span>login <span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="register_page.jsp"> <span class="fa fa-drivers-license-o"></span>SinUp <span class="sr-only">(current)</span></a>
            </li>


        </ul>
        <form class="form-inline my-2 my-lg-0" id="contact-form">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>



<!--contact us modal--> 
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

<script>
    
</script>
</body>

