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
<jsp:include page="header.jsp"></jsp:include>

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
<div class="col-lg-6">
 ${flightDetail.getSingleTicketPrice() }
</div>
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
		<input type="text" aria-label="First name"  name="AdultF_${i}" class="form-control" placeholder="First Name">
		</div>
			<div class="col-lg-5">
		<input type="text" aria-label="Last name" name="AdultL_${i}" class="form-control" placeholder="Last Name">
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
		<input type="text" aria-label="First name"  name="ChildF_${i}" class="form-control" placeholder="First Name">
		</div>
			<div class="col-lg-5">
		<input type="text" aria-label="Last name" name="ChildL_${i}" class="form-control" placeholder="Last Name">
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
		<input type="text" aria-label="First name"  name="InfantF_${i}" class="form-control" placeholder="First Name">
		</div>
			<div class="col-lg-5">
		<input type="text" aria-label="Last name" name="InfanL_${i}" class="form-control" placeholder="Last Name">
		</div>
		</div>

	</c:forEach>
</c:if>
	<h3>Total Amount: ${totalPrice}</h3>
<input type="submit" class="btn btn-primary btn-block" value="MAKE PAYMENT">
</form>	

</div>



</div>
	

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>