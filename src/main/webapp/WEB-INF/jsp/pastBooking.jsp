<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Past Bookings</title>

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

.flightDetail{

background-color: #f7f7f7;
padding: 10px;
}
.eachRow{
box-shadow: 0px 1px 11px #c1bfbf;
    margin-bottom: 40px;
    border-radius: 3px;
    background-color: #f7f7f7;
    
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
<h1>Flight Bookings Details</h1>

<div class="container">


<c:forEach var="i" begin="0" end="${flight.size()-1}">


<div class="row  eachRow">
<div class="col-lg-1"></div>
<div class="col-lg-10 flightDetail">
<div class="row">
<div class="col-lg-2">
Travel Date 
</div>
<div class="col-lg-2">
Departure Time
</div>
<div class="col-lg-2">
Arival Time
</div>
<div class="col-lg-2">
Departure 
</div>
<div class="col-lg-2">
Arival 
</div>
<div class="col-lg-2">
Cancel Booking
</div>
</div>
<hr>
<div class="row">
<div class="col-lg-2">
${bookDetail.get(i).getBookingDate()}
</div>
<div class="col-lg-2">
 ${flight.get(i).getDepartureTime() }
</div>
<div class="col-lg-2">
 ${flight.get(i).getArrivalTime()}
</div>
<div class="col-lg-2">
${flight.get(i).getDepartureCity().getCityName() }
</div>
<div class="col-lg-2">
 ${flight.get(i).getArivalCity().getCityName()}
</div>
<div class="col-lg-2">
<a class="btn btn-default" href="/cancelBooking/${bookDetail.get(i).getBookingId()}">cancel</a>
</div>
</div>
</div>
<div class="col-lg-1"></div>
</div>



</c:forEach>
</div>
</body>
</html>