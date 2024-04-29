
package servelets;


import DataModel.ProductData;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;
import java.util.Date;


public class database {
    
      private final String url = "jdbc:mysql://localhost:3306/web_store";
      private final String Username = "root";
      private final String password = "";
      
      private Connection conn;
    
    public database() {

      
      try {
          

            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(this.url,this.Username, this.password);
          
          
          
          
     } catch (Exception e) {
     

     
     e.printStackTrace();
     

     }
    
    
    }
    
    
    
      public List<ProductData> get_all_product () {
           
        List<ProductData> products = new ArrayList<>();

        try {

      

            

            String sql = "Select * from product ";
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            

            ResultSet p_data = pstmt.executeQuery();
            
            
            while( p_data.next()) {
            
            ProductData row = new ProductData();
            row.setPID(p_data.getInt("PID"));
            row.setP_Name(p_data.getString("P_Name"));
            row.setP_Quantity(p_data.getInt("P_Quantity"));
            row.setP_description(p_data.getString("P_description"));
            row.setP_Price(p_data.getInt("P_Price"));
            row.setP_image(p_data.getString("image"));
            
            products.add(row);
            }
            

            pstmt.close();

            conn.close();

        } catch (Exception e) {

           e.printStackTrace();

        }
        
        
        return products;
    }
    
    
       
 public String get_user_by_email(String email, String password) {
     
    String user_email = "";

    try {
        String sql = "SELECT * FROM user WHERE Email=? AND Password=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, email);
        pstmt.setString(2, password);
        ResultSet user_data = pstmt.executeQuery();
        
        // Check if there's any result
        if (user_data.next()) {
            user_email = user_data.getString("Email");
           
        }
        
        // Close ResultSet and PreparedStatement
        
        pstmt.close();
    } catch (SQLException e) {
        // Properly handle exceptions
        e.printStackTrace();
    }
    
    return user_email;
}
 
 
   public int create_User(String Name ,String Email , String Password ) {
           
        int  rowAffected = 0;

        try {

      

           

            String sql = "INSERT INTO user (UserName, Email, Password) VALUES (?, ?, ?)";
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, Name);
            pstmt.setString(2, Email);
            pstmt.setString(3, Password);
            
            rowAffected = pstmt.executeUpdate();
            if (rowAffected > 0) {
             System.out.println("A new user was inserted successfully!");
            } else {
             System.out.println("Failed to insert the user!");
            }

            

            conn.close();
            
          

        } catch (Exception e) {

           e.printStackTrace();

        }
        
          return rowAffected;
    }
       
 

  
     
       
}
    

