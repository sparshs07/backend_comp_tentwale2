package controllers;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

import javax.servlet.annotation.WebServlet;

import java.io.*;
import java.util.ArrayList;

@WebServlet("/search_tentwale.do")
public class SearchTentwaleServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String pincode = request.getParameter("pincode");
        String forwardPage = "find_tentwale.jsp";
        if (user != null && pincode != null) {
            ArrayList<User> tentwaleDetails = User.getTentwaleDetails(Integer.parseInt(pincode));
            if (!tentwaleDetails.isEmpty()) {
                forwardPage = "tentwale_details.jsp";
                request.setAttribute("pin", pincode);
                session.setAttribute("tentwale_details", tentwaleDetails);
            } else {
                request.setAttribute("no_records", "Sorry! No Records Found against this Pincode");
            }
            request.getRequestDispatcher(forwardPage).forward(request, response);
        }
    }
}
