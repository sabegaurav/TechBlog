package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import com.techblog.entities.Category;
import com.techblog.dao.PostDao;
import com.techblog.helper.ConnectionProvider;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/noramal_navbar.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"> \n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("    <link href=\"css/my_css.css\" rel=\"stylesheet\" type=\"text/css\"/>  \n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("    \n");
      out.write("    <title>JSP Page</title> \n");
      out.write("    <style>\n");
      out.write("        .banner-background{\n");
      out.write("           clip-path: polygon(0 0, 100% 0, 100% 50%, 100% 95%, 57% 87%, 0 96%);\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        body{\n");
      out.write("                background:url(\"img/bg2.jpg\");\n");
      out.write("                background-size: cover;\n");
      out.write("                background-attachment: fixed;\n");
      out.write("            }\n");
      out.write("            .category-card{\n");
      out.write("                border: 1px solid black;\n");
      out.write("                background-color: honeydew;\n");
      out.write("            }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body> \n");
      out.write("    <!--navbar--> \n");
      out.write("    ");
      out.write(" \n");
      out.write("    <!--html commentthis comment is visible in source code-->  \n");
      out.write("    ");
      out.write(" \n");
      out.write("<body>\n");
      out.write("<nav class=\"navbar navbar-expand-lg navbar-dark primary-background text-white\">\n");
      out.write("    <a class=\"navbar-brand\" href=\"index.jsp\" > <span class=\"fa fa-blind\"></span>Tech Blog</a>\n");
      out.write("    <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("        <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("    </button>\n");
      out.write("\n");
      out.write("    <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("        <ul class=\"navbar-nav mr-auto\">\n");
      out.write("            <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"#\"> <span class=\"fa fa-child\"></span>LearnCodeWithGaurav <span class=\"sr-only\">(current)</span></a>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("            <li class=\"nav-item dropdown\">\n");
      out.write("                <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                    <span class=\"fa fa-calendar-check-o\"></span> Categories\n");
      out.write("                </a>\n");
      out.write("                <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                    <a class=\"dropdown-item\" href=\"#\">Programing Language's</a>\n");
      out.write("                    <a class=\"dropdown-item\" href=\"#\">Data Stucture</a>\n");
      out.write("                    <div class=\"dropdown-divider\"></div>\n");
      out.write("                    <a class=\"dropdown-item\" href=\"#\">Project</a>\n");
      out.write("                </div>\n");
      out.write("            </li> \n");
      out.write("\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"nav-link\" href=\"$!\" data-toggle=\"modal\" data-target=\"#exampleModal\"> <span class=\"fa fa-envelope \" ></span>Contact Us</a>\n");
      out.write("            </li> \n");
      out.write("\n");
      out.write("            <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"login_page.jsp\"> <span class=\"fa fa-globe fa-spin \"></span>login <span class=\"sr-only\">(current)</span></a>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("            <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"register_page.jsp\"> <span class=\"fa fa-drivers-license-o\"></span>SinUp <span class=\"sr-only\">(current)</span></a>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </ul>\n");
      out.write("        <form class=\"form-inline my-2 my-lg-0\" id=\"contact-form\">\n");
      out.write("            <input class=\"form-control mr-sm-2\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\">\n");
      out.write("            <button class=\"btn btn-outline-light my-2 my-sm-0\" type=\"submit\">Search</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--contact us modal--> \n");
      out.write("<div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("    <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("        <div class=\"modal-content\">\n");
      out.write("            <div class=\"modal-header\">\n");
      out.write("                <h5 class=\"modal-title\" id=\"exampleModalLabel\">Modal title</h5>\n");
      out.write("                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                    <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                </button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-body\"> \n");
      out.write("\n");
      out.write("                <div class=\"container\" >\n");
      out.write("                    <ul class=\"list-group\">\n");
      out.write("                        <li class=\"list-group-item\"><h5> Email Us On:</h5><span class=\"fa fa-envelope \"></span><a href=\"gmail.com>\">techblog@gmail.com</a></li>\n");
      out.write("                        <li class=\"list-group-item\"><h5>Helpline Number: <span class=\"\tfa fa-phone-square\">932207123</span></h5></li>\n");
      out.write("                        <li class=\"list-group-item\"><h5>Twiter Us On : <span class=\"\tfa fa-mail-forward\"><a href=\"twiter.com\">techblog.Offitial.Com</a></span></h5></li>\n");
      out.write("                        \n");
      out.write("                    </ul>\n");
      out.write("                    <br>  \n");
      out.write("                   \n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-footer\">\n");
      out.write("                <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    \n");
      out.write("</script>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write(" \n");
      out.write("\n");
      out.write("    <!--banner-->\n");
      out.write("    <div class=\"container-fluild\" >\n");
      out.write("        <div class=\"jumbotron primary-background text-white m-0 p-5 banner-background\" > \n");
      out.write("            <div class=\"container text-center\">\n");
      out.write("                <h1 class=\"disply-3\">WelCome To My TechBlog</h1> \n");
      out.write("                <p1>Hi, welcome to techblog .here you find all information regarding technical which shared by other users.\n");
      out.write("                    <br>\n");
      out.write("                    You can see code also posted by other pepole or else if you want to do post on certain technology then you can also do that\n");
      out.write("               <br>\n");
      out.write("               For better experiences sinup to our techblog.\n");
      out.write("                </p1>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                \n");
      out.write("                <a href=\"login_page.jsp\" class=\"btn btn-outline-light\"> <span class=\"fa fa-address-book-o\"></span>Login<a>\n");
      out.write("                  <hr>\n");
      out.write("            </div> \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!--cards-->\n");
      out.write("\n");
      out.write("    <div class=\"container\" >\n");
      out.write("        <div class=\"row mb-2 mt-2 pading-5\" > \n");
      out.write("            ");
  
                
//                dispay category 
                PostDao pd=new PostDao(ConnectionProvider.getConnection());
                ArrayList<Category> allCat=pd.getAllCategory();
                  
                 for(Category c:allCat) {
                     
      out.write("\n");
      out.write("                     <div class=\"card col-md-6 mt-4 category-card \" >\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <h5 class=\"card-title\">");
      out.print(c.getName());
      out.write("</h5>\n");
      out.write("                    <p class=\"card-text\">");
      out.print(c.getDescription());
      out.write("</p> \n");
      out.write("                    <br>\n");
      out.write("                    <a href=\"profile.jsp\" class=\"btn btn-primary\">See Post</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("                     ");

                 }
                
      out.write("\n");
      out.write("               \n");
      out.write("\n");
      out.write("<!--            <div class=\"card col-md-6\" >\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <h5 class=\"card-title\">Card title</h5>\n");
      out.write("                    <p class=\"card-text\">Some quick example text to build on the card title and make up the bulk of the card's content.</p>\n");
      out.write("                    <a href=\"#\" class=\"btn btn-primary\">Go somewhere</a>\n");
      out.write("                </div>\n");
      out.write("            </div>-->\n");
      out.write("\n");
      out.write("<!--            <div class=\"card col-md-4\" >\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <h5 class=\"card-title\">Card title</h5>\n");
      out.write("                    <p class=\"card-text\">Some quick example text to build on the card title and make up the bulk of the card's content.</p>\n");
      out.write("                    <a href=\"#\" class=\"btn btn-primary\">Go somewhere</a>\n");
      out.write("                </div>\n");
      out.write("            </div> -->\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("<!--        <div class=\"row\" >\n");
      out.write("            <div class=\"card col-md-4\" >\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <h5 class=\"card-title\">Card title</h5>\n");
      out.write("                    <p class=\"card-text\">Some quick example text to build on the card title and make up the bulk of the card's content.</p>\n");
      out.write("                    <a href=\"#\" class=\"btn btn-primary\">Go somewhere</a>\n");
      out.write("                </div>\n");
      out.write("            </div>   \n");
      out.write("\n");
      out.write("            <div class=\"card col-md-4\" >\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <h5 class=\"card-title\">Card title</h5>\n");
      out.write("                    <p class=\"card-text\">Some quick example text to build on the card title and make up the bulk of the card's content.</p>\n");
      out.write("                    <a href=\"#\" class=\"btn btn-primary\">Go somewhere</a>\n");
      out.write("                </div>\n");
      out.write("            </div> \n");
      out.write("\n");
      out.write("            <div class=\"card col-md-4\" >\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("                    <h5 class=\"card-title\">Card title</h5>\n");
      out.write("                    <p class=\"card-text\">Some quick example text to build on the card title and make up the bulk of the card's content.</p>\n");
      out.write("                    <a href=\"#\" class=\"btn btn-primary\">Go somewhere</a>\n");
      out.write("                </div>\n");
      out.write("            </div>   \n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>-->\n");
      out.write("    </div>\n");
      out.write("                \n");
      out.write("<!--              Button trigger modal \n");
      out.write("<button type=\"button\" class=\"btn btn-\" data-toggle=\"modal\" data-target=\"#exampleModal\">\n");
      out.write("  Launch demo modal\n");
      out.write("</button>-->\n");
      out.write("\n");
      out.write("<!-- Modal -->\n");
      out.write("<div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("  <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("    <div class=\"modal-content\">\n");
      out.write("      <div class=\"modal-header\">\n");
      out.write("        <h5 class=\"modal-title\" id=\"exampleModalLabel\">Modal title</h5>\n");
      out.write("        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("          <span aria-hidden=\"true\">&times;</span>\n");
      out.write("        </button>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"modal-body\">\n");
      out.write("        ...\n");
      out.write("      </div>\n");
      out.write("      <div class=\"modal-footer\">\n");
      out.write("        <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>\n");
      out.write("        <button type=\"button\" class=\"btn btn-primary\">Save changes</button>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("    <script\n");
      out.write("        src=\"https://code.jquery.com/jquery-3.6.4.min.js\"\n");
      out.write("        integrity=\"sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=\"\n");
      out.write("    crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"java script/myjs.js\" type=\"text/javascript\"></script>\n");
      out.write("</body>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
