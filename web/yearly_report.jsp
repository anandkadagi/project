<%-- 
    Document   : yearly_report
    Created on : Dec 7, 2023, 12:52:07 PM
    Author     : ASUS
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                    String month=request.getParameter("year");
                    System.out.println(month);
                    SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM");
                     Date date = inputDateFormat.parse(month);
                     
                    
   SimpleDateFormat outputMonthFormat1 = new SimpleDateFormat("YYYY");
                      String year = outputMonthFormat1.format(date);
                      System.out.println(year);
                Connection1.Connection2();
                String status1="delivered";
                String status2="cancelled";
                  PreparedStatement pst=Connection1.con.prepareStatement("select *  from orders where status='"+status1+"' OR status='"+status2+"' INTERSECT select *  from orders where  YEAR(date)='"+year+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs=pst.executeQuery();
           PreparedStatement          pst1=Connection1.con.prepareStatement("select count(order_id) as orders,sum(if(status='"+status1+"',amount,0)) as total ,sum(status='"+status1+"') as stat1 ,sum(status='"+status2+"') as stat2 from orders where (status='"+status1+"' OR status='"+status2+"') AND (YEAR(date)='"+year+"')"
                     ,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs1=pst1.executeQuery();
                %>
                <li><a href="/Melodify/admin.jsp">Home</a> </li>
               
                <li><a href="/Melodify/logout.jsp">Logout</a></li>
                <a href="/Melodify/account.jsp" style="text-decoration: none" > <div class="right" ><%= name%></div></a>
                  
                    
        </div>
    </div>
        <div style="height: 13vh"></div>
        <div class="main_container">
           
                 <div class="products" style="margin-top: 2%;flex-direction: column;width: 40% ">
                 <ul >
               <li class="li1">Orders</li>
                <li class="li1">Sales</li>
                <li class="li1">Delivered</li>
                <li class="li1">Cancelled</li>
               
                
            </ul>
                <%
                   
                    while(rs1.next())
            {
                %>
             <ul >
    <li class="li2"><%= rs1.getInt("orders")%></li>
    <li class="li2"><%= rs1.getInt("total")%></li>
                 <li class="li2"><%= rs1.getInt("stat1")%></li>
                 <li class="li2"><%= rs1.getInt("stat2")%></li>
                  
            </ul>
                <%
            
                    }
            
            %>
            </div>
           
            <div class="products" style="margin-top: 2%;flex-direction: column;width: 60% ">
                 <ul style="width: 90%">
               <li class="li1">Order id</li>
                <li class="li1">Product Name</li>
                <li class="li1">Customer Name</li>
                <li class="li1">Amount</li>
                <li class="li1">Date</li>
                <li class="li1">QTY</li>
                <li class="li1">Status</li>
                
            </ul>
                <%
                    if(rs.next())
                    {
                        rs.beforeFirst();
                    while(rs.next())
            {
                %>
             <ul style="width: 90%">
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
                    }
            else
{
%>
                <img src="Images/document.png" height="200px" width="200px" style="align-items: center"/>
<h1 style="font-family: sans-serif;font-size: xx-large">No Records</h1> 
                <%
}
            %>
            </div>
        </div>
    </body>
</html>
