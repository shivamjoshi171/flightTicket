<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<h1>Flight Details</h1>
<h1>${noreg}</h1>

<table>
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
</body>
</html>