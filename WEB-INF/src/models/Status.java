package models;

import java.sql.*;

import java.util.ArrayList;

import javax.servlet.ServletContext;

public class Status {

    //Properties
    private Integer statusId;
    private String name;

    public static ServletContext appContext;
    public static String conURL;


    // Constructors
    public Status(){

    }
    public Status(Integer statusId,String name){
        this.statusId=statusId;
        this.name=name;
    }

    //Constants

    public static final Status ACTIVE=new Status(1,"Active");
    public static final Status DEACTIVATED=new Status(2,"Deactivated");
    public static final Status BLOCKED=new Status(3,"Blocked");
    public static final Status CLOSED=new Status(4,"Closed");


    //Other Methods
    public static ArrayList<Status> collectStatus(){
        ArrayList<Status> status=new ArrayList<>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="Select * from status";
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                status.add(new Status(rs.getInt(1),rs.getString(2)));
            }
            con.close();
        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }
        return status;
    }
    //Getter/Setter
    public void setStatusId(Integer statusId){
        this.statusId=statusId;
    }
    public Integer getStatusId(){
        return statusId;
    }

    public void setName(String name){
        this.name=name;
    }
    public String getName(){
        return name;
    }
}
