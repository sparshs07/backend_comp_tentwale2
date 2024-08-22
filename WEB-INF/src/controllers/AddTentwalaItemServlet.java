package controllers;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.annotation.WebServlet;

import java.io.*;

import models.TentwalaItem;
import models.User;

@WebServlet("/add_tentwala_item.do")
public class AddTentwalaItemServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session=request.getSession();

        User user=(User)session.getAttribute("user");

        if(user!=null){

        Integer itemId=Integer.parseInt(request.getParameter("select_item"));
        Integer totalQuantity=Integer.parseInt(request.getParameter("item_quantity"));
        Integer unitPrice=Integer.parseInt(request.getParameter("price_per_item"));
        Integer userId=Integer.parseInt(request.getParameter("user_tentwala_id"));
        String pic_name=request.getParameter("pic_name");
        String tentwala_item_pic="/WEB-INF/uploads/"+user.getEmail()+"/"+pic_name;
        
        boolean flag=TentwalaItem.addItem(itemId,totalQuantity,unitPrice,userId,tentwala_item_pic);

        if(flag){
            response.sendRedirect("tentwala_home_profile.do");
        }else
        request.getRequestDispatcher("tentwala_home_profile.jsp").forward(request, response);
        }   
    }
}
