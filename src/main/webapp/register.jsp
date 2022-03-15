<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
body {
  background-image: url('Ramthulasi.jpg');
}
</style>
<form action="${pageContext.request.contextPath}/Register" method="post">
  <label for="fname"> ID:</label><br>
  <input type="text" name="id"><br>
  
  <label for="fname">Name:</label><br>
  <input type="text"  name="name"><br>
  
  <label for="fname">Email:</label><br>
  <input type="text"  name="email"><br>
  
  <label for="fname">Password:</label><br>
  <input type="text"  name="password"><br>
  
  <label for="fname">Salary:</label><br>
  <input type="text" name="salary"><br>
  
  <br>
  <input type="submit" value="Submit">
</form> 

</body>
</html>