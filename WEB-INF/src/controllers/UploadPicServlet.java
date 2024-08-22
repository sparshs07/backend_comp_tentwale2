package controllers;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import javax.servlet.annotation.WebServlet;

import java.io.*;

import models.User;
import models.ItemType;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

@WebServlet("/upload_pic.do")
public class UploadPicServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
       HttpSession session=request.getSession();
       User user=(User)session.getAttribute("user");
       if(user!=null){
        try {
            if(ServletFileUpload.isMultipartContent(request)){
                FileItem fileItem=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request).get(0);
                String uploadLocation = getServletContext().getRealPath("/WEB-INF/uploads/"+user.getEmail());
                String fileName=fileItem.getName();

                File file=new File(uploadLocation,fileName);
                try{
                    fileItem.write(file);
                }catch(Exception e){
                    e.printStackTrace();
                }

            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
       }
    }
}
