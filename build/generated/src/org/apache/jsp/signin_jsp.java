package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"./CSS_file/Design.css\" type=\"text/css\"></link><!--\n");
      out.write("-->        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap\" rel=\"stylesheet\">\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Lobster&display=swap\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <body class=\"background_color\">\n");
      out.write("        <div class=\"box\">\n");
      out.write("            <div class=\"sub_sign\"></div> \n");
      out.write("            <form method=\"post\" action=\"prosess.jsp\" class=\"info_signin\">\n");
      out.write("                <h1 style=\"    font-family: 'Roboto Slab', serif;\">SignIn</h1>\n");
      out.write("                \n");
      out.write("                <input type=\"text\" name=\"name\" class=\"data\" id=\"name\"  placeholder=\"Enter your full name\" required/>\n");
      out.write("              \n");
      out.write("                <input type=\"text\" name=\"uname\" class=\"data\" id=\"uname\" value=\"\" onblur=\"validate1()\"  placeholder=\"Enter username\" required/>\n");
      out.write("                <p1 id=\"uname_val\" style=\"color:red;text-align : center;\">\n");
      out.write("                   \n");
      out.write("                </p1>\n");
      out.write("                 \n");
      out.write("                <input type=\"text\" name=\"contact\" class=\"data\" id=\"contact\" onblur=\"validate2()\" placeholder=\"Enter contact number\" required/>\n");
      out.write("                <p1 id=\"contact_val\" style=\"color:red;text-align : center;\">\n");
      out.write("                   \n");
      out.write("                </p1>\n");
      out.write("             \n");
      out.write("                <input type=\"email\" name=\"mail\" class=\"data\"  placeholder=\"Enter your Email\" required/>\n");
      out.write("                \n");
      out.write("                <input type=\"password\" name=\"password\" class=\"data\" id=\"pass\" onblur=\"validate3()\" placeholder=\"Enter password\" required/>\n");
      out.write("                 <p1 id=\"pass_val\" style=\"color:red;text-align : center;\">\n");
      out.write("                    \n");
      out.write("                </p1>\n");
      out.write("                <textarea rows=\"7\" cols=\"40\" name=\"address\" class=\"data\"  placeholder=\"Enter your address\" required=\"\" ></textarea>\n");
      out.write("                <input type=\"submit\" value=\"SignUp\" class=\"submit\"/>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("            function validate1()\n");
      out.write("            {\n");
      out.write("                \n");
      out.write("                 var uname=document.getElementById(\"uname\").value;\n");
      out.write("                  \n");
      out.write("                   \n");
      out.write("                   document.getElementById(\"uname_val\").innerHTML=\"\"; \n");
      out.write("                    \n");
      out.write("                     \n");
      out.write("                   console.log(\"hello1\");\n");
      out.write("                \n");
      out.write("               if(uname!==\"\"){\n");
      out.write("               if(uname.length>8 || uname.length<1)\n");
      out.write("                {\n");
      out.write("                    document.getElementById(\"uname_val\").innerHTML=\"should be of size between 1 to 8\"; \n");
      out.write("                     document.getElementById(\"uname\").value='';\n");
      out.write("                   return;\n");
      out.write("                }\n");
      out.write("               \n");
      out.write("               }\n");
      out.write("            }\n");
      out.write("            function validate2()\n");
      out.write("            {\n");
      out.write("                var contact=document.getElementById(\"contact\").value;\n");
      out.write("                document.getElementById(\"contact_val\").innerHTML=\"\"; \n");
      out.write("                console.log(\"hello2\");\n");
      out.write("                if(contact!==\"\"){\n");
      out.write("                    \n");
      out.write("                \n");
      out.write("                 if(contact.length!==10)\n");
      out.write("                {\n");
      out.write("                    document.getElementById(\"contact_val\").innerHTML=\"should be of size 10\"; \n");
      out.write("                     document.getElementById(\"contact\").value='';\n");
      out.write("                      return;\n");
      out.write("                 }\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            function validate3()\n");
      out.write("            {\n");
      out.write("                 const check=/^(?=.*\\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{1,7}$/;\n");
      out.write("               var pass=document.getElementById(\"pass\").value;\n");
      out.write("               document.getElementById(\"pass_val\").innerHTML=\"\";\n");
      out.write("               console.log(\"hello3\");\n");
      out.write("               if(pass!==\"\")\n");
      out.write("               {\n");
      out.write("                 if(!check.test(pass))\n");
      out.write("                {\n");
      out.write("                    console.log(pass);\n");
      out.write("                    document.getElementById(\"pass_val\").innerHTML=\"Invalid\"; \n");
      out.write("                     document.getElementById(\"pass\").value='';\n");
      out.write("                     return;\n");
      out.write("                }\n");
      out.write("               }\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
