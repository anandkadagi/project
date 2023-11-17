<%-- 
    Document   : login_process
    Created on : Sep 23, 2023, 9:34:40 AM
    Author     : ASUS
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.data.Connection1" %>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        
    </head>
    <body>
        <%
            try{
             String name=request.getParameter("name");
        String pass=request.getParameter("password");
       
        Connection1.Connection2();
        Statement st=Connection1.con.createStatement();
         Statement st1=Connection1.con.createStatement();
        ResultSet rs=st.executeQuery("select * from user where username='"+name+"' and password='"+pass+"'");
        ResultSet rs1=st1.executeQuery("select * from admin where username='"+name+"' and password='"+pass+"'");
       if(rs.next())
       {
        if(name.equals(rs.getString("username")) && pass.equals(rs.getString("password")))
        {
        
        session.setAttribute("val",name );
        
        response.sendRedirect("index.jsp");
        }
       }
       
        
        if(rs1.next())
       {
        if(name.equals(rs1.getString("username")) && pass.equals(rs1.getString("password")))
        {
       
        session.setAttribute("val",name );
        
        response.sendRedirect("admin.jsp");
        }
       }
        else
       {
           %>
            <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
           <script>
               swal({
    title:"Failed",
    text:"Please enter correct username or password",
    type:"error",
   timer:10000,
   showConfirmButton:true
},function()
{
    document.location="login.jsp";
});
           </script>
        <%
         
    
       }
            }
            catch(Exception e)
            {
            System.out.println(e);
            }
       
        %>
        
        
    </body>
</html>
