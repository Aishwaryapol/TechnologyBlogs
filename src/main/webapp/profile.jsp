<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.entities.Massage" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page errorPage="error_page.jsp" %>
<%   
User user = (User) session.getAttribute("currentUser");
if (user == null) {
    response.sendRedirect("login.jsp");
    return; // Ensure to stop further execution after redirect
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <link href="css/mystyle.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
  <!--  navbar  -->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-laptop"> </span> Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-user-circle-o"></span> LearnCode with Ansh <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="fa fa-check-square-o"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Languages</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> Contact</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">
        <span class="fa fa-pencil"></span> Do Post
        </a>
      </li>
      
      
    </ul>
    <ul class="navbar-nav ml-auto">
    <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName() %></a>
      </li>
    <li class="nav-item">
        <form action="logoutservlet" method="post">
            <button class="btn btn-link nav-link" type="submit"><span class="fa fa-user-plus"></span> LogOut</button>
        </form>
    </li>
    </ul>
  </div>
</nav>
<!-- End of navbar -->

<!--  Main body of the page -->
 <main>
 <div class="container">
 <div class="row mt-4">
 <div class="col-md-4">
 <!-- Categories -->
 <div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active">
All Posts  </a>
<!-- Categories -->
<% 
PostDao d=new PostDao(ConnectionProvider.getConnection());
    ArrayList<Category> list1=d.getAllCategories();    
	for(Category cc :list1)
	{
		%>
		  <a href="#" onclick="getPosts(<%= cc.getCid() %>)" class="list-group-item list-group-item-action"><%=cc.getName()%></a>
		
	<%  }
%>
  
</div>
 </div>
 
 <div class="col-md-8" >
 <!--  Posts here -->
  <div class="container text-center" id="loader">
    <i class="fa fa-refresh fa-spin fa-4x"></i>
    <h3 class="mt-2"> Loading...</h3>
</div>
 
  
 <div class="container-fluid" id="post-container">  </div>
 </div> 
 </div>
  </div>
 </main>
  
<!-- End body of the page  -->

<%
Massage m=(Massage) session.getAttribute("msg");
if(m!=null){
%>
<div class="alert <%= m.getCssClass() %>" role="alert">
<%= m.getContent() %>
</div>
<%  
   session.removeAttribute("msg");
}
%>
<!--  start of profile Model  -->


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
       
<img src="pics/<%= user.getProfile() %>" alt="Profile Image" class="img-fluid" style="border-radius: 50%; max-width: 150px;">        <br>
      <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName() %></h5>
        <!-- Details are  -->
        <div id="profile-details">
   <table class="table">
  <tbody>
    <tr>
      <th scope="row">ID : </th>
      <td><%= user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%= user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%= user.getGender() %></td>
     
    </tr>
    <tr>
      <th scope="row">Status :</th>
      <td><%= user.getAbout() %></td>
     
    </tr>
    <tr>
      <th scope="row">Registerd on  :</th>
     <td><%= user.getDateTime().toString() %></td> 
     
    </tr>
  </tbody>
</table>
 </div>
 <!-- profile edit  -->
 <div id="profile-edit" style="display:none;">
 <h3 class=mt-2> Please Edit Carefully</h3>
 <form action="editservlet" method="POST" enctype="multipart/form-data">
 <table class="table" > 
 <tr> 
  <td>ID :</td>
 <td><%= user.getId() %></td>
 </tr>
 <tr>
 <td>Email :</td>
 <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
 </tr>
 
  <tr>
 <td>Name :</td>
 <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
 </tr>
 
  <tr>
 <td>Password :</td>
 <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
 </tr>
 
  <tr>
 <td>About :</td>
 <td>
 <textarea class="form-control" rows="5" name="user_about"> 
 <%= user.getAbout() %>
 </textarea>
 </td>
 </tr>
 
  <tr>
 <td>New Profile :</td>
 <td><input type="file" class="form-control" name="image"></td>
 </tr>
 
 </table>
 <div class="container">
 <button type="submit" class="btn primary-background">Save </button>
 </div>
 </form>
 </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-profile-btn" class="btn primary-background">Edit</button>
      </div>
    </div>
  </div>
</div>

<!--  End of Profile Model -->

<!--  Add post modal -->


<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="add-post-form" action="addPostServlet" method=post enctype="multipart/form-data"> 
        <div class="form-group">
        <select class="form-control" name="cid">
        <option selected disabled>--Select Category--</option>
        <%
        PostDao post=new PostDao(ConnectionProvider.getConnection());
        ArrayList <Category> list =post.getAllCategories();
        for(Category c:list)
        {
        %>
       <option value="<%= c.getCid() %>"><%= c.getName() %></option>


        
        <%
        }
        %>
        </select>
        </div>
        <div class="form-group"> 
        <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/> 
        </div>
        <div class="form-group">
        <textarea name="pContent" style="height:200px;"class="form-control" placeholder="Enter Your Content"></textarea>
        </div>
        <div class="form-group">
        <textarea name="pCode" style="height:200px;"class="form-control" placeholder="Enter Your Program (if any)"></textarea>
        </div>
        <div class="form-group">
        <label>Select your pic..</label>
        <br>
        <input  name="pic" type="file"/>
        </div>
        <div class='container text-center'>
        <button type="submit" class="btn btn-outline-primary">
        Post
        </button>
        </div>
        </form>
      </div>
      
    </div>
  </div>
</div>
<!--  end post modal  -->
  <!-- Javacripts -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="javascript/myjs.js" type="text/javascript"></script>
<script type="text/javascript">
   $(document).ready(function (){
       let editStatus = false;
       $('#edit-profile-btn').click(function () {
           if (editStatus == false) {
               $('#profile-details').hide();
               $('#profile-edit').show();
               editStatus = true;
               $(this).text("Back");
           } else {
               $('#profile-details').show();
               $('#profile-edit').hide();
               editStatus = false;
               $(this).text("Edit");
           }
       });
   });
</script>

<!-- SweetAlert Script -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" 
    integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" 
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- Add Post Form Submission -->
<script> 
   $(document).ready(function () {
       $("#add-post-form").on("submit", function(event) {
           event.preventDefault();  // Prevent default form submission
           console.log("You have clicked on submit");

           let form = new FormData(this);

           $.ajax({
               url: "addPostServlet",
               type: "POST",
               data: form,
               processData: false,
               contentType: false,
               success: function (data) {
                   console.log(data);
                   if (data.trim() == 'done') {
                       swal("Good job!", "Saved Successfully", "success");
                   } else {
                       swal("Error!", "Something went wrong, try again!", "error");
                   }
               },
               error: function () {
                   swal("Error!", "Something went wrong, try again!", "error");
               }
           });
       });
   });
</script>

<!-- Load Posts -->
<script>
function getPosts(catId) {
	//$('#loader').show();
	//$('#post-container').hide();
    console.log("Category ID:", catId); // Debugging line
    $.ajax({
        url: "load_post.jsp",
        type: "POST", // Make sure the request type is correct
        data: { cid: catId },
        success: function (data) {
            console.log(data); // Log the response data
            $('#loader').hide();
            $('#post-container').html(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error("Error loading posts:", errorThrown);
        }
    });
}

$(document).ready(function () {
    getPosts(0);
});


   $(document).ready(function () {
	   
      getPosts(0);
   });
</script>

</body>
</html>
