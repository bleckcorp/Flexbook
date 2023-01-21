package com.flexbook.flexbook.controller;

import com.flexbook.flexbook.DAO.PostDatabase;
import com.flexbook.flexbook.model.User;
import com.flexbook.flexbook.utilities.ConnectionManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteServlet", value = "/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()) {
           response.setContentType("text/plain");
           response.setCharacterEncoding("UTF-8");
            int postId = Integer.parseInt(request.getParameter("postId"));
           //Do something here
            HttpSession session = request.getSession();
          User user =  (User)session.getAttribute("user");
//            int userId = user.getId();
//            System.out.println("Post Id is here "+postId);

            PostDatabase postDatabase = new PostDatabase(ConnectionManager.getConnection());

            if(postDatabase.deletePost(user.getId(), postId)){
               // out.println("Post Deleted Succesfully");
                response.getWriter().write("Post deleted succesfully");
            }else{

                response.getWriter().write("Access denied deleting this post");
            }

           // response.sendRedirect("home.jsp");

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
