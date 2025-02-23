package com.tech.blog.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Massage;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet(urlPatterns = "/logoutservlet", name = "LogoutServlet")
public class LogoutServlet extends HttpServlet {
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
     HttpSession s=request.getSession();
     s.removeAttribute("currentUser");
     Massage m=new Massage("Logout Succesfully","success","alert-success");
     s.setAttribute("msg", m);
     response.sendRedirect("login.jsp");
     
    
      out.println("</body>"); 
      out.println("</html>");
      out.close(); 
  }

  }

