<%-- 
    Document   : update_pro_process
    Created on : Dec 9, 2023, 7:04:54 PM
    Author     : ASUS
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
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
       int id=Integer.parseInt(request.getParameter("id"));
       String p_name=request.getParameter("name");
      int p_price=Integer.parseInt(request.getParameter("p_price"));
       int s_price=Integer.parseInt(request.getParameter("s_price"));
       int qty=Integer.parseInt(request.getParameter("qty"));
       int dis=Integer.parseInt(request.getParameter("discount"));
       String category=request.getParameter("category");
        String brand=request.getParameter("brand");
        String d=request.getParameter("date");
        String seller=request.getParameter("seller");
       
        Date date=Date.valueOf(d);
        int amount=p_price*qty;
        Connection1.Connection2();
        PreparedStatement pst=Connection1.con.prepareStatement("select * from products");
        ResultSet rs=pst.executeQuery();
        rs.next();
       int product_qty=rs.getInt("qty");
       int final_qty=product_qty+qty;
          pst=Connection1.con.prepareStatement("update products set product_name='"+p_name+"',purchase_price='"+p_price+"', selling_price='"+s_price+"',qty='"+final_qty+"',discount='"+dis+"',category='"+category+"',brand='"+brand+"' where product_id='"+id+"'");
        pst.executeUpdate();
        pst=Connection1.con.prepareStatement("insert into purchase_records(product_name,purchase_price,qty,amount,date,seller) values(?,?,?,?,?,?)");
       pst.setString(1, p_name);
       pst.setInt(2, p_price);
       pst.setInt(3, qty);
       pst.setInt(4,amount );
       pst.setDate(5, date);
       pst.setString(6, seller);
        pst.executeUpdate();
        response.sendRedirect("products.jsp");
       %>
    </body>
</html>
