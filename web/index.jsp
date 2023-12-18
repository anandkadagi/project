<%-- 
    Document   : index.jsp
    Created on : Sep 21, 2023, 1:42:01 PM
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
    </head>
    <body>
        
        <div class="navbar" style="background-color: #b5b4b5;background-image: none">
        <div class="logo">
            <h1><span>Mel</span>odify</h1>
        </div>
        <div class="nav">
            <ul>
                 <%
                      System.out.println("Hello");
                    PrintWriter p=response.getWriter();
                    HttpSession s=request.getSession();
                    
                if((String)s.getAttribute("val")!=null)
                {
                String name=(String)s.getAttribute("val");
                System.out.println(name);
                %>
                <li><a href="/Melodify/">Home</a> </li>
                <li><a href="/Melodify/store.jsp">Store</a></li>
                <li><a href="/Melodify/cart.jsp">Cart</a></li>
                <li><a href="/Melodify/contact.jsp">Contact Us</a></li>
                <li><a href="/Melodify/about.jsp">About Us</a></li>
                <li><a href="/Melodify/logout.jsp">Logout</a></li>
                <a href="/Melodify/account.jsp"  style="text-decoration: none"> <div class="right"><%= name%></div></a>
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
         
    <div class="container1">
       
        <div class="sub_container1">
            <div class="slogan">
                <h1 style="font-size: 75px; margin: 0px;"><span>Mel</span>odify</h1>
                <h2 style=" margin: 0px;">Let your music speaks with our <span1>Syrinx</span1></h2>
                <button  class="btn"> <a href="store.jsp">Explore -></a></button>
            </div>
           
        </div>
        <div class="sub_container2">
            <img src="Images/search_icon.png" style="    height: 5vh;
    
    margin-top: 9vh;
    margin-right: 5%;">
            <form style="width: 100%" action="category_products.jsp" method="post">
            <input type="text" name="search"  style="margin-top: 8% ;height: 22%" class="search_bar" autocomplete="off" placeholder="Search Products,Brands" />
            
            <button class="submit" style="height: 22%;
    margin-top: 8%;">Search</button>
     </form>
            <div class="search_menu1" >
               
            </div>
    </div>
       
    </div>
        
        <div class="box">
         <h4>✯</h4> <h3>✯</h3> <h2>✯</h2> <h1>  TOP CATEGORY  </h1><h2>✯</h2><h3>✯</h3><h4>✯</h4>
        </div>
        <div class="cards">
             <%
        Connection1.Connection2();
      PreparedStatement pst=Connection1.con.prepareStatement("select * from category");
      ResultSet rs=pst.executeQuery();
      while(rs.next()){
          String category=rs.getString("category_name");
          
          String path1="category_products.jsp?search='"+category+"' ";
        %>
            <div class="sub_card">
                <div class="sub_img"><a href=<%= path1%>> <img src="Images/<%= rs.getString("category_img")%>" /> </a></div>
                <div class="sub_text" id="guitar"><h4><%= rs.getString("category_name")%></h4></div>
            </div>
            <%
            }
            %>
             
                  
        </div>
        <div class="box">
         <h4>✯</h4> <h3>✯</h3> <h2>✯</h2> <h1>  TOP BRANDS  </h1><h2>✯</h2><h3>✯</h3><h4>✯</h4>
        </div>
        <div class="cards1">
           <%
        Connection1.Connection2();
      PreparedStatement pst1=Connection1.con.prepareStatement("select * from brand");
      ResultSet rs1=pst1.executeQuery();
    
       
        String status="confirmed";
        String status1="delivered";
     pst=Connection1.con.prepareStatement("update orders set status='"+status1+"' where date <= CURRENT_DATE-INTERVAL 3 DAY AND status='"+status+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        pst.executeUpdate();
       
        
    
      while(rs1.next()){
          String brand=rs1.getString("brand_name");
          
          String path="category_products.jsp?search='"+brand+"' ";
        %>
            <div class="sub_card">
                <div class="sub_img"><a href=<%= path%>> <img src="Images/<%= rs1.getString("brand_img")%>" /> </a></div>
                <div class="sub_text" id="guitar"><h4><%= rs1.getString("brand_name")%></h4></div>
            </div>
            <%
            }
            %>
             
             
                  
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
        var product_array=[
          'violin',
          'piano',
          'guitar',
          'fluet',
          'drums',
          'trombone',
          'speakers',
          'audio interfaces',
          'gibson',
          'yamaha',
          'fender',
          'shure'
        ];
        var inputBox=document.querySelector(".search_bar");
            var result=document.querySelector(".search_menu1");
            inputBox.onkeyup=function()
            {
               
                var input=inputBox.value;
                if(input.length)
                {
                    var arr_result= [];
                    arr_result = product_array.filter((keyword)=>{
                       return keyword.includes(input);
                    });
                    console.log(arr_result);
                }
                else
                {
                    result.innerHTML='';
                }
                display(arr_result);
            };
            function display(arr_result)
            {
                var value=arr_result.map((list)=>
                {
                    return "<li onclick=select(this)>"+list+"<li>";
                });
                result.innerHTML="<ul>"+value.join('')+"<ul>";
            }
            function select(list)
            {
                inputBox.value=list.innerHTML;
                result.innerHTML='';
            }
    </script>
    </body>
</html>
