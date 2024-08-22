package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;

@WebServlet("/tentwala_home.do")
public class TentwalaHomeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        request.getRequestDispatcher("tentwala_home.jsp").forward(request,response);
    }
}
