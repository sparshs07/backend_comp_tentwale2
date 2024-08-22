package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;
import java.util.ArrayList;

import models.User;
import models.ItemType;
import models.Item;

@WebServlet("/tentwala_home_profile.do")
public class TentwalaHomeProfileServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        if(user!=null){
            ArrayList<ItemType> itemTypes=ItemType.getItemType();
            session.setAttribute("item_types", itemTypes);

            ArrayList<Item> items=Item.getItems();
            session.setAttribute("items", items);
            request.getRequestDispatcher("tentwala_home_profile.jsp").forward(request,response);
        }
        else
         response.sendRedirect("index.jsp");

    }
}
