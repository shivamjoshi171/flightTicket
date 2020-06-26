<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Ticket</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.rowStyle{
    border-bottom: 1px solid #dedbdb;
    margin: 10px;
    border-bottom-left-radius: 20px;
    padding: 8px;
}
.tRow{
padding: 5px;
    margin:5px;
}
body{
background-color: #dcdcdc45;
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

<div class="container">
<div class="col-lg-6 jumbotron jumbotron-fluid">
<div class="row">
<h2>Flight Details</h2>
</div>
<div class="row rowStyle">
<div class="col-lg-6">
Available Seat
</div>
<div class="col-lg-6">
${flightDetail.getAvailableSeats() }
</div>
</div>
<div class="row rowStyle">
<div class="col-lg-6">
Price
</div>
<c:if test="${sessionScope.seatType.equals('economy')}">
<div class="col-lg-6">
${flightDetail.getSingleTicketPrice() }
</div>
</c:if>
<c:if test="${sessionScope.seatType.equals('PremimumEconomy')}">
<div class="col-lg-6">
${flightDetail.getSingleTicketPrice() *1.10}
</div>
</c:if>
<c:if test="${sessionScope.seatType.equals('Bussines')}">
<div class="col-lg-6">
${flightDetail.getSingleTicketPrice() *1.25}
</div>
</c:if>
</div>
<div class="row rowStyle">
<div class="col-lg-6">
Departure Time
</div>
<div class="col-lg-6">
 ${flightDetail.getDepartureTime() }
</div>
</div>
<div class="row rowStyle">
<div class="col-lg-6">
Arival Time
</div>
<div class="col-lg-6">
 ${flightDetail.getArrivalTime()}
</div>
</div>
<div class="row rowStyle">
<div class="col-lg-6">
Departure 
</div>
<div class="col-lg-6">
${flightDetail.getDepartureCity().getCityName() }
</div>
</div>
<div class="row rowStyle">
<div class="col-lg-6">
Arival 
</div>
<div class="col-lg-6">
${flightDetail.getArivalCity().getCityName()}
</div>
</div>
</div>


<div class="col-lg-6">

<h2>Traveller Information</h2> <br>
<form action="/payment" method="post">
	<c:if test="${numberAdult >= 1}">
	
		<c:forEach var="i" begin="1" end="${numberAdult}">
		<div class="row tRow">
		<div class="col-lg-2">
		<span class="input-group-text">Adult ${i}: </span>
		</div>
			<div class="col-lg-5">
		<input type="text" aria-label="First name"  name="AdultF_${i}" class="form-control" placeholder="First Name" required="required">
		</div>
			<div class="col-lg-5">
		<input type="text" aria-label="Last name" name="AdultL_${i}" class="form-control" placeholder="Last Name" required="required">
		</div>
		</div>
		
		</c:forEach>
	</c:if>


<c:if test="${numberChild >= 1}">

	<c:forEach var="i" begin="1" end="${numberChild}">
		<div class="row tRow">
		<div class="col-lg-2">
		<span class="input-group-text">Child ${i}: </span>
		</div>
			<div class="col-lg-5">
		<input type="text" aria-label="First name"  name="ChildF_${i}" class="form-control" placeholder="First Name"required="required" >
		</div>
			<div class="col-lg-5">
		<input type="text" aria-label="Last name" name="ChildL_${i}" class="form-control" placeholder="Last Name" required="required">
		</div>
		</div>
	</c:forEach>
</c:if>
<c:if test="${numberChild >= 1}">
	<c:forEach var="i" begin="1" end="${numberInfant}">
	
	
		<div class="row tRow" >
		<div class="col-lg-2">
		<span class="input-group-text">Infant ${i}: </span>
		</div>
			<div class="col-lg-5">
		<input type="text" aria-label="First name"  name="InfantF_${i}" class="form-control" placeholder="First Name" required="required">
		</div>
			<div class="col-lg-5">
		<input type="text" aria-label="Last name" name="InfanL_${i}" class="form-control" placeholder="Last Name" required="required">
		</div>
		</div>

	</c:forEach>
</c:if>
	<h3>Total Amount: ${totalPrice}</h3>
<input type="submit" class="btn btn-primary btn-block" value="MAKE PAYMENT">
<a href="/home"class="btn btn-primary btn-block"  >Cancel</a>
</form>	

</div>



</div>
	

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>