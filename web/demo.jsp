<%-- 
    Document   : demo
    Created on : Nov 7, 2023, 4:31:08 PM
    Author     : ASUS
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.data.Connection1"%>
<%@page import="java.sql.Date"%>
<%@page import="javax.servlet.http.Part"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            Part file=request.getPart("image");
            String path=file.getSubmittedFileName();
           String category=request.getParameter("category");
         
      String name=request.getParameter("p_name");
      int p_price=Integer.parseInt(request.getParameter("purchase_price"));
     
      int s_price=Integer.parseInt(request.getParameter("selling_price"));
      String d=request.getParameter("date1");
      int dis=Integer.parseInt(request.getParameter("discount"));
      int qty=Integer.parseInt(request.getParameter("qty"));
     
      Date date=Date.valueOf(d);
      Connection1.Connection2();
      PreparedStatement pst=Connection1.con.prepareStatement("insert into products(product_name,purchase_price,selling_price,date,discount,qty,category) values(?,?,?,?,?,?,?,?)");
      pst.setString(1, name);
      pst.setInt(2, p_price);
      pst.setInt(3, s_price);
      pst.setDate(4, date);
      pst.setInt(5, dis);
      pst.setInt(6, qty);
      pst.setString(7,category);
      pst.setString(8, path);
      pst.executeUpdate();
       %>
    </body>
</html>
