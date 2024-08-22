package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;

import java.io.*;

@WebServlet("/order_placed.do")
public class OrderPlacedServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        System.out.println(request.getParameter("total_price"));
        Integer totalPrice=Integer.parseInt(request.getParameter("total_price"));
        Long rand=Math.round(Math.random()*1000000);
        System.out.println(rand);
        // System.out.println(totalPrice);
        System.out.println("===============");
        request.setAttribute("total_price", totalPrice);
        request.setAttribute("random", rand);
        request.getRequestDispatcher("order_placed.jsp").forward(request, response);
    }
}
