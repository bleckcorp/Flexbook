package com.bctech.postland.Controllers;

import com.bctech.postland.DAO.PostDatabase;
import com.bctech.postland.DBConnection.DBConnection;
import com.bctech.postland.models.Post;
import com.bctech.postland.models.User;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "UpdatePostServlet", value = "/UpdatePostServlet")
public class UpdatePostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter() ;

            out.println("<html><body>");
            out.println("<h1>" + "update post" + "</h1>");
            out.println("</body></html>");

            HttpSession httpSession = request.getSession();

            //requests from the client
            String title = request.getParameter("title");
            String body = request.getParameter("body");
            int postId = Integer.parseInt(request.getParameter("postId"));

           User currentUser = (User) httpSession.getAttribute("user");
            int userId = currentUser.getUserId();

            Post post = new Post(title, body);

            //from post database
            PostDatabase postDatabase = new PostDatabase(DBConnection.getConnection());


        try {
            if(postDatabase.updatePost( userId, postId, post)){
                out.println("Post updated successfully");
                httpSession.setAttribute("message", "successful");
            }else{
                out.print("500 error");
                httpSession.setAttribute("message", "Error ");
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

        response.sendRedirect("home.jsp");

    }

}
