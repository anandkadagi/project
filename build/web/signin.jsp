<%-- 
    Document   : signin
    Created on : Sep 22, 2023, 3:39:39 PM
    Author     : ASUS
--%>

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
    <body style="
          background-image: url(Images/back4.webp);
          background-repeat: no-repeat;
          background-size: 100% 100%;
          height: 100vh
          ">
        <div class="box_sign">
            <div class="sub_sign">
               
                <h3 style="color: white;
  font-size: 15px;
  
  font-style: oblique;
  margin-top: 5px;
  margin-bottom: 5px;">Welcome to our family</h3>
                <h1 style="color: white;
  margin-top: 5px;
  margin-bottom: 5px;
  font-size: 60px;"><span>Mel</span>odify</h1>
            </div> 
            <form method="post" action="prosess.jsp" class="info_signin" 
                  style="background-color: rgba(255,255,255,.15); backdrop-filter:blur(5px)"
                  >
             
                
                <input type="text" name="name" class="data" id="name"  placeholder="Enter your full name" required/>
              
                <input type="text" name="uname" class="data" id="uname" value="" onblur="validate1()" placeholder="Enter username" required/>
                <p1 id="uname_val" class="validation_alert">
                   
                </p1>
                 
                <input type="text" name="contact" class="data" id="contact" onblur="validate2()" placeholder="Enter contact number" required/>
                <p1 id="contact_val" class="validation_alert">
                   
                </p1>
             
                <input type="email" name="mail" class="data"  placeholder="Enter your Email" required/>
                
                <input type="password" name="password" class="data" id="pass" onblur="validate3()" placeholder="Enter password" required/>
                 <p1 id="pass_val" class="validation_alert">
                    
                </p1>
                <textarea rows="5" cols="40" name="address" class="data" id="address" placeholder="Enter your address" required="" ></textarea>
                <input type="submit" value="SignUp" class="submit"/>
            </form>
         
        </div>
        <script>
            function validate1()
            {
                
                 var uname=document.getElementById("uname").value;
                  
                   
                   document.getElementById("uname_val").innerHTML=""; 
                    
                     
                   console.log("hello1");
                
               if(uname!==""){
               if(uname.length>8 || uname.length<1)
                {
                    document.getElementById("uname_val").innerHTML="should be of size between 1 to 8"; 
                     document.getElementById("uname").value='';
                   return;
                }
               
               }
            }
            function validate2()
            {
                var contact=document.getElementById("contact").value;
                document.getElementById("contact_val").innerHTML=""; 
                console.log("hello2");
                if(contact!==""){
                    
                
                 if(contact.length!==10)
                {
                    document.getElementById("contact_val").innerHTML="should be of size 10"; 
                     document.getElementById("contact").value='';
                      return;
                 }
                }
            }
            function validate3()
            {
                 const check=/^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{1,7}$/;
               var pass=document.getElementById("pass").value;
               document.getElementById("pass_val").innerHTML="";
               console.log("hello3");
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
            
        </script>
       
    </body>
</html>
