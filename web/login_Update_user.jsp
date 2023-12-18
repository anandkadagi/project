<%-- 
    Document   : login_Update_user
    Created on : Dec 12, 2023, 7:11:19 PM
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
            <form method="post" action="login_update_user_process.jsp" class="info_signin" style="background-color: rgba(255,255,255,.15); backdrop-filter:blur(5px)">
                <h1 style="    font-family: 'Roboto Slab', serif;">Log in</h1>
                <input type="password" name="password1" id="pass" onblur="validate2()" class="data"  placeholder="Enter new password" required/>
                <p onclick="function1()" id="content" style="    position: absolute;
    top: 37%;
    left: 86%;
    font-weight: bold;
    cursor: pointer">Show</p>
                 <p1 id="pass_val" class="validation_alert">
                    
                </p1>
                <input type="password" name="password2" id="pass2"  class="data"   placeholder="Confirm password"  required/>
                <p onclick="function2()" id="content1" style="    position: absolute;
    top: 48%;
    left: 86%;
    font-weight: bold;
    cursor: pointer">Show</p>
                <p style="color: red" id="text"></p>
                <input type="submit" class="submit" />
                
            </form>
        </div>
        <script>
            
               
                
                 document.getElementById("pass2").addEventListener('input',function()
                 {
                     console.log("Hello1")
                      var a=document.getElementById("pass").value;
                       console.log("Hello2")
                     var b=document.getElementById("pass2").value;
                     if(a!==b)
                     {
                         document.getElementById("text").innerHTML="Mismatched"
                     }
                    
                 })
                document.getElementById("pass2").addEventListener('input',function()
                {
                     var a=document.getElementById("pass").value;
                    var b=document.getElementById("pass2").value;
                    console.log(b.value)
                     if(a===b)
                     {
                         
                         document.getElementById("text").innerHTML=""
                     } 
                })
           
           
            
             function validate2()
            {
                 const check=/^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{1,7}$/;
               var pass=document.getElementById("pass").value;
               document.getElementById("pass_val").innerHTML="";
              
               if(pass!=="")
               {
                 if(!check.test(pass))
                {
                    console.log(pass);
                    document.getElementById("pass_val").innerHTML="Invalid"; 
                     document.getElementById("pass").value='';
                     return;
                }
               }
            }
            function function1()
            {
                var btn=document.getElementById("content");
                var field=document.getElementById("pass");
                if(field.type==="password")
                {
                    field.type="text";
                    btn.innerHTML="Hide"
                }
                else
                {
                    field.type="password"
                    btn.innerHTML="Show"
                }
            }
            function function2()
            {
                var btn=document.getElementById("content1");
                var field=document.getElementById("pass2");
                if(field.type==="password")
                {
                    field.type="text";
                    btn.innerHTML="Hide"
                }
                else
                {
                    field.type="password"
                    btn.innerHTML="Show"
                }
            }
        </script>  
        
    </body>
</html>
