<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="listValue" items="${allFlights}">
<div>
Available Seats: ${listValue.getAvailableSeats() }<br>
Price: ${listValue.getSingleTicketPrice() }<br>
Departure Time: ${listValue.getDepartureTime() }<br>
Arival TIME: ${listValue.getArrivalTime()}<br>
<a href="/bookTicket/${listValue.getFlightId()}">book</a>

</div>
</c:forEach>
</body>
</html>