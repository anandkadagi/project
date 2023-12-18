<%-- 
    Document   : cart_remove
    Created on : Dec 2, 2023, 1:53:31 PM
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
       
       Connection1.Connection2();
       
       
       PreparedStatement pst2=Connection1.con.prepareStatement("delete from cart where order_id='"+id+"'");
       pst2.executeUpdate();
      PreparedStatement pst3=Connection1.con.prepareStatement("delete from orders where order_id='"+id+"'");
       int x= pst3.executeUpdate();
if(x>0)
{
    
%>
        <script>

           
              swal({
  title: "Done",
  text: "Item Removed Successsfully!",
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
