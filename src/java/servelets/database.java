
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
    
    
    

  
     
       
}
    

