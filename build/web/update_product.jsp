<%-- 
    Document   : update_product
    Created on : Dec 9, 2023, 6:50:18 PM
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
      String id=request.getParameter("id");
       if(id.substring(0, 1).equals("'"))
       {
       id=id.substring(1, (id.length()-1));
       }
        Connection1.Connection2();
         PreparedStatement pst=Connection1.con.prepareStatement("select * from brand",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs=pst.executeQuery();
        rs.next();
         pst=Connection1.con.prepareStatement("select * from category",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs1=pst.executeQuery();
        rs1.next();
         pst=Connection1.con.prepareStatement("select * from sellers",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs2=pst.executeQuery();
        rs2.next();
         pst=Connection1.con.prepareStatement("select * from products where product_id='"+id+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs4=pst.executeQuery();
        rs4.next();
        %>
        <div  style="    height: max-content;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    width: 70%;
    top: 50%;
    left: 50%;
   box-shadow: none;
    margin: 1%">
            
         <%
         out.print("<form method='post' action='update_pro_process.jsp?id="+id+"' style='height: max-content' class='info_signin'>");
         %>   
             
                
                <input type="text" name="name" class="data" id="name" value="<%= rs4.getString("product_name") %>"  required/>
              
               
                 
                <input type="text" name="p_price" class="data" id="contact"  placeholder="Enter purchase price"  required/>
               
             
                <input type="text" name="s_price" class="data" placeholder="Enter selling price"   required/>
                <input type="text" name="qty" class="data"  placeholder="Enter quantity" required/>
               <input type="text" name="discount" class="data" placeholder="Enter discount"  required/>
                <select name="category" class="data">
                   <option selected style="display: none">Select Brand</option>
                   <%
                       rs.beforeFirst();
                   while(rs.next())
                   {
                       
                   %>
                   <option><%= rs.getString("brand_name") %></option>
                   <%
                   }
                   %>
               </select>
                <select name="brand" class="data">
                   <option selected style="display: none">Select Category</option>
                   <%
                        rs1.beforeFirst();
                   while(rs1.next())
                   {
                      
                   %>
                   <option><%= rs1.getString("category_name") %></option>
                   <%
                   }
                   %>
               </select>
               <select name="seller" class="data">
                   <option selected style="display: none">Select Seller</option>
                   <%
                       rs2.beforeFirst();
                   while(rs2.next())
                   {
                   %>
                   <option><%= rs2.getString("seller_name") %></option>
                   <%
                   }
                   %>
               </select>
              
                <input type="date" name="date" class="data" required/>
                <input type="submit" value="Update" class="submit"/>
            </form>
         
        </div>
               
    </body>
</html>
