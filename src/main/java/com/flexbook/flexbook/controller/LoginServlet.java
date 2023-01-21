package com.flexbook.flexbook.controller;

import com.flexbook.flexbook.DAO.UserDatabase;
import com.flexbook.flexbook.utilities.ConnectionManager;
import com.flexbook.flexbook.DAO.UserDatabase;
import com.flexbook.flexbook.model.User;
import com.flexbook.flexbook.utilities.ConnectionManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + "WELCOME TO FLEXBOOK - A FACEBOOK CLONE" + "</h1>");
        out.println("</body></html>");
        HttpSession httpSession = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDatabase userData = new UserDatabase(ConnectionManager.getConnection());
        User user = userData.login(email, password);

        if(user != null){
            httpSession.setAttribute("user", user);
            response.sendRedirect("home.jsp");
        }else{
            httpSession.setAttribute("regError", "Enter Correct Password or Email");
            response.sendRedirect("index.jsp");
        }
    }
}
