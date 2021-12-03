<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="valueobject.EconomyVo"%>
	<%@ page import="java.io.PrintWriter" %>
	<jsp:useBean id="u" class="model.Economy"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />
	<%
	PrintWriter outt = response.getWriter();
	int upiid = (Integer) session.getAttribute("username");
	int i = EconomyVo.save(u,upiid);
	if (i > 0) {
		response.sendRedirect("homepage.jsp?error=Record saved successfully");
	} else {	
		response.sendRedirect("homepage.jsp?error=Error saving Record");	}
	%>
</body>
</html>