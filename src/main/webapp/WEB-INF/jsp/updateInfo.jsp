<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Update</title>
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


</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
<div class="col-lg-1"></div>
<div class="col-lg-10  col-lg-10 jumbotron jumbotron-fluid">
	
	<form action="updateData" method="post">
  <div class="form-group">
  <label for="firstName">First Name</label>
    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name">
  </div>
   <div class="form-group">
     <label for="lastName">Last Name</label>
    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name">
  
  </div>
   <div class="form-group">
   <label for="mobileNumber">Mobile Number</label>
    <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" placeholder="Mobile Number">
  </div>
   <div class="form-group">
   <label for="emailId">Email</label>
    <input type="text" class="form-control" id="emailId" name="emailId" placeholder="Email">
  </div>
 
   
    <input type="submit" class="btn btn-primary btn-block" value="Submit">
  </form>

</div>
<div class="col-lg-1"></div>

</div>

 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>