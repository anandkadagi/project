<%-- 
    Document   : buy_all
    Created on : Dec 2, 2023, 4:05:49 PM
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
       Connection1.Connection2();
       PreparedStatement pst3=Connection1.con.prepareStatement("select * from cart");
        ResultSet rs3=pst3.executeQuery();
        int x=0;
        while(rs3.next())
        {
        int id=rs3.getInt("order_id");
        String status="confirmed";
         pst3=Connection1.con.prepareStatement("update orders set status='"+status+"' where order_id='"+id+"'");
        x=  pst3.executeUpdate();
       
        }
        pst3=Connection1.con.prepareStatement("delete from cart");
        pst3.executeUpdate();
       if(true)
       {
       %>
        <script>

           
              swal({
  title: "Done",
  text: "Order Placed Successsfully!",
  type: "success",
  confirmButtonText: "Ok"
},function()
{
   document.location="cart.jsp";
});


        </script> 
        <%
       }
        %>
       
        
      
    </body>
</html>
