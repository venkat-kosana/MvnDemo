<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="height:100%">
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="ISO-8859-1">
<title>EntryPage</title>
<style>
form {
	font-size: 25px;
	font-style-italic;
}

input[type=number] {
	height: 30px;
	width: 150px;
	margin-left: 30px;
}

input[type=submit] {
	height: 20px;
	width: 80px;
	text-align: center;
}

select {
	height: 30px;
	width: 150px;
}
body {
	
	background-image:url('https://cdn.wallpapersafari.com/82/91/NYsQzc.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	overflow: hidden;
}
#btn
        {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 10px 0;
            border: none;
            cursor: pointer;
            width: 7%;
            height:40px;
        }
</style>
</head>
<body>
<%!String msg;%>
	<%
	msg = request.getParameter("error");
	%>
	<%
	if (msg != null) {
		%>
		<script>
		<% String str= msg; %>
		   var s="<%=str%>"; 
		   swal(s); 
		</script>
	<%}
	%>
	<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("index.jsp?error=session expired,please login again");
	}
	%>
	<h1>
		Welcome to your account
		<%=session.getAttribute("username")%></h1>

	<div class="options">
		<form action="save.jsp">
			Transaction Type: <select name="type">
				<option>Expenditure</option>
				<option>Income</option>
			</select><br /> <br /> Enter Amount: <input type="number" name="amt"
				id="amt"><br /> <input type="submit" onclick="validate(event)" id="btn">
		</form>
	</div>
	<br />
	<br />
	<a href="options.jsp">HomePage</a>

	<script>
		function validate(event) {
			var amt = document.getElementById("amt").value;
			if (amt < 0) {
				alert("Enter amount > 0 ");
				event.preventDefault();
			}
			
		}
		
	</script>
</body>
</html>