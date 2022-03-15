<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.org.beans.Emp"%>
<%@page import="java.util.List"%>\


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Welcome to Update Profile Page</h2>
	<%
		Object objEmp = session.getAttribute("emp");
		Emp emp = null;
		if (objEmp != null) {
			emp = (Emp) objEmp;
		}
		if (emp == null) {
			session.setAttribute("error", "Please login Before Continue");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	%>
	<br>
	<form action="${pageContext.request.contextPath}/Update?current_user=true" method="post">
		<label for="fname"> ID:</label><br> <input type="number"
			name="id" value="<%=emp.getId()%>" disabled><br> <input
			type="number" name="id" value="<%=emp.getId()%>"
			style="display: none"><br> <label for="fname">Name:</label>
		<br> <input type="text" name="name"
			value="<%=emp.getName()%>"> <br> <label
			for="fname">Email:</label> <br> <input type="text" name="email"
			value="<%=emp.getEmail()%>"> <br> <label
			for="fname">Password:</label> <br> <input type="text"
			name="password" value="<%=emp.getPassword()%>"> <br>
		<label for="fname">Salary:</label> <br> <input type="text"
			name="salary" value="<%=emp.getSalary()%>"> <br>

		<input type="text" value="true" name="current_user" style="display: none"  />
		<br> <input type="submit" value="Update Details">

	</form>
</body>
</html>