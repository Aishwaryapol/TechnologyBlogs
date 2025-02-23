package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.blog.entities.User;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    // Method to insert a user into the database
    public boolean saveUser(User user) {
        boolean isSuccess = false;
        try {
            String query = "INSERT INTO user (name, email, password, gender, about) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            // Execute the update
            pstmt.executeUpdate();
            isSuccess = true;
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return isSuccess;
    }
    //get user by usermail and userpassword
    public User getUserByeEmailAndPassword(String email,String password) {
    	
    	User user=null;
    	try {
    		String query="select * from user where email=? and password=?";
    		PreparedStatement pstmt = this.con.prepareStatement(query);
    		 
             pstmt.setString(1, email);
             pstmt.setString(2, password);
             ResultSet set=pstmt.executeQuery();
             if(set.next())
             {
            	 user= new User();
            	 //data from db
            	 String name=set.getString("name");
            	 //set data user object
            	 user.setName(name);
                 user.setId(set.getInt("id"));
                 user.setEmail(set.getString("email"));
                 user.setPassword(set.getString("password"));
                 user.setGender(set.getString("gender"));
                 user.setAbout(set.getString("about"));
                 user.setDateTime(set.getTimestamp("rdate"));
                 user.setProfile(set.getString("profile"));
             }
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return user;
    }
    
    public boolean  updateUser(User user)
    {
    	boolean f=false;
    	try {
    		String query ="update user set name=? ,email=? ,password=? , about=? ,profile=? where id=?";
    		PreparedStatement stmt=con.prepareStatement(query);
    		stmt.setString(1, user.getName());
    		stmt.setString(2,user.getEmail() );
    		stmt.setString(3,user.getPassword() );
    		stmt.setString(4,user.getAbout() );
    		stmt.setString(5,user.getProfile() );
    		stmt.setInt(6, user.getId());
    		stmt.executeUpdate();
    		f=true;
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return f;
    }
}

