package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;

import utils.AppUtility;
import utils.EmailSender;

import models.User;

@WebServlet("/send_otp.do")
public class SendOTPServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session=request.getSession();
        String email=request.getParameter("emailOTP");
        String otp=AppUtility.generateOTP();

        session.setAttribute("otp", otp);


        boolean flag=EmailSender.sendOTPEmail(email, otp);

        // if(flag){
        //     User.setEmailOTP("User",email,otp);
        // }
        

        response.getWriter().print(flag);
    }

}
