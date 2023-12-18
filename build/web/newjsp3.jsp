<%-- 
    Document   : newjsp3
    Created on : Nov 30, 2023, 1:50:39 PM
    Author     : ASUS
--%>

<%@page import="com.data.Connection1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
    </head>
    <body>
       <%
        String qty1=request.getParameter("qty");
           session.setAttribute("qty", qty1);
          if((String)session.getAttribute("val")!=null)
          {
              
             response.sendRedirect("buying_page.jsp");
          
          } 
           else
          {
          
          session.setAttribute("message", "buying_page.jsp");
 response.sendRedirect("login.jsp");
          }
       %>
        
    </body>
</html>
