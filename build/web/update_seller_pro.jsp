<%-- 
    Document   : update_seller_pro
    Created on : Dec 11, 2023, 7:37:15 PM
    Author     : ASUS
--%>

<%@page import="java.sql.PreparedStatement"%>
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
       String id=request.getParameter("id");
       String name=request.getParameter("name");
        String contact=request.getParameter("contact");
         String email=request.getParameter("email");
          String address=request.getParameter("address");
          PreparedStatement pst=Connection1.con.prepareStatement
        ("update sellers set seller_name='"+name+"',contact='"+contact+"',email='"+email+"',Address='"+address+"' where seller_id='"+id+"'");
        pst.executeUpdate();
        response.sendRedirect("sellers.jsp");
        %>
    </body>
</html>
