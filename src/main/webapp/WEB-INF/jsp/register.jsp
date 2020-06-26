<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style type="text/css">
	.styleForm{
		margin: 10px;
    	padding: 10px;
    	box-shadow: 0px 1px 10px grey;
	}
	body{
background-color: #dcdcdc45;
}
.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
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
				<li><a href="/home"> Home</a></li>
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
     	<div class="form-check form-check-inline">
  		<input class="form-check-input" type="radio" name="loginType" id="economy" value="User" required="required">
 		 <label class="form-check-label" for="economy">User</label>
		</div>
		<div class="form-check form-check-inline">
  		<input class="form-check-input" type="radio" name="loginType" id="Premimum Economy" value="Admin" required="required">
 		 <label class="form-check-label" for="Premimum Economy">Admin</label>
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
  <c:if test="${userAlready >=1}">
  <div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Error!</strong> User Already Exsist Please Login.
</div>
  </c:if>
<div class="container">
<h3> Registration</h3>
</div>
<div class="container">
<div class="row">
<div class="col-lg-1  "></div>
<div class="col-lg-10 styleForm">
  <form action="submitData" method="post">
  <div class="form-group">
  	<label for="firstName">First Name</label>
    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" required="required">
  </div>
  
  <div class="form-group">
    <label for="lastName">Last Name</label>
    <input  class="form-control" type="text" id="lastName" name="lastName" placeholder="Last Name" required="required">
  
  </div>
  
   <div class="form-group">
  
  	 <label for="mobileNumber">Mobile Number</label>
    <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" placeholder="Mobile Number" required="required">
  
  </div>
  
   <div class="form-group">
    <label for="emailId">Email</label>
    <input type="text" class="form-control" id="emailId" name="emailId" placeholder="Email"required="required">
  
  </div>
  
   <div class="form-group">
   <label for="password">Password</label>
    <input type="password" class="form-control" id="pass" name="password" placeholder=" Password" required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" onchange="checkPassword()">
  
  </div>
  
     <div class="form-group">
  <label for="lname">Repeat Password</label>
    <input type="password" class="form-control" id="repeatPassword" name="repeatPassword" placeholder="Repeat New Password" required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" onkeyup="checkPassword()">  
  
  </div>
      
    <input type="submit" class="btn btn-primary btn-block" id="submit"value="Submit">
  </form>


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