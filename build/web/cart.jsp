<%-- 
    Document   : cart
    Created on : Oct 26, 2023, 10:12:59 PM
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
 <script>
            window.location.reload();
            break;
        </script>
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
        <div style="height: 13vh">
            
        </div>
         <div class="main_container" >
             
            <div class="right_container" style="border: none;background-color: white;    display: flex;
    flex-direction: column;
    
    align-items: center; width: 70%">
       
        <%
        Connection1.Connection2();
        PreparedStatement pst=Connection1.con.prepareStatement("select *from cart order by order_id desc",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs=pst.executeQuery();
        if(rs.next()){
            rs.beforeFirst();
        while(rs.next())
        {
            int id=rs.getInt("order_id");
            
             PreparedStatement pst1=Connection1.con.prepareStatement("select *from orders where order_id='"+id+"'");
        ResultSet rs1=pst1.executeQuery();
         
        rs1.next();
        int pro_id=rs1.getInt("product_id");
        PreparedStatement pst2=Connection1.con.prepareStatement("select *from products where product_id='"+pro_id+"'");
        ResultSet rs2=pst2.executeQuery();
        rs2.next();
        %>
         <div class="main_order" style="height: max-content;justify-content: center;margin: 2%;width: 60%;background-color: ghostwhite">
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
                <%
                out.print( "<a href='cart_buy.jsp?order_id="+id+"'><button class='submit' style='margin: 20px' >Buy</button></a>" );
                out.print( "<a href='cart_remove.jsp?order_id="+id+"'><button class='submit' style='margin: 20px' >Remove</button></a>" );
                %>
                 
                    </div>
                </div>
                <%
        }
}
else
{
%>
<img src="Images/empty-cart.png" height="200px" width="200px" style="align-items: center"/>
<h1 style="font-family: sans-serif;font-size: xxx-large">No Items In A Cart</h1>
                <%
}
        %>
           
                
           </div>
        <div class="left_container" style="width: 30%;align-items: center">
                
            <%
                String status="pending";
            PreparedStatement pst3=Connection1.con.prepareStatement("select sum(amount) as sum,sum(discount) as discount from orders where status='"+status+"'");
        ResultSet rs3=pst3.executeQuery();
        rs3.next();
        PreparedStatement pst4=Connection1.con.prepareStatement("select count(order_id) as c from cart");
        ResultSet rs4=pst4.executeQuery();
        rs4.next();
            %>
            <p style="text-align: center;font-size: 30px">Total Amount : <%= rs3.getInt("sum") %> /-</p>
            <p style="text-align: center;font-size: 30px">Total Discount : <%= rs3.getInt("discount") %> /-</p>
             <p style="text-align: center;font-size: 30px">Total Items : <%= rs4.getInt("c") %> </p>
             <a href="buy_all.jsp"> <button class="submit" style="width: 80%">Buy Now</button> </a>
             <a href="clear.jsp">  <button class="submit" style="width: 80%">Clear Cart</button></a>
             
            </div>
        </div>
        
       
         <div class ="footer">
            <div class="sub_footer1">
                <div class="footer_cont">
                     <h4>Contact us</h4>
                <h3>+91-8459438131</h3>
                </div>
                
            </div>
            <div class="sub_footer2">
                <h2>Store Information</h2>
                <h4>About us</h4>
                <h4>Buy with Confidence</h4>
                <h4>Privacy Policy</h4>
                <h4>Terms of Use</h4>
                <h4>Service Centre</h4>
                 <h5>Copyright@Melodify</h5>
            </div>
            <div class="sub_footer3">
                 <h2>Service & Support</h2>
                <h4>Order Lookup</h5>
                <h4>View manufacturer</h5>
                <h4>Contact us</h5>
                <h4>Shopping</h5>
                <h4>Gaurantee plan</h5>
                
            </div>
            
        </div>
       
    </body>
</html>
