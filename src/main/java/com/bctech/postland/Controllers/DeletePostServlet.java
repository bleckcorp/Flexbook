package com.bctech.postland.Controllers;


import com.bctech.postland.DAO.PostDatabase;
import com.bctech.postland.DBConnection.DBConnection;
import com.bctech.postland.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeletePostServlet", value = "/DeletePostServlet")
public class DeletePostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * Servlet method for post deletion
     * @param request
     * @param response
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()) {
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");

            // post id from client
            int postId = Integer.parseInt(request.getParameter("postId"));

            //get current user in session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");

            //comment DOA
            PostDatabase postDatabase = new PostDatabase(DBConnection.getConnection());

            if(postDatabase.deletePost(user.getUserId(), postId)){
                response.getWriter().write("Success deleting post");
            }else{
                response.getWriter().write("Failed do delete post or you don't have access to delete this post");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
