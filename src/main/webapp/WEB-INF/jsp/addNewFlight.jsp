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
</head>

<body>

<h3>Add Flight</h3>
<h3 style="color:red">${err}</h3>
<div>
  <form action="/updateFlight" method="post">
 	 
    <label for="departureCity">Departure City</label>
    <input type="text" id="departureCity" name="depCity" placeholder="Departure City">
   
     <label for="arrivalCity">Arrival City</label>
    <input type="text" id="arrivalCity" name="arrCity" placeholder="Arrival City">
    
     <label for="departureTime">Departure Time</label>
    <input type="text" id="departureTime" name="departureTime" placeholder="Departure Time">
   
     <label for="arrivalTime">Arrival Time</label>
    <input type="text" id="arrivalTime" name="arrivalTime" placeholder="Arrival Time">
    
    <label for="singleTicketPrice">Ticket Price</label>
    <input type="text" id="singleTicketPrice" name=singleTicketPrice placeholder="Price">
    
  	 <label for="totalSeats">Total Seats</label>
    <input type="text" id="totalSeats" name=availableSeats placeholder="Total Seats">
    <input type="submit" value="Submit">
  </form>
</div>

</body>
</html>