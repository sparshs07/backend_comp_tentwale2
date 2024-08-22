package models;

import java.sql.*;

import java.util.ArrayList;

import javax.servlet.ServletContext;

public class Membership{
    // Properties
    private Integer membershipId;
    private String name;  

    public static ServletContext appContext;
    public static String conURL;
    
    //Constants
    public static final Membership SILVER=new Membership(1,"Silver");
    public static final Membership GOLD=new Membership(2,"Gold");    
    public static final Membership PLATINUM=new Membership(3,"Platinum");


    //Constructors

    public Membership(){

    }

    public Membership(Integer membershipId){
        this.membershipId=membershipId;
    }

    public Membership(Integer membershipId,String name){
        this.membershipId=membershipId;
        this.name=name;
    }

    // Other Methods
    public static ArrayList<Membership> collectMemberships(){
        ArrayList<Membership> memberships=new ArrayList<>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="Select * from membership";
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                memberships.add(new Membership(rs.getInt(1),rs.getString(2)));
            }
            con.close();
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }
        return memberships;
    }  
    // Getter/Setter

    public void setName(String name){
        this.name=name;
    }
    public String getName(){
        return name;
    }

    public void setMembershipId(Integer membershipId){
        this.membershipId=membershipId;
    }
    public Integer getMembershipId(){
        return membershipId;
    }

}