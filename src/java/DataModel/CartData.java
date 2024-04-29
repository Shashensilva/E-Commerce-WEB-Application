
package DataModel;


public class CartData extends ProductData {
    
    private int quentity;

    public CartData(int PID, String P_Name, int P_Quantity, String P_description, String p_image) {
        super(PID, P_Name, P_Quantity, P_description, p_image);
    }

   

    public CartData() {
    }

    public CartData(int quentity) {
        this.quentity = quentity;
    }

   

    public void setQuentity(int quentity) {
        this.quentity = quentity;
    }

    public int getQuentity() {
        return quentity;
    }
    
    
    
}
