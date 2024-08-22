package controllers;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Invoice;
import models.Item;
import models.ItemType;
import models.TentwalaItem;
import models.User;

import javax.servlet.annotation.WebServlet;

import java.io.*;
import java.util.ArrayList;

@WebServlet("/your_items.do")
public class YourItemServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");

       

        if(user!=null){
        Integer userId=user.getUserId();

        ArrayList<TentwalaItem> tentwalaItems=TentwalaItem.getItems(userId);
        session.setAttribute("tentwala_items", tentwalaItems);
            
        ArrayList<ItemType> itemTypes=ItemType.getItemType();
        session.setAttribute("your_item_types", itemTypes);

        ArrayList<Item> items=Item.getItems();
        session.setAttribute("your_items", items);

        Integer invoiceId=Invoice.getInvoiceId(userId);
        System.out.println("Your_Item_servlet");
        System.out.println(invoiceId);
        request.setAttribute("invoice_id", invoiceId);
        }
        request.getRequestDispatcher("your_items.jsp").forward(request, response);
    }
}