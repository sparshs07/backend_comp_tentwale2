package models;

import java.sql.*;

import javax.servlet.ServletContext;

public class Wishlist {
    // Properties
    private Integer wishlistId;
    private User userId;
    private User userTentwaleId;
    
    public static ServletContext appContext;
    public static String conURL;


    //Constructors
    public Wishlist(){

    }

    public Wishlist(Integer wishlistId, User userId, User userTentwaleId){
        this.wishlistId=wishlistId;
        this.userId=userId;
        this.userTentwaleId=userTentwaleId;
    }
    //Other Methods

    //Getter/Setters

    public void setWishlistId(Integer wishlistId){
        this.wishlistId=wishlistId;
    }
    public Integer getWishlistId(){
        return wishlistId;
    }

    public void setUserId(User userId){
        this.userId=userId;
    }
    public User getUserId(){
        return userId;
    }

    public void setUserTentwaleId(User userTentwaleId){
        this.userTentwaleId=userTentwaleId;
    }
    public User getUserTentwaleId(){
        return userTentwaleId;
    }
}
