<%-- 
    Document   : buying_page
    Created on : Nov 17, 2023, 10:13:22 PM
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
        <title>buy</title>
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
        <%
        Connection1.Connection2();
       
          
         String username=(String)session.getAttribute("val");
          String product_id=(String)session.getAttribute("product_id");
            
            
         
           PreparedStatement pst1=Connection1.con.prepareStatement("select *from user where username='"+username+"'");
        ResultSet rs1=pst1.executeQuery();
         PreparedStatement pst2=Connection1.con.prepareStatement("select *from products where product_id='"+product_id+"'");
        ResultSet rs2=pst2.executeQuery();
rs1.next();
rs2.next();

 int s_price=rs2.getInt("selling_price");
      int dis=rs2.getInt("discount");
     
    int  val=s_price-(((s_price)*(dis))/100);
   
    String qty=(String)session.getAttribute("qty");
   int total=(Integer.parseInt(qty)) * val ;
   int final_qty=(Integer.parseInt(qty));
   int dis_price=(s_price-val) * final_qty;
   int user_id=rs1.getInt("Cust_id");
   int pro_id=rs2.getInt("product_id");
   
        %>
        <div style="height: 13vh"></div>
        <div class="main_order_summary" >
            <div class="order_summary" style="" >
                <p    style=" text-align: center;
    font-size: 1.5rem;
    margin: 5px;
    font-family: serif;
    border-bottom: 1px solid #ca8eff;
    letter-spacing: 5px;">Personal Information</p>
                <p style="display: inline-block ; width: 70%" >Name:</p><a href="updateUser.jsp" style="text-decoration: none;color: black"> <h4 style="    display: inline-block;
    margin: 0px;
    font-weight: 100;
    letter-spacing: 3px;">Edit</h4>
                <img src="Images/pencil.png" height="13px" width="13px" style="margin-left: 3px"/></a>
                <p><%= rs1.getString("cust_name") %></p>
                <br>
                <p>Contact info:</p>
                <p><%= rs1.getString("contact") %></p>
                <br>
                <p>Email:</p>
                <p><%= rs1.getString("email") %></p>
                <br>
                <p>Address:</p>
                <p><%= rs1.getString("Address") %></p>
            </div>
            <div class="order_summary1">
                <p style=" text-align: center;
    font-size: 1.5rem;
    margin: 5px;
    font-family: serif;
    border-bottom: 1px solid #ca8eff;
    letter-spacing: 5px;">Order Summary</p>
                <div style="height: 90%;
    width: 100%;
   
    display: flex">
                    <div style="    height: 100%;
    width: 35%;
    display: flex;
    align-items: center;
    justify-content: center;
        border: 19px solid #938a8f;
    ">
                        <img src="Images/<%= rs2.getString("image") %>" height="180px" width="180px"/>
                    </div>
    <div style="    height: 100%;
    width: 70%;
    margin-left: 4%;
    ">
        <h2><%= rs2.getString("product_name") %></h2>
        <h3 style="display: block">Price :</h3><h4 style="display: block">Rs. <%= val %> /-</h4>
         <h3 style="display: block">Discount :</h3><h4 style="display: block; color: green">Rs. <%= dis_price %> /-</h4>
        <h3 style="display: block">quantity :</h3><h4 style="display: block"> <%= qty%></h4>
       <h3 style="display: block">Grand Total :</h3><h4 style="display: block; color: green">Rs. <%= total%> /-</h4>
       <h3 style="display: block; ">Mode of Payment : Cash on delivery</h4>
       <%
       out.print( "<a href='order_save.jsp?product_id="+pro_id+"&user_id="+user_id+"&total="+total+"&qty="+final_qty+"&discount="+dis_price+"'><button class='submit' style='margin: 20px' >Confirm Order</button></a>" );
       %>
      
    </div>
                </div>
            </div>
        </div>
        <%
       
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
