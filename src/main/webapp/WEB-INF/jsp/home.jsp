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
<h1>Search Flight</h1>
<form action="result" method="post">
<select id="departure" name="departure">
<c:forEach var="listValue" items="${citylist}">
<option value="${listValue}">${listValue}</option>
</c:forEach>
</select> 
<select id="arival" name="arival">
<c:forEach var="listValue" items="${citylist}">
<option value="${listValue}">${listValue}</option>
</c:forEach>
</select> 
<input type="date" name="travelDate">
<input type="text" name="numberOfAdult">
<input type="text" name="numberOfChild">
<input type="text" name="numberOfInfant"><br>
<input type="radio" id="male" name="seatType" value="economy">
<label for="economy">Economy</label><br>
  <input type="radio" id="Premimum Economy" name="seatType" value="Premimum Economy">
  <label for="Premimum Economy">Premimum Economy</label><br>
  <input type="radio" id="Bussines" name="seatType" value="Bussines">
  <label for="Bussines">Bussines</label><br>
<input type="submit" value="search">
</form>
</body>
</html>