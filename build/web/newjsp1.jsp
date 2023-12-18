<%-- 
    Document   : newjsp1
    Created on : Nov 6, 2023, 7:37:50 PM
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
    </head>
    <body>
        <%
        Connection1.Connection2();
        String status="confirmed";
        String status1="delivered";
        PreparedStatement pst=Connection1.con.prepareStatement("update orders set status='"+status1+"' where date <= CURRENT_DATE-INTERVAL 3 DAY AND status='"+status+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        pst.executeUpdate();
       
        
        %>
    </body>
</html>
