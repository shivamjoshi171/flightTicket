<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
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
 
  <c:if test="${notfound ==1}">
  	<div class="container jumbotron">
  		<h1>No Flights Found on this route</h1>
  		<p>Please Search again</p><br>
  		<a href="/home" class="btn btn-primary"> search </a>
  	</div>
  
  </c:if>
  
  
  <c:if test="${notfound ==0}">

<div class="container">


<c:forEach var="listValue" items="${allFlights}">


<div class="row  eachRow">
<div class="col-lg-11 flightDetail">
<div class="row">
<div class="col-lg-2">
Airline
</div>
<div class="col-lg-2">
Departure Time
</div>
<div class="col-lg-2">
Arival Time
</div>
<div class="col-lg-2">
Available Seats
</div>
<div class="col-lg-2">
Seat Type
</div>
<div class="col-lg-2">
Price
</div>
</div>

<div class="row">
<div class="col-lg-2">
 ${listValue.getAirlineId().getAirlineName() }
</div>
<div class="col-lg-2">
 ${listValue.getDepartureTime() }
</div>
<div class="col-lg-2">
 ${listValue.getArrivalTime()}
</div>
<div class="col-lg-2">
${listValue.getAvailableSeats() }
</div>
<div class="col-lg-2">
${sessionScope.seatType}
</div>

<c:if test="${sessionScope.seatType.equals('economy')}">
<div class="col-lg-2">
${listValue.getSingleTicketPrice() }
</div>
</c:if>
<c:if test="${sessionScope.seatType.equals('PremimumEconomy')}">
<div class="col-lg-2">
${listValue.getSingleTicketPrice() *1.10}
</div>
</c:if>
<c:if test="${sessionScope.seatType.equals('Bussines')}">
<div class="col-lg-2">
${listValue.getSingleTicketPrice() *1.25}
</div>
</c:if>


</div>
</div>

<div class="col-lg-1 flightDetail">
<a href="/bookTicket/${listValue.getFlightId()}" class="btn btn-primary" style="float: right">book</a>
</div>
</div>



</c:forEach>
</div>
</c:if>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>