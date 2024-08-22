package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.HttpURLConnection;

import utils.AppUtility;

import models.User;

@WebServlet("/signup.do")
public class SignupServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{

        request.getRequestDispatcher("signup.jsp").forward(request,response);

    } 
    
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session=request.getSession();
        ServletContext context=getServletContext();
        // ###########################ADDING CAPTCHA###########################
        String responseToken=request.getParameter("g-recaptcha-response");
        String recaptchaURL=context.getInitParameter("recaptcha_url");
        String secret_key=context.getInitParameter("secret_key");
        
        boolean flag=AppUtility.checkGoogleRecaptchaResponse(recaptchaURL,secret_key,responseToken);
        String nextPage="error.jsp";
        if(flag){
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String phone=request.getParameter("phone");
            String c1=request.getParameter("c1");
            String c2=request.getParameter("c2");
            String c3=request.getParameter("c3");
            String c4=request.getParameter("c4");
            String c5=request.getParameter("c5");
            String c6=request.getParameter("c6");
            String otp=c1+c2+c3+c4+c5+c6;

            int status=1;
            
            User user=new User(name,email,password,phone,otp);
            boolean fl=  user.signupUser();
            System.out.println(fl);
            if(fl){
                User.setStatus(status,email);
                String uploadLocation = getServletContext().getRealPath("/WEB-INF/uploads");

                File userFolder = new File(uploadLocation, email);
                
                userFolder.mkdir();
               
                nextPage="signin.jsp";
            }
        }

        response.sendRedirect(nextPage);

    }
}
