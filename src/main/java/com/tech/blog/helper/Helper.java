package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
  public static boolean deleteFile(String path)
  {
	  boolean f=false;
	  try {
		 File file=new File(path); 
		f= file.delete();
		
		 }catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return f;
  }

	    public static boolean saveFile(InputStream is, String path) {
	        boolean f = false;
	        try {
	            FileOutputStream fos = new FileOutputStream(path);
	            byte[] buffer = new byte[1024]; // Read in 1KB chunks
	            int bytesRead;
	            while ((bytesRead = is.read(buffer)) != -1) {
	                fos.write(buffer, 0, bytesRead);
	            }
	            fos.close();
	            is.close();
	            System.out.println("File saved successfully at: " + path);
	            f = true;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return f;
	    }
	}

