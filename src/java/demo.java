/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.data.Connection1;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
public class demo extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try  {
            
            PrintWriter out = response.getWriter();
            
            
             Part file=request.getPart("image");
            String path=file.getSubmittedFileName();
           String category=request.getParameter("category");
        
      String name=request.getParameter("p_name");
      int p_price=Integer.parseInt(request.getParameter("purchase_price"));
      
      int s_price=Integer.parseInt(request.getParameter("selling_price"));
      String d=request.getParameter("date1");
      int dis=Integer.parseInt(request.getParameter("discount"));
      int qty=Integer.parseInt(request.getParameter("qty"));
     
      Date date=Date.valueOf(d);
    
      Connection1.Connection2();
      PreparedStatement pst=Connection1.con.prepareStatement("insert into products(product_name,purchase_price,selling_price,date,discount,qty,category,image) values(?,?,?,?,?,?,?,?)");
              
      pst.setString(1, name);
      pst.setInt(2, p_price);
      pst.setInt(3, s_price);
      pst.setDate(4, date);
      pst.setInt(5, dis);
      pst.setInt(6, qty);
      pst.setString(7,category);
      

      pst.setString(8, path);
     
      pst.executeUpdate();
        
        } catch (Exception ex) {
            PrintWriter out = response.getWriter();
            out.print(ex);
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
