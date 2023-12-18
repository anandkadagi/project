<%-- 
    Document   : admin
    Created on : Sep 25, 2023, 11:24:22 PM
    Author     : ASUS
--%>

<%@page import="org.jfree.chart.title.TextTitle"%>
<%@page import="java.time.Year"%>
<%@page import="java.time.Month"%>
<%@page import="java.awt.Color"%>
<%@page import="org.jfree.chart.renderer.category.BarRenderer"%>
<%@page import="javafx.scene.chart.NumberAxis"%>
<%@page import="javafx.scene.chart.CategoryAxis"%>
<%@page import="org.jfree.chart.plot.CategoryPlot"%>
<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.data.Connection1"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./CSS_file/Design.css" type="text/css"></link><!--
-->        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
 <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
    </head>
    <body style="    background-color: #484766;
    color: #d9d9f3;">
        <div class="navbar" style="background-color: #484766;box-shadow: 5px 5px 10px rgb(112 112 229 / 70%);">
        <div class="logo">
            <h1><span>Mel</span>odify</h1>
        </div>
            <div class="nav" style="width: 30%">
            <ul>
                 <%
                     if((String)session.getAttribute("val1")==null)
                     {
                     response.sendRedirect("login.jsp");
                     }
                    PrintWriter p=response.getWriter();
                    HttpSession s=request.getSession();
                    
                
                String name=(String)s.getAttribute("val1");
                %>
                <li><a href="/Melodify/admin.jsp" style="color: #cfd9f3">Home</a> </li>
               
                <li><a href="/Melodify/logout.jsp" style="color: #cfd9f3">Logout</a></li>
                <a href="/Melodify/account.jsp" style="text-decoration: none;" > <div class="right"  ><%= name%></div></a>
                  
                    
        </div>
    </div>
        <div style="height: 13vh"></div>
        <% 
            int year= Year.now().getValue();
            String status="confirmed";
             String status1="delivered";
             String status2="cancelled";
        Connection1.Connection2();
         PreparedStatement pst=Connection1.con.prepareStatement("select count(order_id) as count from orders ");
        ResultSet rs=pst.executeQuery();
        pst=Connection1.con.prepareStatement("select sum(amount) as sum from orders where status='"+status1+"'");
        ResultSet rs1=pst.executeQuery();
        pst=Connection1.con.prepareStatement("select count(Cust_id) as count from user ");
        ResultSet rs2=pst.executeQuery();
        pst=Connection1.con.prepareStatement("select sum(amount) as sum,MONTH(date) as month from orders where status='"+status1+"' AND YEAR(date)='"+year+"' group by MONTH(date) ");
        ResultSet rs3=pst.executeQuery();
         pst=Connection1.con.prepareStatement("select count(order_id) as count,MONTH(date) as month from orders where  status='"+status1+"' AND YEAR(date)='"+year+"' group by MONTH(date)  ");
        ResultSet rs4=pst.executeQuery();
       
        pst=Connection1.con.prepareStatement("select count(order_id) as count,sum(amount) as sum,MONTH(date) as month from orders where status='"+status1+"' AND YEAR(date)='"+year+"' group by MONTH(date)  ");
        ResultSet rs5=pst.executeQuery();
         pst=Connection1.con.prepareStatement("select * from orders where status='"+status+"' ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs6=pst.executeQuery();
        rs.next();
        rs1.next();
        rs2.next();
       
         DefaultCategoryDataset dataset = new DefaultCategoryDataset();
         JFreeChart barChart = ChartFactory.createBarChart(
            "Monthly Sales",
            "Months",
            "",
            dataset,
            PlotOrientation.VERTICAL,
            false,
           true,
            false
        );
         while (rs3.next()) {
            
            String label = rs3.getString("month");
            int value = rs3.getInt("sum");
            dataset.addValue(value, "Category", label);
           
        }
         String hexBackgroundColor = "#bed0ef";
         String hex="#272c4f";
      barChart.setBackgroundPaint(Color.decode(hexBackgroundColor));
        
      CategoryPlot plot = barChart.getCategoryPlot();
        plot.setDomainGridlinesVisible(false); // Hide vertical gridlines
        plot.setRangeGridlinesVisible(false);  // Hide horizontal gridlines
        plot.setBackgroundPaint(Color.decode(hexBackgroundColor));
      
        TextTitle title = barChart.getTitle();
        title.setPaint(Color.WHITE); // Set the color to blue
        BarRenderer renderer = (BarRenderer) plot.getRenderer();
        renderer.setMaximumBarWidth(0.1);
        renderer.setSeriesPaint(0, Color.decode(hex));   // Set color for Series1
        
        
        String imagePath = getServletContext().getRealPath("/Images/chart1.jpg");
        ChartUtilities.saveChartAsJPEG(new java.io.File(imagePath), barChart, 400, 300);
        

 DefaultCategoryDataset dataset1 = new DefaultCategoryDataset();
         JFreeChart barChart1 = ChartFactory.createBarChart(
            "Monthly Orders",
            "Months",
            "",
            dataset1,
            PlotOrientation.VERTICAL,
            false,
           true,
            false
        );
         while (rs4.next()) {
            
            String label1 = rs4.getString("month");
            int value1 = rs4.getInt("count");
            dataset1.addValue(value1, "Category", label1);
           
        }
barChart1.setBackgroundPaint(Color.decode(hexBackgroundColor));
        
      CategoryPlot plot1 = barChart1.getCategoryPlot();
        plot1.setDomainGridlinesVisible(false); // Hide vertical gridlines
        plot1.setRangeGridlinesVisible(false);  // Hide horizontal gridlines
        plot1.setBackgroundPaint(Color.BLACK);
        plot1.setBackgroundPaint(Color.decode(hexBackgroundColor));
        BarRenderer renderer1 = (BarRenderer) plot1.getRenderer();
        renderer1.setMaximumBarWidth(0.1);
        renderer1.setSeriesPaint(0, Color.decode(hex)); 
        TextTitle title1 = barChart1.getTitle();
        title1.setPaint(Color.WHITE);
        String imagePath1 = getServletContext().getRealPath("/Images/chart2.jpg");
        ChartUtilities.saveChartAsJPEG(new java.io.File(imagePath1), barChart1, 400, 300);

        %>
        <div class="main_container">
            <div class="left_container new" style="background-color: #484766;border: none">
                <div style="width: 100%;
    height: 30%;display: flex;align-items: center;justify-content: center;flex-direction: column; border-bottom: 1px solid">
                    <img src="Images/profile-user.png" height="100px" width="100px" />  
                    <p style="margin: 5px">Hello <%= name%></p>
                </div>
               <div style="width: 100%;height: max-content;text-align: center">
                   <a href="order_report.jsp"><p style="font-size: 20px;margin: 10px;color: #d9d9f3">Orders</p></a>
                </div>
                 
                 <div style="width: 100%;height: max-content;text-align: center">
                     <a href="customer.jsp"><p style="font-size: 20px;margin: 10px;color: #d9d9f3">Customers</p></a>
                </div>
                <div style="width: 100%;height: max-content;text-align: center">
                    <a href="products.jsp"><p style="font-size: 20px;margin: 10px;color: #d9d9f3">Products</p></a>
                </div>
                 <div style="width: 100%;height: max-content;text-align: center">
                    <a href="purchase_products.jsp"><p style="font-size: 20px;margin: 10px;color: #d9d9f3">Purchasing</p></a>
                </div>
                <div style="width: 100%;height: max-content;text-align: center">
                    <a href="sellers.jsp"><p style="font-size: 20px;margin: 10px;color: #d9d9f3">Sellers</p></a>
                </div>
            </div>
            <div class="right_container" style="    background-color: #484766;border: none;display: flex;flex-direction: column;justify-content: center;align-items: center">
                <p style="font-size: 30px;">Dashboard</p>
                <div class="main_container" style="align-items: center;justify-content: space-around;color:  #39c298">
                    <div  class="values" style=""> 
                        <p style="    color: #bf9bae;">Total Orders</p>
                        <h2><%= rs.getInt("count") %></h2>
                    </div>
                     <div class="values"> 
                        <p style="    color: #bf9bae;">Total Sales</p>
                        <h2><%= rs1.getInt("sum") %> /-</h2>
                    </div>
                     <div class="values"> 
                        <p style="    color: #bf9bae;">Total Customers</p>
                        <h2><%= rs2.getInt("count") %> </h2>
                    </div>
                </div>
                    <div class="main_container" style="justify-content: space-around;margin-top: 4%">
                        <img style="box-shadow: 5px 5px 10px rgb(112 112 229 / 70%);" src="<%= request.getContextPath() %>/Images/chart1.jpg"  />   
                       <img style="box-shadow: 5px 5px 10px rgb(112 112 229 / 70%);" src="<%= request.getContextPath() %>/Images/chart2.jpg"  /> 
                    </div>
                    <div class="products" style="margin-top: 2%;text-align: center">
                        <p style="font-size: 24px"> Monthwise Orders and sales</p>
                        <ul>
                            <li class="li1">Orders</li>
                            <li class="li1">Sale</li>
                            <li class="li1">Month</li>
                        </ul>
                        <%
                        while(rs5.next())
                        {
                            
                        %>
                        <ul>
                            <li class="li2"><%= rs5.getInt("count") %></li>
                            <li class="li2"><%= rs5.getInt("sum") %></li>
                            <li class="li2"><%= Month.of(rs5.getInt("month")).name() %></li>
                        </ul>
                        <%
                        }
                        %>
                    </div>
                    
                    <div class="products" style="margin-top: 2%;text-align: center">
                         <p style="font-size: 24px;width: 100%"> Current Orders</p>
                         <ul >
                            <li style="    font-size: 20px;
    border: none;
    background-color: #1a2247;
    box-shadow: 5px 5px 10px rgb(112 112 229 / 70%)">Order Id</li>
                            <li style="    font-size: 20px;
    border: none;
    background-color: #1a2247;
    box-shadow: 5px 5px 10px rgb(112 112 229 / 70%)">Customer Id</li>
                            <li style="    font-size: 20px;
    border: none;
    background-color: #1a2247;
    box-shadow: 5px 5px 10px rgb(112 112 229 / 70%)">Customer Name</li>
                            <li style="    font-size: 20px;
    border: none;
    background-color: #1a2247;
    box-shadow: 5px 5px 10px rgb(112 112 229 / 70%)">Product</li>
                            <li style="    font-size: 20px;
    border: none;
    background-color: #1a2247;
    box-shadow: 5px 5px 10px rgb(112 112 229 / 70%)">Quantity</li>
                            <li style="    font-size: 20px;
    border: none;
    background-color: #1a2247;
    box-shadow: 5px 5px 10px rgb(112 112 229 / 70%)">Amount</li>
                        </ul>
                        <%
                            if(rs6.next())
                            {
                            rs6.beforeFirst();
                             while(rs6.next())
                        {
                            
                        %>
                        <ul>
                            <li style="    font-size: 16px;
    background-color: #6880cf;
    border: none"><%= rs6.getInt("order_id") %></li>
                            <li style="    font-size: 16px;
    background-color: #6880cf;
    border: none"><%= rs6.getInt("Cust_id") %></li>
                            <li style="    font-size: 16px;
    background-color: #6880cf;
    border: none"><%= rs6.getString("Cust_name") %></li>
                            <li style="    font-size: 16px;
    background-color: #6880cf;
    border: none"><%= rs6.getString("product_name") %></li>
                            <li style="    font-size: 16px;
    background-color: #6880cf;
    border: none"><%= rs6.getInt("qty") %></li>
                            <li style="    font-size: 16px;
    background-color: #6880cf;
    border: none"><%= rs6.getInt("amount") %></li>
                        </ul>
                        <%
                        }
                       
                            }
                            else
                            {
                            %>
                         <img src="Images/document.png" height="200px" width="200px" style="align-items: center"/>
<h1 style="font-family: sans-serif;font-size: xx-large">No Records</h1> 
                         <%
                            }
                        %>
                    </div>
            </div>
        </div>
    </body>
</html>
