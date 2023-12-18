<%-- 
    Document   : cancel
    Created on : Dec 16, 2023, 5:26:26 PM
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
      String  id=request.getParameter("id");
      String status="cancelled";
      Connection1.Connection2();
      PreparedStatement pst1=Connection1.con.prepareStatement("update orders set status='"+status+"' where order_id='"+id+"'");
      int x= pst1.executeUpdate();
      if(x>0)
{
%>
         <script>

           
              swal({
  title: "Done",
  text: "Welcome...!",
  type: "success",
  confirmButtonText: "Ok"
},function()
{
    document.location="orders.jsp";
});


        </script>  
        <%
}
%>
    </body>
</html>
