package controllers;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.annotation.WebServlet;

import java.io.*;

import models.User;


@WebServlet("/tentwala_signup.do")
public class TentwalaSignupServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");

        String nextPage="signin.jsp";
        if(user!=null){
            nextPage="tentwala_signup.jsp";
            request.getRequestDispatcher(nextPage).forward(request,response);
        }
        else{
            response.sendRedirect(nextPage);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
        HttpSession session=request.getSession();

        User user=(User)session.getAttribute("user");

        String email=request.getParameter("email");
        String pincode=request.getParameter("pincode");
        String tentwalaName=request.getParameter("tentwala_name");
        String tentwalaAddress=request.getParameter("tentwala_address");

        String nextPage="error.jsp";
        boolean userType=true;

        if(user!=null){
            boolean f=User.signupTentwala(tentwalaName,tentwalaAddress,pincode,email,userType);
            if(f){
                user.setTentwalaName(tentwalaName);
                user.setAddress(tentwalaAddress);
                user.setPincode(pincode);
                user.setUserType(userType);
                nextPage="tentwala_home.jsp";
            }
        }        
        request.getRequestDispatcher(nextPage).forward(request,response);

    }
}
