package com.tech.blog.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(urlPatterns = "/addPostServlet", name = "AddPostServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddPostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Getting form data
        String pTitle = request.getParameter("pTitle");
        String pContent = request.getParameter("pContent");
        String pCode = request.getParameter("pCode");
        Part part = request.getPart("pic");
        int cid = Integer.parseInt(request.getParameter("cid"));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");

        if (user == null) {
            response.sendRedirect("login_page.jsp");
            return;
        }

        // Get the file name
        String fileName = part.getSubmittedFileName();
        
        // Define absolute folder path (change this as needed)
        String folderPath = "C:/Users/DELL/eclipse-workspace/technologyblogs/src/main/webapp/blog_pics"; // Windows
        // String folderPath = "/home/yourUsername/blog_pics"; // Linux

        File uploadDir = new File(folderPath);
        
        // Ensure the directory exists
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
        // Save the file
        String filePath = folderPath + File.separator + fileName;
        System.out.println("Saving image at: " + filePath); // Debugging
        
        try {
            // Creating post object
            Post post = new Post(pTitle, pContent, pCode, fileName, cid, user.getId());
            PostDao dao = new PostDao(ConnectionProvider.getConnection());

            if (dao.savePost(post)) {
                // Save the file in the absolute path
                if (Helper.saveFile(part.getInputStream(), filePath)) {
                    out.println("done");
                } else {
                    out.println("Error saving file.");
                }
            } else {
                out.println("Error adding post.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("An error occurred: " + e.getMessage());
        } finally {
            out.close();
        }
    }
}
