package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
 
import java.io.*;

import models.User;

@WebServlet("/check_email_exists.do")
public class CheckEmailServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        String email=request.getParameter("email");
        
        boolean flag=User.checkEmail(email);

        response.getWriter().print(flag);
    }
}
