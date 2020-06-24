<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

input[type=submit] {
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
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateData" method="post">
  
  	<label for="firstName">First Name</label>
    <input type="text" id="firstName" name="firstName" placeholder="First Name">
  
     <label for="lastName">Last Name</label>
    <input type="text" id="lastName" name="lastName" placeholder="Last Name">
  
  	 <label for="mobileNumber">Mobile Number</label>
    <input type="text" id="mobileNumber" name="mobileNumber" placeholder="Mobile Number">
  
     <label for="emailId">Email</label>
    <input type="text" id="emailId" name="emailId" placeholder="Email">
   
    <input type="submit" value="Submit">
  </form>
</body>
</html>