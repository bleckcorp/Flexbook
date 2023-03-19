package com.flexbook.flexbook.controller;

import com.flexbook.flexbook.DAO.PostDatabase;
import com.flexbook.flexbook.model.Post;
import com.flexbook.flexbook.model.User;
import com.flexbook.flexbook.utilities.ConnectionManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet(name = "PostServlet", value = "/PostServlet")
@MultipartConfig
public class PostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        try (PrintWriter out = response.getWriter();) {
            out.println("<html><body>");
            out.println("<h1>" + "Servlet Registration example" + "</h1>");
            out.println("</body></html>");

            HttpSession httpSession = request.getSession();

            //Getting data from the form post action
            Part part = request.getPart("file");
            String imageName = part.getSubmittedFileName();
            String title = request.getParameter("title");
            String body = request.getParameter("body");

            User currentUser = (User) httpSession.getAttribute("user");
            int userId = currentUser.getId();

            if (imageName.equals("")) {
                httpSession.setAttribute("message", "Enter a picture");
                response.sendRedirect("home.jsp");
                return;
            }

            //get file path
            String path = "/Users/decagon/Documents/Java Projects/FlexBook/src/main/webapp/image" + File.separator + imageName;

            InputStream in = part.getInputStream();
            boolean success = putFile(in, path);

            if (success) {
                Post post = new Post(title, body, imageName);
                PostDatabase postDatabase = new PostDatabase(ConnectionManager.getConnection());

                if (postDatabase.createPost(userId, post)) {
                    out.println("File uploaded to this directory " + path);
                    httpSession.setAttribute("message", "File uploaded successfully");
                } else {
                    out.print("500 error");
                    httpSession.setAttribute("message", "Error uploading image to database");
                }
            } else {
                out.print("error");
                httpSession.setAttribute("message", "error uploading file");
            }
            response.sendRedirect("home.jsp");
        } catch (Exception e) {
//            System.out.println(e.getMessage());
        }
    }


    public boolean putFile(InputStream in, String path) {
        boolean flag = false;

        try {
            byte[] byt = new byte[in.available()];
            in.read(byt);
            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
   }
}
