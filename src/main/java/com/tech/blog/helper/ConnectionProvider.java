package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
 private static  Connection con;
  public static Connection getConnection()
  {
	  try
		{
		   if(con==null) {
			   Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/technoblogsdb","root","@anshpol19");
			System.out.println("Connected database succesFully");
		   }
		}catch(Exception e)
		{
			System.out.println("Not connected database");  
			e.printStackTrace();
		}
	
  
	  return con;
	 
  
  }
}
