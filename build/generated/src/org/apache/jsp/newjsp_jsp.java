package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.PrintWriter;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"navbar\">\r\n");
      out.write("        <div class=\"logo\">\r\n");
      out.write("            <h1><span>Mel</span>odify</h1>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"nav\">\r\n");
      out.write("            <ul>\r\n");
      out.write("                 ");

                    PrintWriter p=response.getWriter();
                    HttpSession s=request.getSession();
                    
                if((String)s.getAttribute("val")!=null)
                {
                String name=(String)s.getAttribute("val");
                
      out.write("\r\n");
      out.write("                <li><a href=\"#\">Home</a> </li>\r\n");
      out.write("                <li><a href=\"#\">Store</a></li>\r\n");
      out.write("                <li><a href=\"#\">Contact Us</a></li>\r\n");
      out.write("                <li><a href=\"#\">About Us</a></li>\r\n");
      out.write("                <li><a href=\"#\">Logout</a></li>\r\n");
      out.write("                <a href=\"/Melodify/account.jsp\" > <div class=\"right\">");
      out.print( name);
      out.write("</div></a>\r\n");
      out.write("                  ");

                }
else
{


                
      out.write("\r\n");
      out.write("                 <li><a href=\"#\">Home</a> </li>\r\n");
      out.write("                <li><a href=\"#\">Store</a></li>\r\n");
      out.write("                <li><a href=\"#\">Contact Us</a></li>\r\n");
      out.write("                <li><a href=\"#\">About Us</a></li>\r\n");
      out.write("                <li><a href=\"#\">Log In</a></li>\r\n");
      out.write("                <li><a href=\"#\">Sign Up</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("                  ");

                    }
                    
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"container1\">\r\n");
      out.write("        <div class=\"sub_container1\">\r\n");
      out.write("            <div class=\"slogan\">\r\n");
      out.write("                <h1 style=\"font-size: 75px;\"><span>Mel</span>odify</h1>\r\n");
      out.write("            <h2>Let your music speaks with our <span1>Syrinx</span1></h2>\r\n");
      out.write("            <button class=\"btn\">Shop Now</button>\r\n");
      out.write("            </div>\r\n");
      out.write("           \r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"sub_container2\">\r\n");
      out.write("            <img src=\"web-image8.png\"/>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
