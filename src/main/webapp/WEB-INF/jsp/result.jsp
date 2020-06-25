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
<jsp:include page="header.jsp"></jsp:include>

<div class="container">


<c:forEach var="listValue" items="${allFlights}">


<div class="row  eachRow">
<div class="col-lg-11 flightDetail">
<div class="row">
<div class="col-lg-3">
Departure Time
</div>
<div class="col-lg-3">
Arival Time
</div>
<div class="col-lg-3">
Available Seats
</div>
<div class="col-lg-3">
Price
</div>
</div>

<div class="row">
<div class="col-lg-3">
 ${listValue.getDepartureTime() }
</div>
<div class="col-lg-3">
 ${listValue.getArrivalTime()}
</div>
<div class="col-lg-3">
${listValue.getAvailableSeats() }
</div>
<div class="col-lg-3">
${listValue.getSingleTicketPrice() }
</div>
</div>
</div>

<div class="col-lg-1 flightDetail">
<a href="/bookTicket/${listValue.getFlightId()}" class="btn btn-primary" style="float: right">book</a>
</div>
</div>



</c:forEach>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>