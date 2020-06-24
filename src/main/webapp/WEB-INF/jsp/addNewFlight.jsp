<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<style>
input[type=text], select,[type=password] ,[type=number]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit]{
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
a{
  width: 97%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    display: block;
    border-radius: 4px;
    cursor: pointer;
    text-decoration: none;
    text-align: center;
    font-size:0.8em;
}

</style>
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