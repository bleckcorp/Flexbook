package com.bctech.postland.Controllers;

import com.bctech.postland.DAO.UserDatabase;
import com.bctech.postland.DBConnection.DBConnection;
import com.bctech.postland.models.User;
import com.mysql.cj.protocol.x.Notice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession httpSession = request.getSession();

        //get request data
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //from user DOA
        UserDatabase userDatabase = new UserDatabase(DBConnection.getConnection());

        User user = null;
        try {
            user = userDatabase.loginUser(email, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if(user != null){
            httpSession.setAttribute("user", user);
            response.sendRedirect("home.jsp");
        }else{
            httpSession.setAttribute("Registration Error", "User not found, Enter Correct Password or Email");
            response.sendRedirect("index.jsp");
        }







        //    String email = request.getParameter("email");
//    String password = request.getParameter("password");
//    RequestDispatcher dispatcher = null;
//
//    HttpSession session = request.getSession();
//
//        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/postland?autoReconnect=true&useSSL=false","root","Blecksn9!")) {
//            Class.forName("com.mysql.jdbc.Driver");
//            PreparedStatement statement = connection
//                    .prepareStatement("SELECT * FROM users WHERE email = ? AND password = ? ");
//            statement.setString(1, email );
//            statement.setString(2, password);
//
//            ResultSet rs = statement.executeQuery();
//            if (rs.next()) {
//               session.setAttribute("user", rs.getString("username"));
//                session.setAttribute("fullName", rs.getString("name"));
//                dispatcher = request.getRequestDispatcher("index.jsp");
//            }
//            else {
//                request.setAttribute("status", "failed");
//                dispatcher = request.getRequestDispatcher("login.jsp");
//            }
//            dispatcher.forward(request,response);
//
//        } catch (ClassNotFoundException | SQLException e) {
//            throw new RuntimeException(e);
//        }



    }
}
