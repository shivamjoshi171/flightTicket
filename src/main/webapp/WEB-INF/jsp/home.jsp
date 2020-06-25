<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Home</title>
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
.container{
	margin: 10px;

}
.formStyle{
    background-color: #c7c7c7;
    box-shadow: 4px 7px 14px grey;
    padding: 20px;
}
.mb-4{
color:red;
}
img{
margin: 10px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
	<div class=row>
		<div class="col-lg-6 formStyle">
			<form action="result" method="post">
			<div class="form-group">
					  <label for="departure">Departure City</label>
					<select class="form-control"id="departure" name="departure">
					<c:forEach var="listValue" items="${citylist}">
						<option value="${listValue}">${listValue}</option>
					</c:forEach>
					</select>	
			</div>
				<div class="form-group">
				<label for="arival">Arival City</label>
				 <select class="form-control" id="arival" name="arival">
					<c:forEach var="listValue" items="${citylist}">
						<option value="${listValue}">${listValue}</option>
					</c:forEach>
				</select> 
				</div>
	<div class="form-group">
	<label for="travelDate">Travel Date</label>
	<input class="form-control" id="travelDate" type="date" name="travelDate">
	</div>	
		
	<div class="form-group">
	<label for="numberOfAdult">Number of Adult</label>
	<select class="form-control"name="numberOfAdult"> 
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	</select>
	</div>
	
	<div class="form-group">
	<label for="numberOfAdult">Number of Child</label>
	<select  class="form-control"name="numberOfChild"> 
	<option value="0">0</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	</select>
	</div>
	
	<div class="form-group">
	<label for="numberOfAdult">Number of Infant</label>
	<select  class="form-control"name="numberOfInfant"> 
	<option value="0">0</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	</select>
	</div>
	<hr class="mb-4">
	<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="seatType" id="economy" value="economy">
  <label class="form-check-label" for="economy">Economy</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="seatType" id="Premimum Economy" value="Premimum Economy">
  <label class="form-check-label" for="Premimum Economy">Premimum Economy</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="seatType" id="Bussines" value="Bussines" >
  <label class="form-check-label" for="Bussines">Bussines</label>
</div>
  <button type="submit" class="btn btn-primary btn-block">Search</button>
			</form>
		</div>
		
		
	<div class="col-lg-6">
	
		<div class="row">
		<div class="col-lg-12">
		<img class="img-responsive" src="/resources/img/1.jpg">
		</div>
		</div>
		<div class="row">
		<div class="col-lg-12">
		<img  class="img-responsive" src="/resources/img/2.jpg">
		</div>
		</div>
	</div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
	

</body>
</html>