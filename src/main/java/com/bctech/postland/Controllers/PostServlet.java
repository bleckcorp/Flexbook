package com.bctech.postland.Controllers;

import com.bctech.postland.DAO.PostDatabase;
import com.bctech.postland.DBConnection.DBConnection;
import com.bctech.postland.models.Post;
import com.bctech.postland.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.SQLException;


@WebServlet(name = "PostServlet", value = "/post")
@MultipartConfig
public class PostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

//        PrintWriter out = response.getWriter();
//            out.println("<html><body>");
//            out.println("<h1>" + "Servlet Registration example" + "</h1>");
//            out.println("</body></html>");

        HttpSession httpSession = request.getSession();

        //fetch data from post form
        String title = request.getParameter("title");
        String content = request.getParameter("body");


        //get current user from session
        User currentUser = (User) httpSession.getAttribute("user");
        int userId = currentUser.getUserId();

        Post post = new Post(title, content);

        PostDatabase postDatabase = new PostDatabase(DBConnection.getConnection());


        try {
            if (postDatabase.createPost(userId, post)) {
                httpSession.setAttribute("message", "Post created successfully");
                response.sendRedirect("home.jsp");
            } else {
                httpSession.setAttribute("message", "Post creation failed");
                response.sendRedirect("home.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}


