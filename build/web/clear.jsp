<%-- 
    Document   : clear
    Created on : Dec 2, 2023, 4:26:33 PM
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
       
        while(rs3.next())
        {
        int id=rs3.getInt("order_id");
       
         pst3=Connection1.con.prepareStatement("delete from orders where order_id='"+id+"'");
          pst3.executeUpdate();
       
        }
       PreparedStatement pst=Connection1.con.prepareStatement("delete from cart");
      int x= pst.executeUpdate();
      if(x>0)
{
    
%>
        <script>

           
              swal({
  title: "Done",
  text: "Cart is Cleared!",
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
        %>
    </body>
</html>
