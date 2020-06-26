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


<header class="header" style="background-color: #ffffff;box-shadow: 1px 2px 10px grey;">

		<nav class="navbar navbar-style">
			<div class="container">
				<div class="navbar-header">
					<h2 class=" display-3">Flight Booking</h2>
				</div>
				<ul class="nav navbar-nav  navbar-right"	>
				<li><a href="/home"> Home</a></li>
				<c:if test="${sessionScope.userEmail.equals('no')}">
						<li>	<a  style="cursor: pointer" data-toggle="modal" data-target="#myModal">Login/Singup</a></li>
					</c:if>
				<c:if test="${!sessionScope.userEmail.equals('no')}">
						<li><p style="color: #4285c0;margin: 15px;"> Welcome , ${sessionScope.userName}</p></li>
						<li>	<a  href="/userProfile">Profile</a></li>
						<li>	<a  href="/logout">Logout</a></li>
					</c:if>
				</ul>

			</div>

		</nav>
		
	</header>
	
	<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Login</h4>
      </div>
      <div class="modal-body">
         <form action="login" method="post">
 		<div class="form-group">
 		<label for="emailId">Email</label>
   		 <input class="form-control"type="text" id="emailId" name="emailId" placeholder="Email" required="required">
 		</div>
     	<div class="form-group">
     	<label for="password">Password</label>
    	<input class="form-control" type="password" id="password" name="password" placeholder=" Password" required="required">
     	</div>
     	<div class="form-check form-check-inline">
  		<input class="form-check-input" type="radio" name="loginType" id="economy" value="User" required="required">
 		 <label class="form-check-label" for="economy">User</label>
		</div>
		<div class="form-check form-check-inline">
  		<input class="form-check-input" type="radio" name="loginType" id="Premimum Economy" value="Admin" required="required">
 		 <label class="form-check-label" for="Premimum Economy">Admin</label>
		</div>
     	
   		 <input type="submit" class="btn btn-primary btn-block" value="Submit">
  		</form>
  		<br>
  		<a class="btn btn-primary btn-block" href="/register">Register</a>
 
</div>

      </div>
     
    </div>

  </div>
  
 <!-- Headder end -->
	

	<div class="container">
	<div class=row>
		<div class="col-lg-6 formStyle">
			<form action="result" method="post">
			<div class="form-group">
					  <label for="departure">Departure City</label>
					<select class="form-control"id="departure" name="departure" id="departure" onchange="desCheck()">
					<option selected="selected">DEL</option>

					<c:forEach var="listValue" items="${citylist}">
						<option value="${listValue}">${listValue}</option>
					</c:forEach>
					</select>	
			</div>
				<div class="form-group">
				<label for="arival">Arival City</label>
				 <select class="form-control" id="arival" name="arival" id="arival" onchange="desCheck()">
					<option selected="selected">CHD</option>
					<c:forEach var="listValue" items="${citylist}">
						<option value="${listValue}">${listValue}</option>
					</c:forEach>
				</select> 
				</div>
	<div class="form-group">
	<label for="travelDate">Travel Date</label>
	<input class="form-control" id="travelDate" type="date" name="travelDate" required="required">
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
  <input class="form-check-input" type="radio" name="seatType" id="economy" value="economy" required="required">
  <label class="form-check-label" for="economy">Economy</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="seatType" id="Premimum Economy" value="PremimumEconomy" required="required">
  <label class="form-check-label" for="Premimum Economy">Premimum Economy</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="seatType" id="Bussines" value="Bussines" required="required">
  <label class="form-check-label" for="Bussines">Bussines</label>
</div>
  <button type="submit" id="submit"class="btn btn-primary btn-block">Search</button>
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
	
<script type="text/javascript">
function desCheck(){
	var a=document.getElementById("departure").value;
	var b=document.getElementById("arival").value;
	if(a==b){
		document.getElementById("arival").style.border="1px solid red";
		document.getElementById("submit").disabled=true;
		}else{
			document.getElementById("arival").style.border="none";
			document.getElementById("submit").disabled=false;
			}
	
}
</script>
<c:if test="${error ==1}">
<script type="text/javascript">
		window.alert("User/Password May be in correct");
</script>
</c:if>
</body>
</html>