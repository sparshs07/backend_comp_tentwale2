package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.InvoiceItem;

import javax.servlet.annotation.WebServlet;

import java.io.*;

import java.util.ArrayList;

@WebServlet("/show_cart_items.do")
public class ShowCartItemsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session=request.getSession();
        Integer invoiceId=Integer.parseInt(request.getParameter("invoice_id"));

        ArrayList<InvoiceItem> invoiceItems=InvoiceItem.getCartItems(invoiceId);

        session.setAttribute("invoice_items", invoiceItems);

        response.getWriter().print("true");
    }
}
