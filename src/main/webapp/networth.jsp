<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="height:100%">
<head>
<meta charset="ISO-8859-1">
<title>NetWorthPage</title>
<style>


h2 {
	font-style: italic;
	text-align: center;
}

p {
	font-size: 25px;
	font-style: italic;
	font-weight: thick;
}
body {
	
	background-image:url('https://cdn.wallpapersafari.com/82/91/NYsQzc.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	overflow: hidden;
	
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("index.jsp?error=session expired,please login again");
	}
	%>
	<%@page import="valueobject.EconomyVo"%>
	<%@ page import="java.io.PrintWriter"%>
	<jsp:useBean id="u" class="model.Economy"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />
	<%
	int upiid = (Integer) session.getAttribute("username");
	int[] b = EconomyVo.getValues(upiid);
	%>
	<h2>Check your Expenditure and Income first to get updated net
		worth :)</h2>
	<h1>
		Net Worth is:</h1>
		<%int net = b[0] - b[1];%><h1><%= net %></h1>
		<%EconomyVo.netSave(upiid, net); %>
	<br />
	<br />

	<a href="options.jsp">HomePage</a>
</body>
</html>