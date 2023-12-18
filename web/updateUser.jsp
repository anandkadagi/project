<%-- 
    Document   : updateUser
    Created on : Oct 8, 2023, 5:34:23 PM
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
    <body style="background-image: url(Images/back5.avif);background-repeat: no-repeat;background-size: 100% 100%;height: 100vh">
        <%
       String name=(String)session.getAttribute("val");
        Connection1.Connection2();
         PreparedStatement pst=Connection1.con.prepareStatement("select * from user where username='"+name+"'");
        ResultSet rs=pst.executeQuery();
        rs.next();
        %>
        <div class="box_sign" style="box-shadow: none">
            
            <form method="post" action="updateprocess.jsp" class="info_signin"
                  style="background-color: rgba(255,255,255,.15); backdrop-filter:blur(5px)">
             
                
                <input type="text" name="name" class="data" id="name" value="<%= rs.getString("Cust_name") %>"  required/>
              
               
                 
                <input type="text" name="contact" class="data" id="contact" value="<%= rs.getString("Contact") %>" onblur="validate2()"  required/>
                <p1 id="contact_val" class="validation_alert">
                   
                </p1>
             
                <input type="email" name="mail" class="data"  value="<%= rs.getString("email") %>" placeholder="Enter your Email" required/>
                
               
                <textarea rows="5" cols="40" name="address" id="address" class="data"   required="" ></textarea>
                <input type="submit" value="Update" class="submit"/>
            </form>
         
        </div>
                <script>
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
           
                </script>
                 <script>
    var val=document.getElementById("address").innerHTML=" <%= rs.getString("Address") %> ";
</script>
    </body>
</html>
