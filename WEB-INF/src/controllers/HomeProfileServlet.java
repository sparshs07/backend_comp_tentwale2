package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;

import models.User;

@WebServlet("/home_profile.do")
public class HomeProfileServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        if(user!=null)
        request.getRequestDispatcher("home_profile.jsp").forward(request,response);
        else
         response.sendRedirect("index.jsp");

    }
}
