<%-- 
    Document   : cart_buy
    Created on : Dec 2, 2023, 1:34:00 PM
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
        <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
    </head>
    <body>
       <%
       int id=Integer.parseInt(request.getParameter("order_id"));
       String status="confirmed";
       Connection1.Connection2();
       
       PreparedStatement pst1=Connection1.con.prepareStatement("update orders set status='"+status+"' where order_id='"+id+"'");

       int x=pst1.executeUpdate();
       PreparedStatement pst2=Connection1.con.prepareStatement("delete from cart where order_id='"+id+"'");
       pst2.executeUpdate();
if(x>0)
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
