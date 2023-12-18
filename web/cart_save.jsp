<%-- 
    Document   : cart_save
    Created on : Dec 1, 2023, 12:45:07 PM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.data.Connection1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
    </head>
    <body>
         <%
           int user_id=(Integer.parseInt(request.getParameter("user_id")));
       int product_id=(Integer.parseInt(request.getParameter("product_id")));
        int total=(Integer.parseInt(request.getParameter("total")));
       int qty=(Integer.parseInt( (String)session.getAttribute("qty")));
        int discount=(Integer.parseInt(request.getParameter("discount")));
       Connection1.Connection2();
       PreparedStatement pst1=Connection1.con.prepareStatement("select *from user where Cust_id='"+user_id+"'");
        ResultSet rs1=pst1.executeQuery();
         PreparedStatement pst2=Connection1.con.prepareStatement("select *from products where product_id='"+product_id+"'");
        ResultSet rs2=pst2.executeQuery();
        rs1.next();
        rs2.next();
        String cust_name=rs1.getString("Cust_name");
        String product_name=rs2.getString("product_name");
         long millies=System.currentTimeMillis();
            java.sql.Date date=new java.sql.Date(millies);
            PreparedStatement pst3=Connection1.con.prepareStatement("insert into orders (cust_id,cust_name,product_id,product_name,"
                    + "amount,discount,qty,date,status )values(?,?,?,?,?,?,?,?,?)");
        pst3.setInt(1, user_id);
         pst3.setString(2, cust_name);
          pst3.setInt(3, product_id);
           pst3.setString(4, product_name);
            pst3.setInt(5, total);
              pst3.setInt(6, discount);
             pst3.setInt(7, qty);
              pst3.setDate(8, date);
               pst3.setString(9, "pending");
              pst3.executeUpdate();
              int qty_update=rs2.getInt("qty");
        int updated=qty_update-qty;
         PreparedStatement pst4=Connection1.con.prepareStatement("update products set qty='"+updated+"' where product_id='"+product_id+"'");
             pst4.executeUpdate();
             PreparedStatement pst5=Connection1.con.prepareStatement("select order_id from orders",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
             ResultSet rs5=pst5.executeQuery();
             rs5.last();
             int cart_id=rs5.getInt("order_id");
             PreparedStatement pst6=Connection1.con.prepareStatement("insert into cart (order_id) values(?)");
             pst6.setInt(1, cart_id);
             int x= pst6.executeUpdate();
         if (x > 0) {
               
        %>
        
        <script>

           
              swal({
  title: "Done",
  text: "Added to cart!",
  type: "success",
  confirmButtonText: "Ok"
},function()
{
    document.location="store.jsp";
});


        </script>    
        <%
                }
       %>
    </body>
</html>
