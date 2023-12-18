<%-- 
    Document   : updateprocess
    Created on : Dec 5, 2023, 6:56:32 PM
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
           String uname=(String)session.getAttribute("val");
        String name = request.getParameter("name");
               
                String contact = request.getParameter("contact");
                String mail = request.getParameter("mail");
                
                String address = request.getParameter("address");
                  Connection1.Connection2();
           
            PreparedStatement p = Connection1.con.prepareStatement("update user set Cust_name='"+name+"',Contact='"+contact+"',email='"+mail+"',Address='"+address+"' where username='"+uname+"'");
           int x= p.executeUpdate();
           
           if(x>0)
           {
               
           %>
        <script>

           
              swal({
  title: "Done",
  text: "User Updated Successfully!",
  type: "success",
  confirmButtonText: "Ok"
},function()
{
    document.location="account.jsp";
});


        </script>     
        <%
             out.print("H");
           }
       %>
    </body>
</html>
