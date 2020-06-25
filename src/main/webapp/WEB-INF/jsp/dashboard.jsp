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




</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
<h1>Flight Details</h1>
</div>

<div class="container">
<table class="table">
	<th>Departure City</th>
	<th>Arival City</th>
	<th>Departure Time</th>
	<th>Arival Time</th>
	<th>Available Seats</th>
	<th>TicketPrice</th>
	<th> Edit</th>
	<c:forEach var="listValue" items="${flightList}">
		<tr>
			<td>${listValue.getDepartureCity().getCityName()}</td>
			<td>${listValue.getArivalCity().getCityName()}</td>
			<td>${listValue.getDepartureTime()}</td>
			<td>${listValue.getArrivalTime()}</td>
			<td>${listValue.getAvailableSeats()}</td>
			<td>${listValue.getSingleTicketPrice()}</td>
			<td><a href="/updateFlightDetails/${listValue.getFlightId() }">edit</a></td>
		</tr>
	</c:forEach>
<a href="/addNewFlight">Add New Flight</a>
</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>