<%-- 
    Document   : save_products
    Created on : Dec 9, 2023, 9:00:07 PM
    Author     : ASUS
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.data.Connection1"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
       String name=request.getParameter("name");
       int p_price=Integer.parseInt(request.getParameter("p_price"));
       int s_price=Integer.parseInt(request.getParameter("s_price"));
       int qty=Integer.parseInt(request.getParameter("qty"));
       int dis=Integer.parseInt(request.getParameter("discount"));
      String category=request.getParameter("selection2");
      String brand=request.getParameter("selection1");
      String seller=request.getParameter("selection3");
      String date=request.getParameter("date");
      
      Date d=Date.valueOf(date);
      Part file=request.getPart("img");
            String path=file.getSubmittedFileName();
      Connection1.Connection2();
         PreparedStatement pst=Connection1.con.prepareStatement
        ("insert into products values(?,?,?,?,?,?,?,?,?,?)");
         pst.setString(1, name);
         pst.setInt(2, p_price);
         pst.setInt(3, s_price);
         pst.setDate(4, d);
         pst.setInt(5, dis);
         pst.setInt(6, qty);
         pst.setString(7,category);
          pst.setString(8,path);
          pst.setString(9,brand);
            pst.setString(10,seller);
        pst.executeUpdate();
        response.sendRedirect("admin.jsp");
       %>
    </body>
</html>
