package com.bctech.postland.Controllers;


import com.bctech.postland.DAO.CommentDatabase;
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

@WebServlet(name = "EditCommentServlet", value = "/EditCommentServlet")
public class EditCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * Servlet method for comment editing
     * @param request
     * @param response
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter();) {
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");

            //post id from client
            int postId = Integer.parseInt(request.getParameter("postId"));
            String comment = request.getParameter("editedComment");

            //get current user in session
            HttpSession httpSession = request.getSession();
            User user = (User) httpSession.getAttribute("user");

            //from comment DOA
            CommentDatabase commentDatabase = new CommentDatabase(DBConnection.getConnection());

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
