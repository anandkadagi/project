<%-- 
    Document   : category_products
    Created on : Nov 9, 2023, 5:35:57 PM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
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
    <body style=" background-color: #ebe1ea;">
      <%
     Class.forName("com.mysql.jdbc.Driver");
           %>
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
        <div class="main_container">
            <div class="left_container">
                 <%
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodify", "root", "");
        PreparedStatement pst3=con.prepareStatement("select *from category");
        ResultSet rs3=pst3.executeQuery();
         PreparedStatement pst4=con.prepareStatement("select *from brand");
        ResultSet rs4=pst4.executeQuery();
        %>
                 <div style="    height: 8%;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: serif; 
    font-weight: bold;
    border: 1px solid;
    border-radius: 3px">Filters</div>
    <div class="selection">
        <select name="val" onchange="location=this.value;">
            <option selected class="options"  >Category</option>
                    <%
                        
                    while(rs3.next())
                    {
                        String cat_name=rs3.getString("category_name");
                        %>
                        
                        <option value="category_products.jsp?search=<%= cat_name%>"> <a href="category_products.jsp"><%= rs3.getString("category_name") %></a></option> 
                    <%
                    }
                    %>
                    
                    
                </select> 
                   
                   </div> 
                    <div class="selection">
                        <select onchange="location=this.value" >
                    <option selected class="options">Brand</option>
                    <%
                    while(rs4.next())
                        
                    {
                        String brand_name=rs4.getString("brand_name");
                        %> 
                        
                        <option value="category_products.jsp?search=<%= brand_name%>"><%= rs4.getString("brand_name") %></option>
                    <%
                    }
                    %>
                    
                    
                </select> 
                   </div>  
            </div>
            <div class="right_container">
                 <div class="search_div">
            <img src="Images/search_icon.png" height="30px" width="30px">
            <form   method="post" action="category_products.jsp" style="    width: 38%;
    height: 87%;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;">
                <input type="text" class="search_bar" autocomplete="off" style="margin: 0px;height: 50%;width: 65%" name="search" placeholder="Search Products,Brands"/>
            <input type="submit" value="Submit" class="submit" onclick="func()" style="padding: 7px 17px" />
           </form>
        </div>
        <div class="search_menu">
               
            </div>
         
         <div class="products">
   <%
        Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodify", "root", "");
        PreparedStatement pst1;
        ResultSet rs2;
       String name=request.getParameter("search");
       String a=name.substring(0, 1);
        System.out.println(a);
      if(a.equals("'"))
      {
      String demo=name.substring(1, (name.length()-1));
      System.out.println(demo);
      pst1=con1.prepareStatement("select * from products where  brand='"+demo+"' OR category='"+demo+"' ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
     rs2=pst1.executeQuery();
      }
       
      else{
       pst1=con1.prepareStatement("select * from products where  brand='"+name+"' OR category='"+name+"' ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
     rs2=pst1.executeQuery();
      } 
       if(rs2.next())
       {
           
           rs2.beforeFirst();
           while(rs2.next()){
           int s_price=rs2.getInt("selling_price");
      int dis=rs2.getInt("discount");
     
    int  val=s_price-(((s_price)*(dis))/100);
    
        %>
        <a href="#">
            <div class="sub_card">
                <div class="sub_img" style="text-align: center"><img src="Images/<%= rs2.getString("image") %>"></div>
                <div class="sub_text" style="background-color: whitesmoke;border: 1px solid black;font-size: 17px">
                    <h7 style="text-align: center" ><%= rs2.getString("product_name") %></h7>
                    <br>
                    <h8 style="    text-align: left;
    display: inline-block;
    color: green;
    margin: 0px 3px;
    width: 100%;" >
                        <h8>₹<%= val%></h8>
                        <h8 style="margin: 0 5px 0 0;text-decoration: line-through;font-size: 14px;color: red"><%= rs2.getString("selling_price") %></h8>
                        
                        <h8 style="font-size: 12px"><%= dis%>% off</h8>
                    </h8> 
                </div>
            </div>
                     </a>
            <%
       }
}
      
           
    %>
   
        </div>
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
        
     <script>
         window.alert="";
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
            var result=document.querySelector(".search_menu");
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
