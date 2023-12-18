<%-- 
    Document   : login_update_admin_process
    Created on : Dec 12, 2023, 8:00:32 PM
    Author     : ASUS
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.data.Connection1"%>
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
        String pass1=request.getParameter("password1");
        String pass2=request.getParameter("password2");
        String n=(String)session.getAttribute("num");
        System.out.println(pass1);
        System.out.println(n);
        if(pass1.equals(pass2))
        {
         PreparedStatement pst=Connection1.con.prepareStatement("update admin set password='"+pass1+"' where contact='"+n+"'");
         pst.executeUpdate();
         %>
         <script>
             swal({
  title: "Done",
  text: "Password Updated Successfully",
  type: "success",
  confirmButtonText: "Ok"
},function()
{
    document.location="login.jsp";
});
         </script>
        <%
        }
else
{
%>
       <script>
             swal({
  title: "Error",
  text: "Password mismatched",
  type: "error",
  confirmButtonText: "Ok"
},function()
{
    document.location="login_Update_admin.jsp";
});
         </script>  
         <%
}
        %>
    </body>
</html>
