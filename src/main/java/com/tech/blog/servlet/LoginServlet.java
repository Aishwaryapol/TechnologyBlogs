package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Massage;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/loginservlet", name = "LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // HTML structure starts here
        out.println("<!DOCTYPE html>"); 
        out.println("<html>"); 
        out.println("<head>");
        out.println("<title>Login Page</title>"); 
        out.println("<meta charset='UTF-8'>"); 
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>"); 
        out.println("<style>"); 
        out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }");
        out.println(".container { max-width: 600px; margin: 50px auto; padding: 20px; background-color: white; box-shadow: 0 0 10px rgba(0,0,0,0.1); }");
        out.println("</style>"); 
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");

        // Get user email and password from the request 
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");
        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        User u = dao.getUserByeEmailAndPassword(userEmail, userPassword);

        if (u == null) {
            //out.println("<h2>Invalid details ..try again</h2>");
        	Massage msg=new Massage("Invalid Details! try with another..","error","alert-danger");
        	response.sendRedirect("login.jsp");
        	HttpSession s=request.getSession();
        	s.setAttribute("msg",msg);
        	} else {
            // login successs
            HttpSession s = request.getSession();
            s.setAttribute("currentUser", u);
            response.sendRedirect("profile.jsp");
        }

        out.println("</div>");
        out.println("</body>"); 
        out.println("</html>");
        out.close(); 
    }
}
