package com.tech.blog.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig()
@WebServlet(urlPatterns = "/registerservlet", name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");

        String check = request.getParameter("checked");

        // Validate checkbox
        if (check == null || !check.equals("on")) {
            response.getWriter().println("Please agree to the terms and conditions.");
            return;
        }

        // Fetch user details
        String name = request.getParameter("user_name");
        String email = request.getParameter("user_email");
        String password = request.getParameter("user_password");
        String gender = request.getParameter("user_gender");
        String about = request.getParameter("user_about");

        // Validate inputs
        if (name == null || name.isEmpty() || email == null || email.isEmpty() ||
            password == null || password.isEmpty() || gender == null || gender.isEmpty() ||
            about == null || about.isEmpty()) {
            response.getWriter().println("Please fill in all fields.");
            return;
        }

        // Sanitize inputs
        name = name.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
        about = about.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

        // Create User object
        User user = new User(name, email, password, gender, about);

        // Save user to database
        try {
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            boolean isSaved = dao.saveUser(user);
            if (isSaved) {
                response.getWriter().println("done");
            } else {
                response.getWriter().println("An error occurred while registering. Please try again later.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Server error occurred. Please try again later.");
        }
    }
}
