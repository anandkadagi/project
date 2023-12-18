<%-- 
    Document   : seller_record
    Created on : Dec 11, 2023, 7:57:02 PM
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
        <div class="navbar">
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
                   String name1=request.getParameter("name");
                   System.out.println(name1);
 PreparedStatement pst=Connection1.con.prepareStatement("select * from purchase_records where seller='"+name1+"' ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs=pst.executeQuery();
        pst=Connection1.con.prepareStatement("select sum(amount) as sum from purchase_records where seller='"+name1+"' ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs1=pst.executeQuery();
        rs1.next();
                %>
                <li><a href="/Melodify/admin.jsp">Home</a> </li>
               
                <li><a href="/Melodify/logout.jsp">Logout</a></li>
                <a href="/Melodify/account.jsp" style="text-decoration: none" > <div class="right" ><%= name%></div></a>
                  
                    
        </div>
    </div>
        <div style="height: 13vh"></div>
        <div class="main_container">
           
            <div class="products" style="margin-top: 2%;flex-direction: column;width: 100% ">
                <p style="font-size: 25px">Sellers</p>
                 
                 <ul >
               <li style="font-size: 18px;">Product Name</li>
                <li style="font-size: 18px;">Purchase price</li>
                <li style="font-size: 18px;">Quantity</li>
                
               <li style="font-size: 18px;">Amount</li>
               <li style="font-size: 18px;">Date</li>
             
                
           </ul>
                <%
                   
                while(rs.next())
                {
                   
                %>
                  <ul >
                     
                <li style="font-size: 18px;"><%= rs.getString("product_name") %></li>
                <li style="font-size: 18px;"><%= rs.getInt("purchase_price") %></li>
               
               <li style="font-size: 18px;"><%= rs.getInt("qty") %></li>
                <li style="font-size: 18px;"><%= rs.getInt("amount") %></li>
          <li style="font-size: 18px;"><%= rs.getDate("date") %></li>
              
               
           </ul>
                <%
                }
                %>
                <p style="font-size: 20px">Total Purchasing : <%= rs1.getInt("sum") %> /-</p>
            </div>
        </div>
    </body>
</html>

