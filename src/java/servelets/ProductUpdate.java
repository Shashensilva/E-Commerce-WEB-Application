/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductUpdate extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductUpdate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductUpdate at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        
        
       try {
           
  
    int A_ID = 1;
    
    String P_Name = request.getParameter("P_Name");
    
    
    int  P_Quantity = Integer.parseInt(request.getParameter("P_Quantity"));
   
    
    String P_description = request.getParameter("P_description");
  
   
    int P_Price = Integer.parseInt(request.getParameter("P_Price"));
    
    
    
   
    int  PID = Integer.parseInt(request.getParameter("PID"));
    

    
    System.out.println(PID);
    
    System.out.println("In do post method of Add Image servlet.");
    Part file = request.getPart("imageFile");
    
    String imageFileName = file.getSubmittedFileName();
    System.out.println("Selected Image File Name : " + imageFileName);
    
    String uploadPath = "Uploads/" + imageFileName;
    System.out.println("Upload Path : " + uploadPath);
    
    String path = "C:\\Users\\laksh\\OneDrive\\Documents\\NetBeansProjects\\E-Commerce-WEB-Application\\web\\Uploads\\"+imageFileName;

    FileOutputStream fos = new FileOutputStream(path);
    InputStream is = file.getInputStream();
    byte[] buffer = new byte[4096]; // Adjust buffer size as needed
    int bytesRead;
    while ((bytesRead = is.read(buffer)) != -1) {
        fos.write(buffer, 0, bytesRead);
    }
    
    File uploadedFile = new File(uploadPath);
    if (uploadedFile.exists()) {
        // Image stored successfully
        System.out.println("Image stored successfully at: " + uploadPath);
    } else {
        // Image storage failed
        System.out.println("Failed to store image.");
    }
    
    database db = new database();
    int rowAffected = db.Product_Edit(P_Name, P_Quantity, P_description, P_Price, A_ID, uploadPath, PID);
    
    if (rowAffected > 0) {
       
         request.setAttribute("success", "Order Update Success !");
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("product-edit.jsp");
        dispatcher.forward(request, response);
        response.sendRedirect("product-edit.jsp");
      
        
        
        
        
    } else {
    
    
    request.setAttribute("error", "Order Update Not Success !");
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("product-edit.jsp");
        dispatcher.forward(request, response);
      response.sendRedirect("product-edit.jsp");
       
    
    
    }
} catch (IOException e) {
    e.printStackTrace();
    response.getWriter().println("Error occurred during file upload: " + e.getMessage());
} 
       
       
       catch (NumberFormatException e) {
    e.printStackTrace();
    response.getWriter().println("Number format error occurred: " + e.getMessage());
}

        
        
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
