package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;

import utils.EmailSender;

import models.User;

@WebServlet("/send_reset_email.do")
public class SendResetPasswordServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{

        String email=request.getParameter("email");
        boolean flag=false;
        if(User.checkEmail(email)){
            flag=EmailSender.resetEmail(email);
        }
        response.getWriter().print(flag);
    }
}
