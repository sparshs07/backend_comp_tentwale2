package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.InvoiceItem;

import javax.servlet.annotation.WebServlet;

import java.io.*;



@WebServlet("/add_invoice_items.do")
public class AddInvoiceItemsServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
       
        Integer invoiceId=Integer.parseInt(request.getParameter("invoice_id"));
        Integer tentwalaItemId=Integer.parseInt(request.getParameter("tentwala_item_id"));
        Integer quantity=Integer.parseInt(request.getParameter("quantity"));


        Boolean addInvoiceItems=InvoiceItem.addRecord(invoiceId,tentwalaItemId,quantity);

        response.getWriter().print("true");
    }   
}
