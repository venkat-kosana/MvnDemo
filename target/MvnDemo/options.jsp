<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="ISO-8859-1">
<title>HomePage</title>
<style>
input {
	background-color: #04AA6D;
	font-size: 20px;
	border-radius: 15px;
	border-width: 0px;
	width: 300px;
	margin-top: 20px;
	height: 50px;
	width: 300px;
}


</style>
</head>
<body>
	<jsp:useBean id="u" class="model.Economy"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />
	<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("index.jsp?error=session expired,please login again");
	}
	%>
	<%!String msg;%>
	<%
	msg = request.getParameter("msg");
	%>
	<%
	if (msg != null) {
		%>
		<script>
		<% String str="Welcome "+session.getAttribute("username"); %>
		   var s="<%=str%>"; 
		   swal(s); 
		</script>
	<%}
	%>
	<h1>
		Hello
		<%=session.getAttribute("username")%></h1>
	<div >
		<form action="homepage.jsp">
			<input type="submit" value="Add Entry">
		</form>
		<form action="expview.jsp">
			<input type="submit" value="View Expenditures">
		</form>
		<form action="incview.jsp">
			<input type="submit" value="View Incomes">
		</form>
		<form action="networth.jsp">
			<input type="submit" value="NetWorth">
		</form>

	</div>
	<br/><br/>
		<a href="index.jsp">Log Out</a>
	

</body>
</html>