<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Profile</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<style type="text/css">
body{
background-color: #dcdcdc45;
}

.userStyle{
padding: 10px;
    margin: 10px;
}


</style>
</head>
<body>
<header class="header" style="background-color: #ffffff;box-shadow: 1px 2px 10px grey;">

		<nav class="navbar navbar-style">
			<div class="container">
				<div class="navbar-header">
					<h2 class=" display-3">Flight Booking</h2>
				</div>
				<ul class="nav navbar-nav  navbar-right"	>
					<c:if test="${sessionScope.admin ==1}">
				<li><a href="/home"> Home</a></li>
				</c:if>
				<c:if test="${sessionScope.userEmail.equals('no')}">
						<li>	<a  style="cursor: pointer" data-toggle="modal" data-target="#myModal">Login/Singup</a></li>
					</c:if>
				<c:if test="${!sessionScope.userEmail.equals('no')}">
						<li><p style="color: #4285c0;margin: 15px;"> Welcome , ${sessionScope.userName}</p></li>
						<li>	<a  href="/userProfile">Profile</a></li>
						<li>	<a  href="/logout">Logout</a></li>
					</c:if>
				</ul>

			</div>

		</nav>
		
	</header>
	
	<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Login</h4>
      </div>
      <div class="modal-body">
         <form action="login" method="post">
 		<div class="form-group">
 		<label for="emailId">Email</label>
   		 <input class="form-control"type="text" id="emailId" name="emailId" placeholder="Email" required="required">
 		</div>
     	<div class="form-group">
     	<label for="password">Password</label>
    	<input class="form-control" type="password" id="password" name="password" placeholder=" Password" required="required">
     	</div>
     	    	
   		 <input type="submit" class="btn btn-primary btn-block" value="Submit">
  		</form>
  		<br>
  		<a class="btn btn-primary btn-block" href="/register">Register</a>
 
</div>

      </div>
     
    </div>

  </div>
  
 <!-- Headder end -->
 
 
 
 
 
 
 	<div id="changePasswordl" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Login</h4>
      </div>
      <div class="modal-body">
         <form action="/changePassword" method="post">
         
         
           <div class="form-group">
   <label for="password">Password</label>
    <input type="password" class="form-control" id="pass" name="password" placeholder=" Password" required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" onchange="checkPassword()">
  
  </div>
  
     <div class="form-group">
  <label for="lname">Repeat Password</label>
    <input type="password" class="form-control" id="repeatPassword" name="repeatPassword" placeholder="Repeat New Password" required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" onkeyup="checkPassword()">  
  
  </div>
     
     	    	
   		 <input type="submit" id="submit" class="btn btn-primary btn-block" value="Submit">
  		</form>
  		<br>
  		
 
</div>

      </div>
     
    </div>

  </div>
 
 
 
 
 
 
<div class="container">
<div class="row">

<div class="col-lg-1" ></div>
<div class="col-lg-10 jumbotron jumbotron-fluid" >
<div class="row userStyle">
<div class="col-lg-3">
 Name
</div>
<div class="col-lg-9">
 ${user.getFirstName() } ${user.getLastName()}
</div>
</div>

<div class="row userStyle">
<div class="col-lg-3">
 Mobile Number
</div>
<div class="col-lg-9">
 ${user.getMobileNumber() }
</div>
</div>

<div class="row userStyle">
<div class="col-lg-3">
Email 
</div>
<div class="col-lg-9">
 ${user.getEmailId() }
</div>
</div>

<div class="row userStyle">
<div class="col-lg-3">
Password:  
</div>
<div class="col-lg-2">
*******
</div>
<div class="col-lg-7">
<a data-toggle="modal" data-target="#changePasswordl">Change password</a>
</div>
</div>
<div class="row userStyle">
<a class="btn btn-primary btn-block"href="/updateInfo">updateInformation</a>
</div>

<div class="row userStyle">
<a class="btn btn-primary btn-block" href="/pastBooking">view current booking</a>
</div>



</div>
<div class="col-lg-1"></div>

</div>

</div>


<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
function checkPassword(){
	
	var a=document.getElementById("pass").value;
	var b=document.getElementById("repeatPassword").value;
	
	if(a!=b){
		document.getElementById("repeatPassword").style.border="1px solid red";
		document.getElementById("submit").disabled=true;
		}else{
			document.getElementById("repeatPassword").style.border="none";
			document.getElementById("submit").disabled=false;
			}
}
</script>

</body>
</html>