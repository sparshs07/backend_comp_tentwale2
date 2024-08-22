package controllers;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;

import models.User;
import models.Invoice;
import models.InvoiceItem;
import models.Item;
import models.ItemType;
import models.TentwalaItem;

import java.util.ArrayList;


@WebServlet("/show_tentwala_details.do")
public class ShowTentwalaDetailsServlet extends HttpServlet {
    int count=0;
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{

        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        Integer tentwalaId=Integer.parseInt(request.getParameter("tentwala_id"));
        

        if(user != null){
            ArrayList<TentwalaItem> tentwalaContents=TentwalaItem.getItems(tentwalaId);
            request.setAttribute("tentwala_contents", tentwalaContents);

            String tentwalaEmail=User.getEmail(tentwalaId);
            session.setAttribute("tentwala_email", tentwalaEmail);
           

            ArrayList<ItemType> itemTypes=ItemType.getItemType();
            request.setAttribute("tentwala_item_types", itemTypes);

             ArrayList<Item> items=Item.getItems();
             request.setAttribute("your_items", items);

             
                 Boolean relateUserTentwala=Invoice.createRecord(user.getUserId(),tentwalaId);
                 
                 Integer invoiceId=Invoice.getInvoiceId(user.getUserId(),tentwalaId);
                 
                 session.setAttribute("invoice_id", invoiceId);

                 ArrayList<InvoiceItem> invoiceItems=InvoiceItem.getCartItems(invoiceId);
                 session.setAttribute("invoice_items", invoiceItems);

                 

             request.getRequestDispatcher("tentwala_detail_page.jsp").forward(request, response);
        }
        // request.getRequestDispatcher("home_profile.do").forward(request, response);
        
        
    }
}
