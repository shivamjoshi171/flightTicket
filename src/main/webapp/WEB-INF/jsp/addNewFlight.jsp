<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Add New Flight</title>
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
<h3>Add Flight</h3>


<div class="container">
<div class="col-lg-1"></div>
<div class="col-lg-10 jumbotron jumbotron-fluid">

  <form action="/updateFlight" method="post">
  
  <div class="form-group">
  <label for="departureCity">Departure City</label>
    <input type="text" class="form-control" id="departureCity" name="depCity" placeholder="Departure City">
  </div>
  <div class="form-group">
   <label for="arrivalCity">Arrival City</label>
    <input type="text" class="form-control" id="arrivalCity" name="arrCity" placeholder="Arrival City">
  </div>
  <div class="form-group">
    <label for="departureTime">Departure Time</label>
    <input type="text" class="form-control" id="departureTime" name="departureTime" placeholder="Departure Time">
  </div>
  <div class="form-group">
   <label for="arrivalTime">Arrival Time</label>
    <input type="text" class="form-control" id="arrivalTime" name="arrivalTime" placeholder="Arrival Time">
  </div>
  <div class="form-group">
      <label for="singleTicketPrice">Ticket Price</label>
    <input type="text" class="form-control" id="singleTicketPrice" name=singleTicketPrice placeholder="Price">
  </div>
  <div class="form-group">
  <label for="totalSeats">Total Seats</label>
    <input type="text" class="form-control" id="totalSeats" name=availableSeats placeholder="Total Seats">
  </div>
  	 
    <input type="submit" class="btn btn-primary btn-block" value="Submit">
  </form>

</div>
<div class="col-lg-1"></div>
</div>



<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>