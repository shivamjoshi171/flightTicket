<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Flight Details</title>
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
<h3>Update Details</h3>
</div>



<div class="container">

<div class="col-lg-1"></div>

<div class="col-lg-10 jumbotron jumbotron-fluid">
<form action="/updateFlight" method="post">
<input type="hidden" id="availableSeats" name="availableSeats" value="${flightDetail.getAvailableSeats()}">
<input type="hidden" id="flight" name="flightId" value="${flightDetail.getFlightId()}">
    
<div class="form-group">
<label for="departureCity">Departure City</label>
    <input type="text" class="form-control" id="departureCity" name="depCity" value="${flightDetail.getDepartureCity().getCityCode()}" required="required">
   

</div>
<div class="form-group">

     <label for="arrivalCity">Arrival City</label>
    <input type="text" class="form-control" id="arrivalCity" name="arrCity" value="${flightDetail.getArivalCity().getCityCode()}" required="required">
    

</div>
<div class="form-group">

     <label for="departureTime">Departure Time</label>
    <input type="text" class="form-control" id="departureTime" name="departureTime" value="${flightDetail.getDepartureTime()}" required="required">
   

</div>
<div class="form-group">
<label for="arrivalTime">Arrival Time</label>
    <input type="text" class="form-control" id="arrivalTime" name="arrivalTime" value="${flightDetail.getArrivalTime() }"required="required" >
    

</div>
<div class="form-group">
 <label for="singleTicketPrice">Ticket Price</label>
    <input type="text" class="form-control" id="singleTicketPrice" name=singleTicketPrice value="${flightDetail.getSingleTicketPrice()}" required="required">
  

</div>
  	 <input type="submit" class="btn btn-primary btn-block" value="Submit">
  </form>
</div>
<div class="col-lg-1"></div>
</div>


  

</body>
</html>