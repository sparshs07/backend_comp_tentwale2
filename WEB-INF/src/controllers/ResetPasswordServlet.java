package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;


import java.io.*;

import models.User;

@WebServlet("/reset_password.do")
public class ResetPasswordServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        String email=request.getParameter("email");
        
        request.setAttribute("reset_email", email);
        request.getRequestDispatcher("reset_password.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        String email=request.getParameter("email");
        String password=request.getParameter("password");

        System.out.println(email+"+"+password);
        
         boolean flag=  User.updatePassword(email,password);
        
        System.out.println(flag);

        if(flag)
            response.sendRedirect("reset_password_success.jsp");
        else
            response.sendRedirect("signin.jsp");
    }
}
