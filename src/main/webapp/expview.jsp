<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html style="height:100%">
<head>
<meta charset="ISO-8859-1">
<title>IncomeList Page</title>
<style>
h1 {
	font-size: 25px;
}
body {
	
	background-image:url('https://cdn.wallpapersafari.com/82/91/NYsQzc.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	overflow: hidden;
}
table {
	width: 100%;
	border-spacing: 0;
	border-radius: 1em;
	overflow: hidden;
	justify-content: center;
	align-items: center;
	justify-content: center;
}

thead {
	visibility: hidden;
	position: absolute;
	width: 0;
	height: 0;
}

th {
	background: #215A8E;
	color: #fff;
}

td:nth-child(1) {
	background: #215A8E;
	color: #fff;
	border-radius: 1em 1em 0 0;
}

th, td {
	padding: 1em;
}

tr, td {
	display: block;
}

td {
	position: relative;
}

td::before {
	content: attr(data-label);
	position: absolute;
	left: 0;
	padding-left: 1em;
	font-weight: 600;
	font-size: .9em;
	text-transform: uppercase;
}

tr {
	margin-bottom: 1.5em;
	border: 1px solid #ddd;
	border-radius: 1em;
	text-align: right;
}

tr:last-of-type {
	margin-bottom: 0;
}

td:nth-child(n+2):nth-child(odd) {
	background-color: #ddd;
}

@media only screen and (min-width: 768px) {
	table {
		max-width: 1200px;
		margin: 0 auto;
		border: 1px solid #ddd;
	}
	thead {
		visibility: visible;
		position: relative;
	}
	th {
		text-align: left;
		text-transform: uppercase;
		font-size: .9em;
	}
	tr {
		display: table-row;
		border: none;
		border-radius: 0;
		text-align: left;
	}
	tr:nth-child(even) {
		background-color: #ddd;
	}
	td {
		display: table-cell;
	}
	td::before {
		content: none;
	}
	td:nth-child(1) {
		background: transparent;
		color: #444;
		border-radius: 0;
	}
	td:nth-child(n+2):nth-child(odd) {
		background-color: transparent;
	}
}

a {
	margin-left: 90%;
	margin-top: -45px;
	position: absolute;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("index.jsp?error=session expired,please login again");
	}
	%>
	<div class="h1">
		<h1>
			Hello
			<%=session.getAttribute("username")%>, your Expenditure list is :
		</h1>
		<a href="options.jsp">HomePage</a>
	</div>

	<%@page import="valueobject.EconomyVo,model.Economy,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<jsp:useBean id="u" class="model.Economy"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />

	<%!int totalsum = 0;%>

	<%
	int upiid = (Integer) session.getAttribute("username");
	List<Economy> list = EconomyVo.getAllRecords("Expenditure",upiid);
	request.setAttribute("list", list);
	%>
	<div class="tablediv">

		<table border="1" width=50%>
			<thead>
				<th>Type</th>
				<th>Amount</th>
				<th>Date</th>
			</thead>
			<%
			for (int i = 0; i < list.size(); i++) {
			%>
			<tr style="background-color:white;">
			<%
			if (list.get(i).getAmt() > 3000) {
			%>
			<td style="background-color: #F08080;" data-label="Type"><%=(list.get(i)).getType()%></td>
			<td style="background-color: #F08080;" data-label="Amount"><%=(list.get(i)).getAmt()%></td>
			<td style="background-color: #F08080;" data-label="Date"><%=(list.get(i)).getDateString()%></td>
			<%
			} else {
			%>
			<td data-label="Type"><%=(list.get(i)).getType()%></td>
			<td data-label="Amount"><%=(list.get(i)).getAmt()%></td>
			<td data-label="Date"><%=(list.get(i)).getDateString()%></td>
			<%
			}
			totalsum = totalsum + (list.get(i)).getAmt();
			%>
			</tr>
			<%
			}
			u.setTotalexp(totalsum);
			%>

		</table>
	</div>
	<br />
	<%
	session.setAttribute("totalinc", totalsum);
	%>
	<%
	int i = EconomyVo.saveinc(totalsum, "expenditure",upiid);
	%>
	<div>
		<h1 id="total">
			Total Expenditure is:<%=totalsum%>
		</h1>
	</div>
	<%
	totalsum = 0;
	%>




</body>
</html>