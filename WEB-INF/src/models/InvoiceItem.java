package models;

import java.sql.*;

import java.util.ArrayList;

import javax.servlet.ServletContext;

public class InvoiceItem {
    private Integer invoiceItemId;
    private Invoice invoice;
    private TentwalaItem tentwalaItem;
    private Integer bookedQuantity;

     public static ServletContext appContext;
    public static String conURL;
   

    //Constructors
    public InvoiceItem(){

    }

    public InvoiceItem(Integer invoiceItemId,TentwalaItem tentwalaItem,Integer bookedQuantity){
        this.invoiceItemId=invoiceItemId;
        this.tentwalaItem=tentwalaItem;
        this.bookedQuantity=bookedQuantity;
    }

    public static Boolean removeCartItem(Integer invoiceItemId){
        Boolean flag=false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="delete from invoice_items where invoice_item_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,invoiceItemId);
            int x=ps.executeUpdate();
            if(x==1){
                flag=true;
            }
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }

        return flag;
    }

    //Other Methods

    public static Boolean deleteItem(Integer tentwalaItemId){
        boolean flag=false;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="delete from invoice_items where tentwala_item_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1, tentwalaItemId);
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

    public static ArrayList<InvoiceItem> getCartItems(Integer invoiceId){

        ArrayList<InvoiceItem> cartItems=new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select ii.invoice_item_id, ii.tentwala_item_id,it.name, ii.booked_quantity,twi.unit_price,twi.tentwala_item_pic from invoice_items as ii INNER JOIN tentwala_items as twi INNER JOIN items as it on ii.tentwala_item_id = twi.tentwala_item_id and it.item_id=twi.item_id where ii.invoice_id = ? ";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,invoiceId);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                cartItems.add(new InvoiceItem(rs.getInt("invoice_item_id"),new TentwalaItem(rs.getInt("tentwala_item_id"),new Item(rs.getString("name")),rs.getInt("unit_price"),rs.getString("tentwala_item_pic")),rs.getInt("booked_quantity")));
            }
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }

        return cartItems;
    }

    public static Boolean addRecord(Integer invoiceId,Integer tentwalaItemId,Integer quantity){
        Boolean flag=false;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);

            String checkDuplicate="select count(*) from invoice_items where invoice_id=? and tentwala_item_id=?";
            PreparedStatement psDup=con.prepareStatement(checkDuplicate);
            psDup.setInt(1,invoiceId);
            psDup.setInt(2,tentwalaItemId);

            ResultSet rs=psDup.executeQuery();
            rs.next();
            int duplicateCount=rs.getInt(1);

            if(duplicateCount==0){
                String query="insert into invoice_items (invoice_id,tentwala_item_id,booked_quantity) value (?,?,?)";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setInt(1,invoiceId);
                ps.setInt(2,tentwalaItemId);
                ps.setInt(3,quantity);
                int x=ps.executeUpdate();
                if(x==1){
                    flag=true;
                }
            }
            else{
                String query="update invoice_items set booked_quantity=? where invoice_id=? and tentwala_item_id=?";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setInt(1,quantity);
                ps.setInt(2,invoiceId);
                ps.setInt(3,tentwalaItemId);
                int x=ps.executeUpdate();
                if(x==1){
                    flag=true;
                }
            }

        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }

        return flag;
    }

    //Getter/Setter
    

    public Integer getInvoiceItemId() {
        return invoiceItemId;
    }

    public void setInvoiceItemId(Integer invoiceItemId) {
        this.invoiceItemId = invoiceItemId;
    }

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

    public TentwalaItem getTentwalaItem() {
        return tentwalaItem;
    }

    public void setTentwalaItem(TentwalaItem tentwalaItem) {
        this.tentwalaItem =tentwalaItem;
    }

    public Integer getBookedQuantity() {
        return bookedQuantity;
    }

    public void setBookedQuantity(Integer bookedQuantity) {
        this.bookedQuantity = bookedQuantity;
    }
    
   
}
 