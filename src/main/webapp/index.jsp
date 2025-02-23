<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link href="css/mystyle.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <style type="text/css">
   .banner-background{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 94% 48%, 100% 100%, 17% 100%, 0 75%, 0 0);   }
 </style>

</head>
<body>
  <!-- navbar-->
  <%@include file="navbar.jsp" %>
 
 <!-- Banner creation  -->
 <div class="container-fluid p-0 m-0">
 <div class="jumbotron text-white primary-background banner-background">
 <div class="container"> <h3 class="display-3">Welcome To Techblog </h3>
 
 <p>Welcome to Technical blog , world of technology 
 Programming languages differ from natural languages in that natural 
 languages are used for interaction between people, while programming languages are 
 designed to allow humans to communicate instructions to machines</p>
    <button class="btn btn-outline-light btn-lg"><span class="fa fa-external-link"></span> Start !its Free</button>
    <a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user fa-spin"> </span>  Login</a>
 </div>

 </div>
 </div>
  <!--  Cards here -->
 <div class="container">
 <div class="row" > 
 <div class="col-md-4 mb-2"> 
 <div class="card">
  
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More...</a>
  </div>
</div>
  </div>
   <div class="col-md-4"> 
 <div class="card">
  
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More...</a>
  </div>
</div>
  </div>
   <div class="col-md-4"> 
 <div class="card">
  
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More...</a>
  </div>
</div>
  </div>
 </div> 
 <div class="row" > 
 <div class="col-md-4"> 
 <div class="card">
  
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More...</a>
  </div>
</div>
  </div>
   <div class="col-md-4"> 
 <div class="card">
  
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More...</a>
  </div>
</div>
  </div>
   <div class="col-md-4"> 
 <div class="card">
  
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More...</a>
  </div>
</div>
  </div>
 </div> 
 </div>
 
 <!-- Javacripts -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="javascript/myjs.js" type="text/javascript"></script>
</body>
</html>
