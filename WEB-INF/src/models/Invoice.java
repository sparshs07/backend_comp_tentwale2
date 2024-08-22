package models;

import java.sql.*;
import java.util.Date;

import javax.servlet.ServletContext;


public class Invoice {
    private Integer invoiceId;
    private  User user;
    private User userTentwale;
    private Date bookedOn;
    private Date bookedTo;
    private Integer bookedDays;
   

    private String deliveryAddress;
    private String deliveryEmail;
    private String deliveryPhone;

    public static ServletContext appContext;
    public static String conURL;

    
   

    //Constructors
     public Invoice(){

    }
   
    //Other Methods

    public static Integer getInvoiceId(Integer userId){
        Integer x=-1;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select invoice_id from invoice where user_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,userId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                x=rs.getInt("invoice_id");
            }
            con.close();
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }

        return x;
    }


    public static Integer getUserTentwaleId(Integer invoiceId){
        int x=-1;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select user_tentwale_id from invoice where invoice_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,invoiceId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                x=rs.getInt("user_tentwale_id");
            }
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }
        return x;
    }

    public static Integer getBookedDays(Integer invoiceId){
        Integer x=-1;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="Select booked_days from invoice where invoice_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,invoiceId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                x=rs.getInt("booked_days");
            }
            con.close();
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }

        return x;

    }

    public static Boolean addCheckoutData(Integer invoiceId,Date bookedOn,Date bookedTo,Integer bookedDays,String deliveryEmail,String deliveryAddress,String deliveryPhone){
        boolean flag=false;
        java.sql.Date bo=new java.sql.Date(bookedOn.getTime());
        java.sql.Date bt=new java.sql.Date(bookedTo.getTime());
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="update invoice set booked_on=?,booked_to=?,booked_days=?,delivery_email=?,delivery_address=?,delivery_phone=? where invoice_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setDate(1,bo);
            ps.setDate(2,bt);
            
            ps.setInt(3,bookedDays);
            ps.setString(4,deliveryEmail);
            ps.setString(5,deliveryAddress);
            ps.setString(6,deliveryPhone);
            ps.setInt(7,invoiceId);

            int x=ps.executeUpdate();

            if(x==1){
                flag=true;
            }

            con.close();

        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }
        return flag;
    }

    public static Boolean createRecord(Integer userId, Integer userTentwalaId) {
        Boolean flag = false;
    
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(conURL);
    
            // Check for duplicate record
            String checkDuplicateQuery = "SELECT COUNT(*) FROM invoice WHERE user_id = ? AND user_tentwale_id = ?";
            PreparedStatement checkDuplicateStatement = con.prepareStatement(checkDuplicateQuery);
            checkDuplicateStatement.setInt(1, userId);
            checkDuplicateStatement.setInt(2, userTentwalaId);
    
            ResultSet resultSet = checkDuplicateStatement.executeQuery();
            resultSet.next();
            int duplicateCount = resultSet.getInt(1);
    
            if (duplicateCount == 0) {
                // No duplicate found, proceed with the insertion
                String insertQuery = "INSERT INTO invoice (user_id, user_tentwale_id) VALUES (?, ?)";
                PreparedStatement ps = con.prepareStatement(insertQuery);
                ps.setInt(1, userId);
                ps.setInt(2, userTentwalaId);
    
                int x = ps.executeUpdate();
                if (x == 1) {
                    flag = true;
                }
            } 
    
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    
        return flag;
    }

    public static Integer getInvoiceId(Integer userId,Integer userTentwaleId){
        Integer invoiceId=-1;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select invoice_id from invoice where user_id=? and user_tentwale_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,userId);
            ps.setInt(2,userTentwaleId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                invoiceId=rs.getInt("invoice_id");
            }
            con.close();
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }
        return invoiceId;
    }

    //Getter-Setter
    public Integer getInvoiceId() {
        return invoiceId;
    }
    
    public void setInvoiceId(Integer invoiceId) {
        this.invoiceId = invoiceId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUserTentwale() {
        return userTentwale;
    }

    public void setUserTentwale(User userTentwale) {
        this.userTentwale = userTentwale;
    }

    public Date getBookedOn() {
        return bookedOn;
    }

    public void setBookedOn(Date bookedOn) {
        this.bookedOn = bookedOn;
    }

    public Date getBookedTo() {
        return bookedTo;
    }

    public void setBookedTo(Date bookedTo) {
        this.bookedTo = bookedTo;
    }

    public Integer getBookedDays() {
        return bookedDays;
    }

    public void setBookedDays(Integer bookedDays) {
        this.bookedDays = bookedDays;
    }
    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public void setDeliveryEmail(String deliveryEmail){
        this.deliveryEmail=deliveryEmail;
    }

    public String getDeliveryEmail(){
        return deliveryEmail;
    }

    public String getDeliveryPhone() {
        return deliveryPhone;
    }

    public void setDeliveryPhone(String deliveryPhone) {
        this.deliveryPhone = deliveryPhone;
    }
}
