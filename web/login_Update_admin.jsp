<%-- 
    Document   : login_Update_admin
    Created on : Dec 12, 2023, 7:59:46 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.data.Connection1"  %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
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
    <body style="
          background-image: url(Images/back4.webp);
          background-repeat: no-repeat;
          background-size: 100% 100%;
          height: 100vh
          " >
        <%
        String n=request.getParameter("num");
        String num=n.substring(1,(n.length()-1));
        %>
        <div class="box_sign">
            <div class="sub_sign">
               
                <h3 style="color: white;
  font-size: 15px;
  
  font-style: oblique;
  margin-top: 5px;
  margin-bottom: 5px;">Welcome back to....</h3>
                <h1 style="color: white;
  margin-top: 5px;
  margin-bottom: 5px;
  font-size: 60px;"><span>Mel</span>odify</h1>
            </div> 
            <form method="post" action="login_update_admin_process.jsp" class="info_signin" style="background-color: rgba(255,255,255,.15); backdrop-filter:blur(5px)">
                <h1 style="    font-family: 'Roboto Slab', serif;">Log in</h1>
                <input type="password" name="password1" id="pass1" class="data" placeholder="Enter new password" required/>
                
                <input type="password" name="password2" id="pass2" class="data" placeholder="Confirm password" onfocus="validate()" required/>
                <p style="color: red" id="text"></p>
                <input type="submit" class="submit" />
                
            </form>
        </div>
        <script>
            function validate()
            {
                var a=document.getElementById("pass1");
                 var b=document.getElementById("pass2");
                 if(a!==b)
                 {
                     document.getElementById("text").innerHTML="Password mismatched!!!";
                 }
            }
        </script>  
        
    </body>
</html>
