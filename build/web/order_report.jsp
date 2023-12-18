<%-- 
    Document   : order_report
    Created on : Dec 6, 2023, 1:13:38 PM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
 <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
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
                Connection1.Connection2();
                String status1="delivered";
                String status2="cancelled";
                PreparedStatement pst=Connection1.con.prepareStatement("select *  from orders where status='"+status1+"' OR status='"+status2+"'");
        ResultSet rs=pst.executeQuery();
                %>
                <li><a href="/Melodify/admin.jsp">Home</a> </li>
               
                <li><a href="/Melodify/logout.jsp">Logout</a></li>
                <a href="/Melodify/account.jsp" style="text-decoration: none" > <div class="right" ><%= name%></div></a>
                  
                    
        </div>
    </div>
        <div style="height: 13vh"></div>
        <div class="products">
            <button class="submit" onclick="showModel1() ">Monthly Report</button>
            <dialog id="x">
                <form action="monthly_report.jsp" method="post">
                    Select Month :
                    <input type="month" name="month" required="" />
                    <input type="submit" value="Submit"/>
                    
                </form>
                
            </dialog>
            <button class="submit" onclick="showModel2()">Yearly Report</button>
             <dialog id="y">
                <form action="yearly_report.jsp" method="post">
                    Select year :
                    <input type="month" name="year" required="" />
                    <input type="submit" value="Submit"/>
                    
                </form>
                
            </dialog>
        </div>
        <div class="products"  style="margin: 2% 0%;color: #d9d9f3">
            
            <ul >
                <li class="li1">Order id</li>
                <li class="li1">Product Name</li>
                <li class="li1">Customer Name</li>
                <li class="li1">Amount</li>
                <li class="li1">Date</li>
                <li class="li1">QTY</li>
                <li class="li1">Status</li>
                
            </ul>
            <%
                
            while(rs.next())
            {
                %>
             <ul >
    <li class="li2"><%= rs.getInt("order_id")%></li>
                 <li class="li2"><%= rs.getString("product_name")%></li>
                 <li class="li2"><%= rs.getString("cust_name")%></li>
                 <li class="li2"><%= rs.getInt("amount")%></li>
                  <li class="li2"><%= rs.getDate("date")%></li>
               <li class="li2"><%= rs.getInt("qty")%></li>
                <li class="li2"><%= rs.getString("status")%></li>
            </ul>
                <%
            }
            %>
        </div>
        <script>
            function showModel1()
            {
                var val=document.getElementById("x");
                val.showModal();
              
            }
            function showModel2()
            {
                var val=document.getElementById("y");
                val.showModal();
              
            }
            
        </script>
    </body>
</html>
