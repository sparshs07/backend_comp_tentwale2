package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;

import java.io.*;

import models.InvoiceItem;

@WebServlet("/remove_cart_item.do")
public class RemoveCartItem extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        Integer invoiceItemId=Integer.parseInt(request.getParameter("invoice_item_id"));
        Boolean flag=InvoiceItem.removeCartItem(invoiceItemId);

        response.getWriter().print(flag);
    }
}
