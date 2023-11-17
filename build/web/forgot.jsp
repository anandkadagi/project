<%-- 
    Document   : forgot
    Created on : Oct 8, 2023, 5:01:57 PM
    Author     : ASUS
--%>

<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.data.Connection1" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>verify</title>
        <link rel="stylesheet" href="./CSS_file/Design.css" type="text/css"></link><!--
-->        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    </head>
    <body class="background_color">
        <div class="box ">
            <form method="post" action="verification.jsp" class="info_forgot">
                <h1 style="    font-family: 'Roboto Slab', serif;">Verification</h1>
                <input type="text" name="num" class="data" placeholder="Enter your mobile number"/>
               
                <input type="submit" value="Submit" class="submit"/>
               
            </form>
        </div>
       
    </body>
</html>
