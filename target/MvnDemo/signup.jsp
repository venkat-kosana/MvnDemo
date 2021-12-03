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
	int i = EconomyVo.userSave(u);
	if (i > 0) {
		response.sendRedirect("index.jsp?error=Successfully registered, Please login ");
	} else {
		out.println("User with upiid already exists");
		request.getRequestDispatcher("signupform.jsp").include(request, response);
	}
	%>
</body>
</html>