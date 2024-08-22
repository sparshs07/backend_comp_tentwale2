package controllers;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.InvoiceItem;

import javax.servlet.annotation.WebServlet;

import java.io.*;
import java.util.ArrayList;

@WebServlet("/checkout_cart.do")
public class CheckOutCartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        Integer invoiceId=Integer.parseInt(request.getParameter("invoice_id"));
        ArrayList<InvoiceItem> checkoutCartItems=InvoiceItem.getCartItems(invoiceId);
        request.setAttribute("checkout_cart_items", checkoutCartItems);
        request.setAttribute("invoice_id", invoiceId);

        request.getRequestDispatcher("checkout_page.jsp").forward(request, response);
    }
}
