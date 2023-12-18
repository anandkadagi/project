<%-- 
    Document   : verification.jsp
    Created on : Oct 8, 2023, 5:39:36 PM
    Author     : ASUS
--%>

<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.data.Connection1" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
             try
             {
             String num=request.getParameter("num");
             
      Connection1.Connection2();
      Statement st=Connection1.con.createStatement();
       Statement st2=Connection1.con.createStatement();
      ResultSet rs1=st.executeQuery("select * from user where Contact='"+num+"'");
      ResultSet rs2=st2.executeQuery("select* from admin where Contact='"+num+"'");
      session.setAttribute("num", num);
      if(rs1.next())
      {
      response.sendRedirect("login_Update_user.jsp");
      
      }
        if(rs2.next())
      {
      response.sendRedirect("login_Update_admin.jsp");
      }
        else
        {
        
        %>
        <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
        <script>


swal({
    title:"Failed",
    text:"Please enter correct password",
    type:"error",
   timer:10000,
   showConfirmButton:true
},function()
{
    document.location="forgot.jsp";
});
        </script> 
        <%
        }
             }
             catch(Exception e)
             {
             out.println(e);
             }
       
       %>
    </body>
</html>
