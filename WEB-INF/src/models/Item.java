package models;

import java.sql.*;

import java.util.ArrayList;

import javax.servlet.ServletContext;

public class Item {
    // Properties
    private Integer itemId;
    private String name;
    private String description;
    private ItemType itemType;

    public static ServletContext appContext;
    public static String conURL;

    

    // Constructors
    public Item(){

    }
    public Item(String name){
        this.name=name;
    } 

    

    // 

    public Item(Integer itemId,String name,String description,ItemType itemType){
        this.itemId=itemId;
        this.name=name;
        this.description=description;
        this.itemType=itemType;
    }

    //Other Methods

    public static Integer getTypeId(Integer itemId){
        Integer typeId=0;
         try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select item_type_id from items where item_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1, itemId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                typeId=rs.getInt("item_type_id");
            }
        }catch(ClassNotFoundException|SQLException e){
            e.printStackTrace();
        }
        return typeId;
    }

    public static String getDescription(Integer itemId){
        String description =null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select description from items where item_id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1, itemId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                description=rs.getString("description");
            }
        }catch(ClassNotFoundException|SQLException e){
            e.printStackTrace();
        }
        return description;
    }

    public static ArrayList<Item> getItems(){
        ArrayList<Item>items =new ArrayList<>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(conURL);
            String query="select * from items";
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery();

            while(rs.next()){
                items.add(new Item(rs.getInt(1),rs.getString(2),rs.getString(3),new ItemType(rs.getInt(4))));
            }

        }catch(SQLException|ClassNotFoundException e){
            e.printStackTrace();
        }
        return items;
    }

    // Getter/Setters

    public void setItemId(Integer itemId){
        this.itemId=itemId;
    }
    public Integer getItemId(){
        return itemId;
    }

    public void setName(String name){
        this.name=name;
    }
    public String getName(){
        return name;
    }

    public void setDescription(String description){
        this.description=description;
    }
    public String getDescription(){
        return description;
    }

    public ItemType getItemType() {
        return itemType;
    }

    public void setItemType(ItemType itemType) {
        this.itemType = itemType;
    }

}
