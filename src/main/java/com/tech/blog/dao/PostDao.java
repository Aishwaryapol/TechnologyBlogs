package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
   Connection con;
   public PostDao(Connection con)
   {
	   this.con=con;
   }
   public ArrayList<Category> getAllCategories()
   {
	   ArrayList<Category>list=new ArrayList<Category>();
	   try {
		   String q="select * from categories";
		   Statement st=this.con.createStatement();
		  ResultSet set=st.executeQuery(q);
		  while(set.next())
		  {
			  int cid=set.getInt("cid");
			  String name=set.getString("name");
			  String description=set.getString("description");
			  Category category=new Category(cid,name,description);
			  list.add(category);
		  }
	   }catch(Exception e)
	   {
		   e.printStackTrace();
	   }
	   return  list;
   }
   
   public boolean savePost(Post p)
   {
	   boolean f=false;
	   try {
		   
		   String q="insert into post (pTitle,pContent,pCode,pPic,catId,userid)values(?,?,?,?,?,?)";
		   PreparedStatement pstm=con.prepareStatement(q);
		  pstm.setString(1, p.getpTitle());
		  pstm.setString(2, p.getpContent());
		  pstm.setString(3,p.getpCode());
		  pstm.setString(4, p.getpPic());
		  pstm.setInt(5, p.getCatId());
		  pstm.setInt(6, p.getUserId());
		  pstm.executeUpdate();
		  f=true;
	   }catch (Exception e) {
		e.printStackTrace();
	}
	   return f;
   }
   
   //get all the post
   public List<Post> getAllPost(){
	   List<Post> list=new ArrayList<Post>();
	   
	   //fetch all the post 
	   try {
		PreparedStatement p=con.prepareStatement("select * from post order by pid desc");
		ResultSet set=p.executeQuery();
		while (set.next()) {
			
			int pid=set.getInt("pid");
			String pTitle=set.getString("pTitle");
			String pContent=set.getString("pContent");
			String  pCode=set.getString("pCode");
			String pPic=set.getString("pPic");
			Timestamp pDate=set.getTimestamp("pDate");
			int catId=set.getInt("catId");
			int userId=set.getInt("userid");
		Post post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
		list.add(post);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
   }
   
   public List<Post> getPostBycatId(int catId)
   {
	   List<Post> list=new ArrayList<Post>();
	   //fetch all post by catId
	   try {
			PreparedStatement p=con.prepareStatement("select * from post where catId=?");
			p.setInt(1, catId);
			ResultSet set=p.executeQuery();
			while (set.next()) {
				
				int pid=set.getInt("pid");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String  pCode=set.getString("pCode");
				String pPic=set.getString("pPic");
				Timestamp pDate=set.getTimestamp("pDate");
				
				int userId=set.getInt("userid");
			Post post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	   return null;
   }
}
