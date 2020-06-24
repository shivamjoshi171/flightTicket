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

<h3>Student Login</h3>
<h3 style="color:red">${err}</h3>
<div>
  <form action="pay" method="post">
 	
     <label for="cardNumber">Card Number</label>
    <input type="text" id="cardNumber" name="cardNumber" placeholder="Card Number">
   	
     <label for="cardHolderName">Card Holder Name</label>
    <input type="text" id="cardHolderName" name="cardHolderName" placeholder=" Name">
  
    <input type="submit" value="PAY">
  </form>

</div>

</body>
</html>