package com.bctech.postland.Controllers;

import com.bctech.postland.DAO.UserDatabase;
import com.bctech.postland.DBConnection.DBConnection;
import com.bctech.postland.Utilities.PasswordEncryption;
import com.bctech.postland.models.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "Registration", value = ("/register"))
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //fetch data from registration page
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String date_of_birth = request.getParameter("date_of_birth");
        String gender = request.getParameter("gender");



        //Password encryption
        String hashedPassword = PasswordEncryption.encryptPassword(password);

        User user = new User(firstname, lastname, email, hashedPassword, date_of_birth, gender);

        //from user DataBase
        UserDatabase userDao = new UserDatabase(DBConnection.getConnection());

        try {
            userDao.registerUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("status", "success");
        response.sendRedirect("index.jsp");


    }


    }

