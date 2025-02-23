<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.tech.blog.entities.Massage" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!-- css code -->
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
   <main  class="d-flex align-items-center primary-background banner-background" style="height:70vh"> 
   <div class="container">
   <div class="row">
   <div class="col-md-4 offset-md-4">
   
   <div class="card"> 
   <div class="card-header text-white text-center" style="background:#7e57c2">
   <span class="fa fa-user-plus fa-3x"></span>
   <br>
   <p>Login Here</p>
   </div>
   
  <%
  Massage m=(Massage)session.getAttribute("msg");
  if(m!=null){
	%>
	    <div class="alert <%=m.getCssClass() %>" role="alert">
        <%=m.getContent() %>
</div>
	<% 
	session.removeAttribute("msg");
  }
  %>
   <div class="card-body"> 
   <form action="loginservlet" method="POST">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="container text-center"> 
  <button type="submit" class="btn btn-primary" style="background:#7e57c2">Submit</button>
</div>
</form>
   </div>
   
   </div>
   </div>
   </div>
   </div>
   </main>

<!-- Javacripts -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="javascript/myjs.js" type="text/javascript"></script>
</body>
</html>

