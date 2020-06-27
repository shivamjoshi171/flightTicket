<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dashboard</title>

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

.tableEd{
	padding: 25px;
    border-right: 1px Solid #b1a4a4;
    border-radius: 24px;
    box-shadow: 2px 10px 11px grey;
    margin: 20px;
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
				<ul class="nav navbar-nav  navbar-right">
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


<div class="container">
<div class="row">
<div class="col-lg-1"></div>
<div class="col-lg-10 tableEd">
<div class="row">
<div class="col-lg-9">
<h3>Flight Details</h3>
</div>
</div>
<table class="table">
	<th>Departure City</th>
	<th>Arival City</th>
	<th>Departure Time</th>
	<th>Arival Time</th>
	<th>Available Seats</th>
	<th>TicketPrice</th>
	<th>Remove</th>
	<c:forEach var="listValue" items="${flightList}">
		<tr>
			<td>${listValue.getDepartureCity().getCityName()}</td>
			<td>${listValue.getArivalCity().getCityName()}</td>
			<td>${listValue.getDepartureTime()}</td>
			<td>${listValue.getArrivalTime()}</td>
			<td>${listValue.getAvailableSeats()}</td>
			<td>${listValue.getSingleTicketPrice()}</td>
			<td><a class="glyphicon glyphicon-remove" href="/removeFromAirline/${listValue.getFlightId() }"></a></td>
		</tr>
	</c:forEach>
</table>

</div>

<div class="col-lg-1 "></div>


</div>



</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>