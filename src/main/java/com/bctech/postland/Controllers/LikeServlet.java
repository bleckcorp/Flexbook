package com.bctech.postland.Controllers;

import com.bctech.postland.DAO.LikeDatabase;
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
import java.sql.SQLException;

@WebServlet(name = "LikeServlet", value = "/LikeServlet")
public class LikeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * Servlet method for like
     * @param request
     * @param response
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter();){
            out.println("<html><body>");
            out.println("<h1>" + "Servlet Registration example" + "</h1>");
            out.println("</body></html>");

            //fetch data from post form client
            int action = Integer.parseInt(request.getParameter("action"));
            int postId = Integer.parseInt(request.getParameter("postId"));

            //get current user
            HttpSession httpSession = request.getSession();
            User user = (User) httpSession.getAttribute("user");

            //from like DOA
            LikeDatabase likeDataBase = new LikeDatabase(DBConnection.getConnection());

            System.out.println("got here");

            System.out.println(action);

            boolean likeAction = true;

            boolean result = likeDataBase.likeOrUnlikePost(user.getUserId(), postId,likeAction);

            if(result){
                response.getWriter().write("Success liking/disliking post");
            }
        else{
                out.print("500 error");
                response.getWriter().write("Failed to liking post");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
