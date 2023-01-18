package com.bctech.postland.Controllers;


import com.bctech.postland.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteCommentServlet", value = "/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * Servlet method for comment deletion
     * @param request
     * @param response
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter();) {
            out.println("<html><body>");
            out.println("<h1>" + "Servlet Registration example" + "</h1>");
            out.println("</body></html>");

            //postId from client
            int postId = Integer.parseInt(request.getParameter("postId"));

            //get current in session
            HttpSession httpSession = request.getSession();
            User user = (User) httpSession.getAttribute("user");

//            //comment DOA
//            CommentDatabase commentDatabase = new CommentDatabase(DbConnection.getConnection());
//
//            if(commentDatabase.deleteComment(postId, user.getId())){
//                response.getWriter().write("Success deleting comment");
//            }else{
//                httpSession.setAttribute("message", "error deleting comment or you don't have access to delete this comment");
//            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
