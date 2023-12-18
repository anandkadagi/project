<%-- 
    Document   : update_seller
    Created on : Dec 11, 2023, 7:26:16 PM
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
    <body  style="    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh">
        <%
        String id=request.getParameter("id");
        PreparedStatement pst=Connection1.con.prepareStatement("select * from sellers where seller_id='"+id+"'");
        ResultSet rs=pst.executeQuery();
        rs.next();
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
         out.print("<form method='post' action='update_seller_pro.jsp?id="+id+"' style='height: max-content' class='info_signin'>");
         %>   
             
                
         <input type="text" name="name" class="data" id="name" value="<%= rs.getString("seller_name") %>"  required/>
              
               
                 
                <input type="text" name="contact" class="data" id="contact" value="<%= rs.getString("contact") %>"   required/>
               
             
                <input type="text" name="email" class="data" value="<%= rs.getString("email") %>"   required/>
                <input type="text" name="address" class="data"  value="<%= rs.getString("Address") %>" required/>
               
               
                <input type="submit" value="Update" class="submit"/>
            </form>
         
        </div>
    </body>
</html>
