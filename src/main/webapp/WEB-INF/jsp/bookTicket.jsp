<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Available Seats: ${flightDetail.getAvailableSeats() }
	<br> Price: ${flightDetail.getSingleTicketPrice() }
	<br> Departure Time: ${flightDetail.getDepartureTime() }
	<br> Arival TIME: ${flightDetail.getArrivalTime()}
	<br> Departure From:
	${flightDetail.getDepartureCity().getCityName() }
	<br> Arival At: ${flightDetail.getArivalCity().getCityName()}
	<br>
Detail Of Travllers: <br>
<form action="/payment" method="post">
	<c:if test="${numberAdult >= 1}">
	<br>
		<c:forEach var="i" begin="1" end="${numberAdult}">
		Adult ${i}: 	<input type="text" name="AdultF_${i}" placeholder="firstName"><input type="text" name="AdultL_${i}" placeholder="LastName">
			<br>
		</c:forEach>
	</c:if>


<c:if test="${numberChild >= 1}">

	<c:forEach var="i" begin="1" end="${numberChild}">
	Child ${i}:	<input type="text" name="ChildF_${i}" placeholder="firstName"><input type="text" name="ChildL_${i}" placeholder="LastName">
		<br>
	</c:forEach>
</c:if>
<c:if test="${numberChild >= 1}">
	<c:forEach var="i" begin="1" end="${numberInfant}">
	Infant ${i }:	<input type="text" name="InfantF_${i}" placeholder="firstName"><input type="text" name="InfanL_${i}" placeholder="LastName">
		<br>
	</c:forEach>
</c:if>
	Total Amount: ${totalPrice}
<input type="submit" value="MAKE PAYMENT">
</form>	
</body>
</html>