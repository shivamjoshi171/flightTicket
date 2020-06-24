<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 Name: ${user.getFirstName() } ${user.getLastName()}<br>
 Mobile Number: ${user.getMobileNumber() }<br>
 Email : ${user.getEmailId() }<br>
 password: ******* <a href="changePassword">Change password</a><br>
<a href="/updateInfo">updateInformation</a><br>
<a href="#">view current booking</a>
</body>
</html>