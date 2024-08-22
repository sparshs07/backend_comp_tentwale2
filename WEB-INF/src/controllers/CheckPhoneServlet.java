package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;

import models.User;

@WebServlet("/check_phone_exist.do")
public class CheckPhoneServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        String phone=request.getParameter("phone");

        boolean flag=User.checkPhone(phone);

        response.getWriter().print(flag);
    }
}
