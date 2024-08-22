package listeners;


import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import java.util.ArrayList;

import models.Invoice;
import models.InvoiceItem;
import models.Item;
import models.ItemType;
import models.Membership;
import models.Status;
import models.TentwalaItem;
import models.User;
import models.Wishlist;


public class AppListenerImpl implements ServletContextListener{
    public void contextInitialized(ServletContextEvent ev){
        ServletContext context=ev.getServletContext();

        Invoice.appContext = context;
        InvoiceItem.appContext = context;
        Item.appContext = context;
        Membership.appContext = context;
        ItemType.appContext = context;
        Status.appContext = context;
        TentwalaItem.appContext = context;
        User.appContext = context;
        Wishlist.appContext = context;
        
        System.out.println("===================================");
        System.out.println("=========TENTWALE STARTING!========");        
        System.out.println("===================================");        
        
        System.out.println("---------------Membership------------------");
        ArrayList<Membership>memberships=Membership.collectMemberships();
        context.setAttribute("memberships", memberships);

        System.out.println("---------------Status------------------");
        ArrayList<Status>status=Status.collectStatus();
        context.setAttribute("status", status);

        String[] models = { "Invoice", "InvoiceItem", "Item", "Membership", "Status", "TentwalaItem", "User", "Wishlist" };

        String host = context.getInitParameter("host");
        String unmSql = context.getInitParameter("unmSql");
        String pwdSql = context.getInitParameter("pwdSql");
        String dbName = context.getInitParameter("dbName");
        String port = context.getInitParameter("port");

        String conURL = "jdbc:mysql://" + host + ":" + port + "/" + dbName + "?user=" + unmSql + "&password=" + pwdSql;
        ItemType.conURL = conURL;
        for (String modelClass : models) {
            try {
                Class<?> modelClassObj = Class.forName("models." + modelClass);
                java.lang.reflect.Field appContextField = modelClassObj.getField("appContext");
                java.lang.reflect.Field connectionURL = modelClassObj.getField("conURL");
                connectionURL.set(null, conURL);
                appContextField.set(null, context);
            } catch (ClassNotFoundException | NoSuchFieldException | IllegalAccessException ex) {
                ex.printStackTrace();
            }
        }

        System.out.println("=====================");
        System.out.println("==========CONFIGURING DATABASE ===========");

        
        System.out.println("===================================");
        System.out.println("=========TENTWALE STARTED!==========");


    }
    public void contextDestroyed(ServletContextEvent ev){

    }
}