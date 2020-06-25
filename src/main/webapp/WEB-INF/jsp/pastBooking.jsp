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
<jsp:include page="header.jsp"></jsp:include>
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
<div class="col-lg-3">
Departure 
</div>
<div class="col-lg-3">
Arival 
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
<div class="col-lg-3">
${flight.get(i).getDepartureCity().getCityName() }
</div>
<div class="col-lg-3">
 ${flight.get(i).getArivalCity().getCityName()}
</div>
</div>
</div>
<div class="col-lg-3"></div>
</div>



</c:forEach>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>