<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sorry something went wrong!..</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link href="css/mystyle.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style type="text/css">
   .banner-background{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 94% 48%, 100% 100%, 17% 100%, 0 75%, 0 0);   }
 </style>
</head>
<body>
    <div class="container text-center "> 
    <img src="img/computer.png" class="img-fluid">
    <h3 class="display-3"> Sorry! Something went wrong....</h3>
    <%= exception  %>
    <a href="index.jsp" class="btn btn-lg text-white primary-background mt-3"> Home</a>
    </div>
</body>
</html>