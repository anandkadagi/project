<%-- 
    Document   : order_page.jsp
    Created on : Nov 16, 2023, 10:43:43 PM
    Author     : ASUS
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.data.Connection1"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>order_page</title>
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
             String id=request.getParameter("name");
            String product_id=id.substring(1, (id.length()-1));
            
    Connection1.Connection2();
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/melodify", "root", "");
        PreparedStatement pst1=con.prepareStatement("select *from products where product_id='"+product_id+"'");
        ResultSet rs1=pst1.executeQuery();
        while(rs1.next()){
             int s_price=rs1.getInt("selling_price");
      int dis=rs1.getInt("discount");
     
    int  val=s_price-(((s_price)*(dis))/100);
           %>
        <div class="main_order">
            <div class="order_img">
                <img src="Images/<%= rs1.getString("image") %>" height="80%" width="70%" style="border-radius: 10px" />
            </div>
            <div class="order_info">
                <p style="    font-size: xxx-large;
    font-weight: 800;
    text-align: left;
    margin-left: 10%;"><%= rs1.getString("product_name") %></p>
                <p style="color: green; margin-left: 7px;margin-bottom: 0px">Special Price</p>
                <h1 style="display: inline-block;    margin: 0px 22px; color: green">Rs.<%= val %></h1>
                <h4 style="display: inline-block;margin: 0px 15px;text-decoration: line-through; color: red">Rs.<%= s_price%></h4>
                <h5 style="display: inline-block;color: green">(<%= dis%> %off)</h5><br>
                <form>
                    <h4 style="display: inline-block">Qty</h4>: <input style="height: 40px;width: 70px" type="number" name="qty" value="1" />
                </form>
                <button class="submit"><img src="Images/shopping-bag.png" height="23px" width="23px"/> Buy Now</button>
                <button class="submit"><img src="Images/cart.png" height="23px" width="23px"/> Add to Cart</button>
                <p style="font-size: xx-large;
    font-weight: 800;
    text-align: left;
    margin-left: 7%;">✬ Specifications</p>
            </div> 
        </div>
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
