package models;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import org.jasypt.util.password.StrongPasswordEncryptor;

public class User {
   static StrongPasswordEncryptor spe=new StrongPasswordEncryptor();

    //Properties
    private Integer userId;
    private String name;
    private String email;
    private String password;
    private String pic;
    private String phone;
    private String otp;
    private String address;    
    private String tentwalaName;
    private Integer trustPoints;
    private Boolean userType;
    private Membership membership;
    private Status status;
    private String pincode;

    public static ServletContext appContext;
    public static String conURL;

     //Constructors
    public User(){

    }

    public User(Integer userId,String email,String phone,String address,String tentwalaName){
        this.userId=userId;
        this.email=email;
        this.phone=phone;
        this.address=address;
        this.tentwalaName=tentwalaName;
    }

    public User(String email,String password){
        this.email=email;
        this.password=password;
    }

    public User(String name,String email,String password,String phone,String otp){
        this.name=name;
        this.email=email;
        this.password=password;
        this.phone=phone;
        this.otp=otp;
    }

    
    //Other Methods

    public static String getTentwalaAddress(Integer userTentwalaId){
        String s="";

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select address from users where user_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,userTentwalaId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                s=rs.getString("address");
            }
            con.close();
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }

        return s;
    }

    public static String getTentwalaName(Integer userTentwalaId){
        String s="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select tentwala_name from users where user_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,userTentwalaId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                s=rs.getString("tentwala_name");
            }
            con.close();
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }
        return s;

        
    }

    public static ArrayList<User> getTentwaleDetails(Integer pincode){
        ArrayList<User> userTentwaleDetails=new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select * from users as u  inner join pincode as p where u.pincode_id=p.pincode_id and user_type=1 and p.pin=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,pincode);
            ResultSet rs=ps.executeQuery();

            while(rs.next()){
                userTentwaleDetails.add(new User(rs.getInt("user_id"),rs.getString("email"),rs.getString("phone"),rs.getString("address"),rs.getString("tentwala_name")));
            }

        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }

        return userTentwaleDetails;
    }

    public static boolean checkUserType(String email){
        boolean flag=false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select user_type from users where email=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,email);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
               flag=  rs.getBoolean("user_type");
            }
            con.close();
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }

        return flag;
    }

    public static boolean signupTentwala(String tentwalaName,String address,String pincode_id,String email,boolean userType){
        boolean flag=false;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String x = "insert into pincode (pin) value (?)" ;
            PreparedStatement c=con.prepareStatement(x, Statement.RETURN_GENERATED_KEYS);
            int pc = Integer.parseInt(pincode_id);
            c.setInt(1, pc);
            int result = c.executeUpdate();
            int pci =0;
            if(result==1){
                
                ResultSet rs = c.getGeneratedKeys();
                if (rs.next()) {
                   pci= rs.getInt(1);
                }
            }
            String query="UPDATE users SET tentwala_name = ?, address = ?, pincode_id = ?, user_type=? WHERE email = ?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,tentwalaName);
            ps.setString(2,address);
            ps.setInt(3,pci);
            ps.setBoolean(4, userType);
            ps.setString(5,email);

            int res=ps.executeUpdate();
            
            if(res==1){
                flag=true;
            }
            con.close();
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }

        return flag;
    }

    public static boolean updatePassword(String email,String password){
        boolean flag=false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="update users set password=? where email=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,spe.encryptPassword(password));
            ps.setString(2,email);
            int res=ps.executeUpdate();

            if(res==1){
                flag=true;
            }
            con.close();
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }

        return flag;
    }

    public  int signinUser(){

        //-1 : wrong password
        //0 :  
        int statusId=0;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(conURL);
            String query="select user_id,u.name,email,password,pic,phone,otp,address,tentwala_name,trust_points,user_type,membership_id,u.status_id,pincode_id,s.status_id,s.name from users as u inner join status as s where email=? and u.status_id=s.status_id";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,email);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                statusId=rs.getInt("status_id");
                if(statusId==1){
                    if(spe.checkPassword(password,rs.getString("password"))){
                        password=null;
                        userId=rs.getInt("user_id");
                        name=rs.getString("name");
                        email=rs.getString("email");
                        pic=rs.getString("pic");
                        phone=rs.getString("phone");
                        otp=rs.getString("otp");
                        address=rs.getString("address");
                        tentwalaName=rs.getString("tentwala_name");
                        trustPoints=rs.getInt("trust_points");
                        userType=rs.getBoolean("user_type");
                        membership=new Membership(rs.getInt("membership_id"));
                        status=new Status(rs.getInt("status_id"),rs.getString(14));
                        pincode=rs.getString("pincode_id");
                    }else{
                        statusId=-1;
                    }
                }
            }
            con.close();
        }catch(ClassNotFoundException|SQLException e){
            e.printStackTrace();
        }
        return statusId;
    }

    public static void setStatus(Integer status,String email){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="update users set status_id=? where email=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,status);
            ps.setString(2,email);
            ps.executeUpdate();
            con.close();
        }catch(ClassNotFoundException|SQLException e){
            e.printStackTrace();
        }
    }

    public static boolean checkPhone(String phone){
        boolean flag=false;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select phone from users where phone=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,phone);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                flag=true;
            }
            con.close();
        }catch(ClassNotFoundException|SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    public  boolean signupUser(){
        boolean flag=false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="insert into users (name,email,password,phone,otp) value (?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3,spe.encryptPassword(password));
            ps.setString(4,phone);
            ps.setString(5,otp);

           int rs= ps.executeUpdate();
           if(rs==1){
            flag=true;
           }
            con.close();
        }catch(ClassNotFoundException|SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    public static String getEmail(Integer userId){
        String email=null;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select email from users where user_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,userId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                email=rs.getString("email");
            }
            con.close();
        }catch(ClassNotFoundException|SQLException e){
            e.printStackTrace();
        }
        return email;
    }

    public static boolean checkEmail(String email){
        boolean flag=false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select email from users where email=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,email);
            ResultSet rs=ps.executeQuery();

            if(rs.next()){
                flag=true;
            }
            con.close();

        }catch(ClassNotFoundException|SQLException e){
            e.printStackTrace();
        }
        
        return flag;
    }

    public static void setEmailOTP(String name,String email,String otp){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="insert into users (name,email,otp) value (?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3,otp);
            
            ps.executeUpdate();
            con.close();
        }catch(ClassNotFoundException|SQLException e){
            e.printStackTrace();
        }
    }

    //Getter/Setters

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public Integer getTrustPoints() {
        return trustPoints;
    }

    public void setTrustPoints(Integer trustPoints) {
        this.trustPoints = trustPoints;
    }

    public Boolean getUserType() {
        return userType;
    }

    public void setUserType(Boolean userType) {
        this.userType = userType;
    }

    public String getAddress(){
        return address;
    }

    public void setAddress(String address){
        this.address=address;
    }

    public String getTentwalaName(){
        return tentwalaName;
    }

    public void setTentwalaName(String tentwalaName){
        this.tentwalaName=tentwalaName;
    }

    public Membership getMembership() {
        return membership;
    }

    public void setMembership(Membership membership) {
        this.membership = membership;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }


    
}
