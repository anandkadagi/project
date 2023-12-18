<%-- 
    Document   : orders
    Created on : Dec 5, 2023, 7:09:03 PM
    Author     : ASUS
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.data.Connection1"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>
    <body>
         <div class="navbar">
        <div class="logo">
            <h1><span>Mel</span>odify</h1>
        </div>
        <div class="nav">
            <ul>
                 <%
                    PrintWriter p=response.getWriter();
                    HttpSession s=request.getSession();
                    
                if((String)s.getAttribute("val")!=null)
                {
                String name=(String)s.getAttribute("val");
                %>
                <li><a href="/Melodify/">Home</a> </li>
                <li><a href="/Melodify/store.jsp">Store</a></li>
                <li><a href="/Melodify/cart.jsp">Cart</a></li>
                <li><a href="/Melodify/contact.jsp">Contact Us</a></li>
                <li><a href="/Melodify/about.jsp">About Us</a></li>
                <li><a href="/Melodify/logout.jsp">Logout</a></li>
                <a href="/Melodify/account.jsp" style="text-decoration: none" > <div class="right" ><%= name%></div></a>
                  <%
                }
else
{


                %>
                <li><a href="/Melodify/">Home</a> </li>
                <li><a href="/Melodify/store.jsp">Store</a></li>
                <li><a href="/Melodify/contact.jsp">Contact Us</a></li>
                <li><a href="/Melodify/about.jsp">About Us</a></li>
                <li><a href="/Melodify/login.jsp">Log In</a></li>
                <li><a href="/Melodify/signin.jsp">Sign Up</a></li>
            </ul>
                  <%
                    }
                    %>
        </div>
    </div>
        <div style="height: 13vh"></div>
        <%
        Connection1.Connection2();
        String status="confirmed";
        String status1="delivered";
        String name1=(String)s.getAttribute("val");
        System.out.println(name1);
         PreparedStatement pst2=Connection1.con.prepareStatement("select *from user where username='"+name1+"' ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs3=pst2.executeQuery();
        rs3.next();
        int user_id=rs3.getInt("Cust_id");
         PreparedStatement pst1=Connection1.con.prepareStatement("select *from orders where status='"+status+"' AND cust_id='"+user_id+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs1=pst1.executeQuery();
        pst1=Connection1.con.prepareStatement("select *from orders where status='"+status1+"' AND cust_id='"+user_id+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs4=pst1.executeQuery();
        rs1.next();
        rs4.next();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
Date d=rs4.getDate("date");
Date d3=rs1.getDate("date");
String d1=format.format(d);
String d4=format.format(d3);
Calendar cal=Calendar.getInstance();
Calendar cal1=Calendar.getInstance();
try
{
cal.setTime(sdf.parse(d1) );

}
catch(Exception e)
{
out.print(e);
}
try
{
cal1.setTime(sdf.parse(d4) );

}
catch(Exception e)
{
out.print(e);
}
 cal.add(Calendar.DAY_OF_MONTH, 3);
  cal1.add(Calendar.DAY_OF_MONTH, 3);
String d2=sdf.format(cal.getTime());
String d5=sdf.format(cal1.getTime());
rs1.beforeFirst();
        while(rs1.next())
        {
            int order_id=rs1.getInt("order_id");
            int id=rs1.getInt("product_id");
            pst1=Connection1.con.prepareStatement("select *from products where product_id='"+id+"'");
        ResultSet rs2=pst1.executeQuery();
        rs2.next();
        %>
        <div class="right_container" style="background-color: white">
            <div class="main_order" style="height: max-content;display: flex; justify-content: center;margin: 2%;width: 60%;background-color: ghostwhite">
             <div class="order_img" style="height: 37vh;width:  30%">
                 <img src="Images/<%= rs2.getString("image") %>" height="80%" width="70%" style="border-radius: 10px" />
             </div>
                <div class="order_info" style="height: max-content;width: 70%;">
                        <p style="    font-size: 30px;
    font-weight: 800;
    text-align: left;
    margin: 15px 20px;"><%= rs1.getString("product_name") %></p>
                
                        <h1 style="display: inline-block;    margin: 0px 22px; color: green">Rs.<%= rs1.getInt("amount") %> /-</h1>
                <h2 style="display: inline-block;    margin: 0px 22px; color: green"><%= rs1.getInt("discount") %> /-</h2>
                        <h3 style="margin: 0px 22px;">QTY : <%= rs1.getInt("qty") %> </h3>
                <h4 style="margin: 0px 22px;">Delivered Upto : <%= d5 %> </h4>
                       <%
                       out.print("<a href='cancel.jsp?id="+order_id+"'><button class='submit' style='display: flex' id='order'>Cancel Order</button></a>");
                       %> 
                    </div>
                </div></div>
        <%
        }
rs4.beforeFirst();
while(rs4.next() )
{

int id=rs4.getInt("product_id");


pst1=Connection1.con.prepareStatement("select *from products where product_id='"+id+"'");
        ResultSet rs2=pst1.executeQuery();
        rs2.next();
%>
      <div class="right_container" style="background-color: white">
            <div class="main_order" style="height: max-content;display: flex; justify-content: center;margin: 2%;width: 60%;background-color: ghostwhite">
             <div class="order_img" style="height: 37vh;width:  30%">
                 <img src="Images/<%= rs2.getString("image") %>" height="80%" width="70%" style="border-radius: 10px" />
             </div>
                <div class="order_info" style="height: max-content;width: 70%;">
                        <p style="    font-size: 30px;
    font-weight: 800;
    text-align: left;
    margin: 15px 20px;"><%= rs4.getString("product_name") %></p>
                
                        <h1 style="display: inline-block;    margin: 0px 22px; color: green">Rs.<%= rs4.getInt("amount") %> /-</h1>
                <h2 style="display: inline-block;    margin: 0px 22px; color: green"><%= rs4.getInt("discount") %> /-</h2>
                        <h3 style="margin: 0px 22px;">QTY : <%= rs4.getInt("qty") %> </h3>
                 <h4 style="margin: 5px 22px;">Order Placed on : <%= d1 %> </h4>
                  <h4 style="margin: 5px 22px;">Delivered on : <%= d2 %> </h4>      
                    </div>
                </div></div>   
        <%
}
        %>
        
       <div class ="footer">
            <div class="sub_footer1">
                <div class="footer_cont">
                     <h4>Contact us</h4>
                <h3>+91-8459438131</h3>
                </div>
                
            </div>
            <div class="sub_footer2">
                <h2>Store Information</h2>
                <h3>About us</h3>
                <h3>Buy with Confidence</h3>
                <h3>Privacy Policy</h3>
                <h3>Terms of Use</h3>
                <h3>Service Centre</h3>
                 <h4>Copyright@Melodify</h4>
            </div>
            <div class="sub_footer3">
                 <h2>Service & Support</h2>
                <h3>Order Lookup</h3>
                <h3>View manufacturer</h3>
                <h3>Contact us</h3>
                <h3>Shopping</h3>
                <h3>Gaurantee plan</h3>
                
            </div>
            
        </div>
        <script>
           setTimeout(function()
           {
               $("button").remove();
               
           },86400000);
        </script>
    </body>
</html>
