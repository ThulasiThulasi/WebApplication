<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.org.beans.Emp"%>
    <%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>

</head>
<body>
<style>
body {
  background-image: url('Ramthulasi.jpg');
}
</style>
<%
		Object objEmp = session.getAttribute("emp");
		Emp emp = null;
		if (objEmp != null) {
			emp = (Emp) objEmp;
			session.setAttribute("emp", emp);
		}
		//System.out.println("session in home : " + emp);

		if (emp == null) {
			session.setAttribute("error", "Please login Before Continue");
			request.getRequestDispatcher("index.jsp").forward(request, response);

		}

		Object list = request.getSession().getAttribute("empList");
		List<Emp> listEmp = (List<Emp>) list;

		Object message = session.getAttribute("message");
		if (message != null) {
			out.println("<font color='green' size='5' >" + message + "</font>");
			session.removeAttribute("message");
		}
		Object error = session.getAttribute("error");
		if (error != null) {
			out.println("<font color='red' size='5' >" + error + "</font>");
			session.removeAttribute("error");
		}
	%>
	<H2>
		Welcome to Home
		<%=emp.getEmail()%>
		<a href="${pageContext.request.contextPath}/updated_current_user.jsp">Profile</a>
	</H2>
	
	<a href="${pageContext.request.contextPath}/LogOut">Log out</a>
	<c:set var="currentUser" value="<%=emp%>"></c:set>
	<c:set var="listEmp" value="<%=listEmp%>"></c:set>

	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>View Details</th>
			<c:if test="${currentUser.getPermission().equals('admin') }">
				<th>Update</th>
				<th>Delete</th>
			</c:if>


		</tr>
		<c:set var="count" value="0" scope="page" />
		<c:forEach items="${listEmp }" var="emp">

			<tr>
				<td><c:out value="${emp.getId()}" /></td>
				<td><c:out value="${emp.getName()}" /></td>
				<td><c:out value="${emp.getEmail()}" /></td>
				<td><a
					href="${pageContext.request.contextPath}/update.jsp?edit=false&&index=${count}&&currentUser=false"><button>View
							Deatils</button></a></td>

				<c:if test="${currentUser.getPermission().equals('admin') }">

					<td><a
						href="${pageContext.request.contextPath}/update.jsp?edit=true&&index=${count}&&currentUser=false"><button>Edit Details</button></a></td>
					<td><a
						href="${pageContext.request.contextPath}/Delete?id=${emp.getId()}"><button>Delete
								</button></a></td>
				</c:if>




			</tr>
			<c:set var="count" value="${count + 1}" scope="page" />
		</c:forEach>

	</table>

</body>
</html>