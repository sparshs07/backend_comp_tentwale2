package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;

import models.User;

@WebServlet("/signin.do")
public class SigninServlet extends HttpServlet {

    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        request.getRequestDispatcher("signin.jsp").forward(request,response);
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session =request.getSession();

        String email=request.getParameter("email");
        String password=request.getParameter("password");
        User user=new User(email,password);

        int f=user.signinUser();
        String nextPage="signin.jsp";
        boolean flag=false;


        switch (f) {
            case -1:
                request.setAttribute("signin_error_msg", "Entered password is incorrect!!");
                break;
            case 0:
                request.setAttribute("signin_error_msg","Account with the given email does not exist!!");
                break;
            case 1:
                session.setAttribute("user", user);
                if(user.getUserType()){
                    nextPage="tentwala_home.do";
                }else{
                    nextPage="home_profile.do";
                }
                flag=true;
                break;
        }

        if(flag)
            response.sendRedirect(nextPage);
        else
            request.getRequestDispatcher(nextPage).forward(request,response);

    }
}
