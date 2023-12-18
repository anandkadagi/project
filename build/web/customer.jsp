<%-- 
    Document   : customer
    Created on : Dec 7, 2023, 6:32:17 PM
    Author     : ASUS
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.data.Connection1"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="./CSS_file/Design.css" type="text/css"></link><!--
-->        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="navbar" style="background-color: #484766;box-shadow: 5px 5px 10px rgb(112 112 229 / 70%);">
        <div class="logo">
            <h1><span>Mel</span>odify</h1>
        </div>
            <div class="nav" style="width: 30%">
            <ul>
                 <%
                     if((String)session.getAttribute("val1")==null)
                     {
                     response.sendRedirect("login.jsp");
                     }
                    PrintWriter p=response.getWriter();
                    HttpSession s=request.getSession();
                    String name=(String)s.getAttribute("val1");
                   
 PreparedStatement pst=Connection1.con.prepareStatement("select * from user ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs=pst.executeQuery();
        
                %>
                <li><a href="/Melodify/admin.jsp">Home</a> </li>
               
                <li><a href="/Melodify/logout.jsp">Logout</a></li>
                <a href="/Melodify/account.jsp" style="text-decoration: none" > <div class="right" ><%= name%></div></a>
                  
                    
        </div>
    </div>
        <div style="height: 13vh"></div>
        <div class="main_container">
           
            <div class="products" style="margin-top: 2%;flex-direction: column;width: 100% ">
                <p style="font-size: 25px">Customers</p>
                 
                 <ul >
               <li class="li1">Customer Id</li>
                <li class="li1">Name</li>
                <li class="li1">Contact</li>
                <li class="li1">Email</li>
               <li class="li1">Address</li>
                
           </ul>
                <%
                   
                while(rs.next())
                {
                %>
                  <ul >
                      <li class="li2"><%= rs.getInt("Cust_id") %></li>
                <li class="li2"><%= rs.getString("Cust_name") %></li>
                <li class="li2"><%= rs.getString("Contact") %></li>
                <li class="li2"><%= rs.getString("email") %></li>
               <li class="li2"><%= rs.getString("Address") %></li>
                
           </ul>
                <%
                }
                %>
            </div>
        </div>
    </body>
</html>
