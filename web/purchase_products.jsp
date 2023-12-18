<%-- 
    Document   : purchase_products
    Created on : Dec 9, 2023, 7:30:21 PM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.data.Connection1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./CSS_file/Design.css?1422585377" type="text/css"></link><!--
-->        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    </head>
    <body style="    display: flex;
    align-items: center;
    justify-content: center;">
        <%
       Connection1.Connection2();
         PreparedStatement pst=Connection1.con.prepareStatement("select * from brand");
        ResultSet rs=pst.executeQuery();
        pst=Connection1.con.prepareStatement("select * from category");
        ResultSet rs1=pst.executeQuery();
         pst=Connection1.con.prepareStatement("select * from sellers");
        ResultSet rs2=pst.executeQuery();
        %>
        <div  style="    height: max-content;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    width: 70%;
    top: 50%;
    left: 50%;
   
    margin: 1%">
            
       
            <form method="post" action="demo2" class="info_signin" style="height: max-content"
                 enctype="multipart/form-data" >
          
             
                
                <input type="text" name="name" class="data" id="name"  placeholder="Enter product name" required/>
              
                <input type="text" name="p_price" class="data" id="contact"  placeholder="Enter purchase price"  required/>
               
                <input type="text" name="s_price" class="data" placeholder="Enter selling price"   required/>
                <input type="text" name="qty" class="data"  placeholder="Enter quantity"  required/>
               <input type="text" name="discount" class="data"  placeholder="Enter discount"  required/>
               <select name="selection1" class="data">
                   <option selected style="display: none">Select Brand</option>
                   <%
                   while(rs.next())
                   {
                   %>
                   <option><%= rs.getString("brand_name") %></option>
                   <%
                   }
                   %>
               </select>
                <select name="selection2" class="data">
                   <option selected style="display: none">Select Category</option>
                   <%
                   while(rs1.next())
                   {
                   %>
                   <option><%= rs1.getString("category_name") %></option>
                   <%
                   }
                   %>
               </select>
               <select name="selection3" class="data">
                   <option selected style="display: none">Select Seller</option>
                   <%
                   while(rs2.next())
                   {
                   %>
                   <option><%= rs2.getString("seller_name") %></option>
                   <%
                   }
                   %>
               </select>
               <input type="date" name="date" class="data" placeholder="Enter date" required/>
               <input type="file" name="img" class="data" placeholder="select Image" required/>
                <input type="submit" value="Save" class="submit"/>
            </form>
         
        </div>
               
    </body>
</html>
