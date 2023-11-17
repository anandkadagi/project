<%-- 
    Document   : newjsp1
    Created on : Nov 6, 2023, 7:37:50 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="demo" method="post" enctype="multipart/form-data" >
            <select name="category" id="select" >
                <option >Select</option>
                <option value="Guitar">Guitar</option>
                <option value="Piano">Piano</option>
                <option value="Violin">Violin</option>
                <option value="Fluet">Fluet</option>
                <option value="Drums">Drums</option>
                <option value="Trombone">Trombone</option>
                <option value="Speakers">Speakers</option>
                <option value="Audio Interface">Audio Interface</option>
                    
                    
            </select>
            <input type="text" name="p_name" required/>
            <input type="text" name="purchase_price" required/>
             <input type="text" name="selling_price" required/>
              <input type="date" name="date1" required/>
               <input type="text" name="discount" required/>
                <input type="text" name="qty" required/>
                <input type="file" name="image" required/>
                <input type="submit" value="submit"/>
        </form>
        <form method="post" action="demo2" enctype="multipart/form-data">
            <input type="text" name="name"/>
            <input type="file" name="img"/>
            <input type="submit" value="submit"/>
        </form>
    </body>
</html>
