package com.bctech.postland.Controllers;


import com.bctech.postland.DAO.CommentDatabase;
import com.bctech.postland.DBConnection.DBConnection;
import com.bctech.postland.models.Comment;
import com.bctech.postland.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "CommentServlet", value = "/CommentServlet")
public class CommentServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()){

            //fetch data from post form
            int postId = Integer.parseInt(request.getParameter("postId"));

            //get current user
            HttpSession httpSession = request.getSession();
            User currentUser = (User) httpSession.getAttribute("user");
            int userId = currentUser.getUserId();

            //from the comment DAO
            CommentDatabase commentDatabaseDatabase = new CommentDatabase(DBConnection.getConnection());
            List<Comment> comments = null;

            if(!comments.isEmpty()){
                out.println("comments retrieved successfully");
                httpSession.setAttribute("message", "successful");
                httpSession.setAttribute("user",currentUser);
                httpSession.setAttribute("comments",comments);
            }else{
                out.print("404 not found");
                httpSession.setAttribute("user",currentUser);
                httpSession.setAttribute("message", "No comment associated with post");
            }

            response.sendRedirect("comment.jsp");

        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    /**
     * Servlet method for comment creation
     * @param request
     * @param response
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter();){
            out.println("<html><body>");
            out.println("<h1>" + "Servlet Registration example" + "</h1>");
            out.println("</body></html>");

            //fetch data from post form
            String comment = request.getParameter("comment");
            int postId = Integer.parseInt(request.getParameter("postId"));

            //get current user
            HttpSession httpSession = request.getSession();
            User currentUser = (User) httpSession.getAttribute("user");
            int userId = currentUser.getUserId();

            //from the comment DOA
            CommentDatabase commentDatabaseDatabase = new CommentDatabase(DBConnection.getConnection());

//            if(commentDatabaseDatabase.createComment(userId,postId,comment)){
//               out.println("File uploaded to this directory");
//               httpSession.setAttribute("message", "successful");
//               httpSession.setAttribute("user",currentUser);
//            }else{
//               out.print("500 error");
//               httpSession.setAttribute("user",currentUser);
//               httpSession.setAttribute("message", "Error posting comment");
//            }

            response.sendRedirect("home.jsp");

        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

}
