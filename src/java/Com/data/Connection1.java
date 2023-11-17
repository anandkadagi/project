package com.data;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ASUS
 */
public class Connection1  {
 static public Connection con;
         public static void Connection2()
         {
         try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/melodify","root","");

        } catch (SQLException ex) {
            Logger.getLogger(Connection.class.getName()).log(Level.SEVERE, null, ex);
        }    catch (ClassNotFoundException ex) {
                 Logger.getLogger(Connection1.class.getName()).log(Level.SEVERE, null, ex);
             }
         }
      
        
   
      
       
    
    
    
  
   
}
