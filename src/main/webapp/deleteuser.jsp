<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String id= request.getParameter("id");%>
<%String adminid = session.getAttribute("username").toString(); %>
<%@page import="valueobject.EconomyVo,model.Economy,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<jsp:useBean id="u" class="model.Economy"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />
<%
	int upiid = Integer.parseInt(id);
	int idadmin = Integer.parseInt(adminid);
	int status = EconomyVo.deleteUser(upiid,idadmin);
	
	if (status>=1) {
		response.sendRedirect("adminhomepage.jsp?error=User deleted successfully");
	} else {
		response.sendRedirect("adminhomepage.jsp?error=Error occured while deleting user");
	}
	%>
</body>
</html>