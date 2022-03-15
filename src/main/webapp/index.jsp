<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.org.beans.Emp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Welcome to Login Page</h1>
<style>
body {
  background-image: url('Ramthulasi.jpg');
}
</style>
	<%
		Object message=session.getAttribute("message");
		if(message!=null){
			out.println("<font color='green' size='5' >"+message+"</font>");
		}
		Object error=session.getAttribute("error");
		if(error!=null){
			out.println("<font color='red' size='5' >"+error+"</font>");
		}
		session.invalidate();
	%>

	<form action="/EmployeeManagementAssignment/Login" method="post">
		<h3>
			Enter Email :<input name="email" placeholder="Enter User name">
		</h3>
		<h3>
			Enter Password :<input name="password" placeholder="Enter Password">
		</h3>
		<input type="submit" value="submmit ">
	</form>
	<br>
	<form action="${pageContext.request.contextPath}/register.jsp">
		<input type="submit"  value="Register" />
	</form>

</body>
</html>