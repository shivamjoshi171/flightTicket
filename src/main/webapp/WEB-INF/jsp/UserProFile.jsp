<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
<jsp:include page="header.jsp"></jsp:include>
<body>
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
<a href="changePassword">Change password</a>
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
</body>
</html>