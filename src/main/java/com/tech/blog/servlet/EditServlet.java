package com.tech.blog.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Massage;
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
@MultipartConfig
@WebServlet(urlPatterns = "/editservlet", name = "EditServlet")
public class EditServlet extends HttpServlet {
	 
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
	      
	      out.println("</head>");
	      out.println("<body>");
	     
	     // fetch all data 
	      String userEmail=request.getParameter("user_email");
	      String userName=request.getParameter("user_name");
	      String userPassword=request.getParameter("user_password");
	      String userAbout=request.getParameter("user_about");
	      Part part=request.getPart("image");
	      String imageName=part.getSubmittedFileName();
	      
	      // get the user from the session
	      HttpSession s=request.getSession();
	    User user=(User)  s.getAttribute("currentUser");
	      user.setEmail(userEmail);
	      user.setName(userName);
	      user.setPassword(userPassword);
	      user.setAbout(userAbout);
	      String oldFile=user.getProfile();
	      user.setProfile(imageName);
	      // change data into database .. pass the user object into dao 
	      UserDao u=new UserDao(ConnectionProvider.getConnection());
	   boolean ans=   u.updateUser(user);
	   
	      if(ans)
	      {	   
	    	  String path = getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();
	    	  //delete old image
	    	 
	    	  String pathOldFile = getServletContext().getRealPath("/") + "pics" + File.separator +oldFile;
	    	if(oldFile.equals("default.png"))
	    	{
	    	  Helper.deleteFile(pathOldFile);
	    	}
		  if( Helper.saveFile(part.getInputStream(), path))
		  {
			  
			  Massage msg=new Massage("profile details updated..","success","alert-success");
	        
	        	s.setAttribute("msg",msg);
	        	
		  }
		  else {
			  out.println("error");
			  Massage msg=new Massage("Something went wrong..","error","alert-danger");
		        
	        	s.setAttribute("msg",msg);
		  }
	   
	      }
	      else {
	    	  Massage msg=new Massage("Something went wrong..","error","alert-danger");
		        
	        	s.setAttribute("msg",msg);
	      }
	      response.sendRedirect("profile.jsp");
	      out.println("</body>"); 
	      out.println("</html>");
	      out.close(); 
	  }

	  }

