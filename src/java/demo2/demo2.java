/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo2;

import com.data.Connection1;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ASUS
 */
@MultipartConfig(maxFileSize = 16177215)
public class demo2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
             PrintWriter out=response.getWriter();
            String name=request.getParameter("name");
       int p_price=Integer.parseInt(request.getParameter("p_price"));
       int s_price=Integer.parseInt(request.getParameter("s_price"));
       int qty=Integer.parseInt(request.getParameter("qty"));
       int dis=Integer.parseInt(request.getParameter("discount"));
      String category=request.getParameter("selection2");
      String brand=request.getParameter("selection1");
      String seller=request.getParameter("selection3");
      String date=request.getParameter("date");
      int amount=p_price*qty;
      Date d=Date.valueOf(date);
      Part file=request.getPart("img");
            String path=file.getSubmittedFileName();
      Connection1.Connection2();
     
       
         PreparedStatement pst=Connection1.con.prepareStatement
        ("insert into products(product_name,purchase_price,selling_price,discount,qty,category,image,brand,seller) values(?,?,?,?,?,?,?,?,?)");
        
         pst.setString(1, name);
         pst.setInt(2, p_price);
         pst.setInt(3, s_price);
         
         pst.setInt(4, dis);
         pst.setInt(5, qty);
         pst.setString(6,category);
          pst.setString(7,path);
          pst.setString(8,brand);
          
            pst.setString(9,seller);
             
       int x= pst.executeUpdate();
      
        pst=Connection1.con.prepareStatement
        ("insert into purchase_records(product_name,purchase_price,qty,amount,date,seller) values(?,?,?,?,?,?)");
        pst.setString(1, name);
        pst.setInt(2, p_price);
        pst.setInt(3, qty);
        pst.setInt(4, amount);
        pst.setDate(5, d);
        pst.setString(6, seller);
        pst.executeUpdate();
      if(x>0)
      {
     response.sendRedirect("admin.jsp");
      }
        } catch (SQLException ex) {
            Logger.getLogger(demo2.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
