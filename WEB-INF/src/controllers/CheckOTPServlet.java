package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;

@WebServlet("/check_otp.do")
public class CheckOTPServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        HttpSession session=request.getSession();
        String otp=request.getParameter("otp");
        String check_otp=(String)session.getAttribute("otp");

        boolean flag=otp.equals(check_otp);

        response.getWriter().print(flag);
    }
}
