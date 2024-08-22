package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.annotation.WebServlet;

import java.io.*;

@WebServlet("/signout.do")
public class SignoutServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        HttpSession session=request.getSession();
       
        session.invalidate();
       
        
        response.getWriter().print(true);
    }
}
