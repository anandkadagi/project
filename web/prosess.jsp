<%-- 
    Document   : prosess.jsp
    Created on : Sep 22, 2023, 5:21:19 PM
    Author     : ASUS
--%>

<%@page import="java.util.regex.Matcher"%>

<%@page import="java.util.regex.Pattern"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.data.Connection1" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
         
        
        <link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%

            try {
               
                PrintWriter p1 = response.getWriter();
                String name = request.getParameter("name");
                String uname = request.getParameter("uname");
                String contact = request.getParameter("contact");
                String mail = request.getParameter("mail");
                String pass = request.getParameter("password");
                String address = request.getParameter("address");
                 

                
 

      
           

            Class.forName("com.mysql.jdbc.Driver");
            Connection1.Connection2();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodify", "root", "");
            PreparedStatement p = Connection1.con.prepareStatement("insert into user(Cust_name,username,Contact,email,Address,password) values(?,?,?,?,?,?)");

            p.setString(1, name);
            p.setString(2, uname);
            p.setString(3, contact);
            p.setString(4, mail);
            p.setString(5, address);
            p.setString(6, pass);

            int x = p.executeUpdate();

            if (x > 0) {
                HttpSession s = request.getSession();
                s.setAttribute("val", uname);
                System.out.println("Successfull");
        %>
        <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
        <script>

           
              swal({
    title:"Success",
    text:"You registered successfully!!!",
    type:"success",
   timer:10000,
   showConfirmButton:true
},function()
{
    document.location="store.jsp";
});


        </script>    
        <%
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

        %>

    </body>
</html>
