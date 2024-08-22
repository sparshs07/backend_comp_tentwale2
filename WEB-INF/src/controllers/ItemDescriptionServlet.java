package controllers;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;

import java.io.*;

import models.Item;

@WebServlet("/item_description.do")
public class ItemDescriptionServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        Integer itemId=Integer.parseInt(request.getParameter("item_id"));
        String description=Item.getDescription(itemId);

        response.getWriter().write(description);
    }
}
