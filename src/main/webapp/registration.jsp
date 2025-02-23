<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
  	<!-- css code -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link href="css/mystyle.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
</head>
<body>
<!-- navbar-->
  <%@include file="navbar.jsp" %> 
<main class="primary-background banner-background" style="padding-bottom:80px;">
<div class="container">
  <div class="col-md-6 offset-md-3">
  <div class="card">
  <div class="card-header text-center text-white" style="background:#7e57c2"><span class="fa fa-3x fa-user-circle"> </span><br> Register Here</div>
  <div class="card-body"> 
  <form id="reg-form" action="registerservlet" method="POST">
  
 <div class="form-group">
    <label for="user_name">user name</label>
    <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
   
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input  name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group">
    <label  for="gender">Select gender</label>
    <br>
    <input type="radio" value="male"  name="user_gender" id="gender1">Male
    <input type="radio"  value="female" name="user_gender" id="gender2">Female
  </div>
  
   <div class="form-group">
   <textarea rows="4"   class="form-control"  id="" placeholder="Enter something about yourself" name="user_about"></textarea>
  
   </div>
  <div class="form-check">
    <input name="checked" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
  </div>
  <br> 
  <div id="loader" style="display:none;" class="container text-center"> <span class="fa fa-ravelry fa-spin fa-3x"> </span>
  <h4> Please Wait....</h4>
  </div>
  <br>
  <button id="submit-btn" type="submit" class="btn btn-primary" style="background:#7e57c2">Submit</button>
</form>
  </div>
  <div class="card-footer"> </div>
  </div>
  </div>
</div>
</main>

<!-- Javacripts -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="javascript/myjs.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" ></script>
    
<script>
    $(document).ready(function() {
        console.log("Page loaded...");

        
        $('#reg-form').on('submit', function(event) {
            event.preventDefault();

            // Log to confirm event handling
            console.log("Form submission intercepted.");
           
            // Create FormData object
            let form = new FormData(this);
		$("#submit-btn").hide();
		$("#loader").show();
            // Log FormData keys and values for debugging
            for (let [key, value] of form.entries()) {
                console.log(`${key}: ${value}`);
            }

            // Send the form data via AJAX
            $.ajax({
                url: "registerservlet",
                type: "POST",
                data: form,
                processData: false,
                contentType: false,
                success: function(data, textStatus, jqXHR) {
                    console.log("Success Response:", data);
                    
                    $("#submit-btn").show();
            		$("#loader").hide();
            		if(data.trim()==='done'){
            		swal("Registered Succesfully.")
            		.then((value) => {
            		  window.location="login.jsp"
            		});
            		}else
            			{
            			swal(data);
            			}
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("Error Response:", jqXHR);
                   
                    $("#submit-btn").show();
            		$("#loader").hide();
            		swal("Something Went wrong..try again.");
            		
                }
            });
        });
    });
</script>

</body>
</html>