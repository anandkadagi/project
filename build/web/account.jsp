<%-- 
    Document   : account
    Created on : Sep 25, 2023, 10:58:17 PM
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
        <%
            String name=(String)session.getAttribute("val");
        Connection1.Connection2();
         PreparedStatement pst=Connection1.con.prepareStatement("select * from user where username='"+name+"'");
        ResultSet rs=pst.executeQuery();
        rs.next();
        %>
        <div class="main_container">
            <div class="left_container">
                <div style="width: 100%;
    height: 30%;display: flex;align-items: center;justify-content: center;flex-direction: column; border-bottom: 1px solid">
                    <img src="Images/profile-user.png" height="100px" width="100px" />  
                    <p style="margin: 5px">Hello <%= rs.getString("Cust_name") %></p>
                </div>
                <div style="text-align: center">
                    <a href="orders.jsp" style="color: black"><h2>Orders</h2></a>
                </div>
            </div>
            <div class="right_container" style="display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: flex-start;
    height: 80vh;
   
   "> 
                <div style="width: 100%;display: flex;justify-content: center;align-items: center;">
                    <p style="width: 30%;font-size: 23px">Personal Information</p>
                    <a href="updateUser.jsp">  <p style="margin: 0px 5px;color: black">Edit</p></a>
                    <a href="updateUser.jsp">   <img src="Images/pencil.png" height="13px" width="13px" style="margin-left: 3px"/></a>
                </div>
                <h3 style="margin: 1% 10%;">Name :</h3>
                
                <div class="name"><%= rs.getString("Cust_name") %></div>
    <h3 style="margin: 1% 10%;">Contact :</h3>
                
                <div class="name"><%= rs.getString("Contact") %></div>
    <h3 style="margin: 1% 10%;">Email :</h3>
                
                <div class="name"><%= rs.getString("email") %></div>
    <h3 style="margin: 1% 10%;">Address :</h3>
                
                <div class="name"><%= rs.getString("Address") %></div>
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
