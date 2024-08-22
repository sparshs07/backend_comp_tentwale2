package controllers;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;


import models.User;

@WebServlet("/show_tentwala_pic.do")
public class ShowTentwalaPicServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
       HttpSession session=request.getSession(); 
       User user = (User)session.getAttribute("user");

       Boolean flag=Boolean.parseBoolean(request.getParameter("flag"));
       String tentwalaEmail=request.getParameter("tentwalaEmail");
       String picPath=request.getParameter("picPath");

       String check=null;

       if(flag==true){
        check="/WEB-INF/uploads/"+tentwalaEmail+"/";
        }
    else{
          check="/WEB-INF/uploads/"+user.getEmail()+"/";
       }

       if(picPath.equals(check)){
        picPath="/static/images/backdrop.jpg";
       }
    
        InputStream is=getServletContext().getResourceAsStream(picPath);
        OutputStream os=response.getOutputStream();
        byte[]arr=new byte[256];

        int count=0;

        while((count = is.read(arr)) != -1) {
            os.write(arr);
        }

        os.flush();
        os.close();
       
    }
}
