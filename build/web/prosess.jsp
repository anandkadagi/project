<%-- 
    Document   : prosess.jsp
    Created on : Sep 22, 2023, 5:21:19 PM
    Author     : ASUS
--%>


<%@page import="java.util.Properties"%>
<%@page import="java.util.regex.Matcher"%>

<%@page import="java.util.regex.Pattern"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.data.Connection1" %>
<%@page import="java.sql.*" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>
<!DOCTYPE html>
<html>
    <head>
         
        
        <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%

            try {
               
                PrintWriter p1 = response.getWriter();
                String name = request.getParameter("name");
                String uname = request.getParameter("uname");
                String contact = request.getParameter("contact");
                String mail = request.getParameter("mail");
                String pass = request.getParameter("password");
                String address = request.getParameter("address");
                 

                
 

      
           

           
            Connection1.Connection2();
            
            PreparedStatement p = Connection1.con.prepareStatement("insert into user(Cust_name,username,Contact,email,Address,password) values(?,?,?,?,?,?)");

            p.setString(1, name);
            p.setString(2, uname);
            p.setString(3, contact);
            p.setString(4, mail);
            p.setString(5, address);
            p.setString(6, pass);

            int x = p.executeUpdate();
 // Set your email credentials
    String host = "smtp.gmail.com";
    String username = "anandkadagi47";
    String password = "njuh auij hqyk ryaa";

    // Sender and recipient email addresses
    String from = "anandkadagi47@gmail.com";
    String to = mail;

    // Get the subject and message from the form
    

    // Set the properties for the email server
    Properties properties = System.getProperties();
     properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.starttls.required", "true");
    properties.put("mail.smtp.host", host);
       
        properties.put("mail.smtp.port", "587"); 
        
 
    // Create a session with the email server
    Session session1 = Session.getInstance(properties);
session1.setDebug(true);
    // Create a MimeMessage object
    MimeMessage message = new MimeMessage(session1);

    try {
        // Set the sender and recipient addresses
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

        // Set the email subject and message
        message.setSubject("Welcome to Family");
        message.setText("We are pleased for your sign up in our website \n "
                + "By Signing to website,you are now member of our Family.\n"
                + "We are hoping yor experience with our website will be very delightfull.\n"
                + "Your Username: "+ uname+"\n"
                + "Your Password:" + pass+"\n"
                + "                         Thank You!!!!"
                );

        // Send the message
        Transport transport = session1.getTransport("smtps");
        transport.connect(host, username, password);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();

        
    } catch (Exception e) {
        out.println("<p>Error sending email: " + e.getMessage() + "</p>");
       ;
    }
            if (x > 0) {
                HttpSession s = request.getSession();
                s.setAttribute("val", uname);
                
               
        %>
       
        <script>

           
              swal({
  title: "Done",
  text: "Welcome...!",
  type: "success",
  confirmButtonText: "Ok"
},function()
{
    document.location="index.jsp";
});


        </script>       
        <%
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

        %>

    </body>
</html>
