<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html style="height:100%">
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>AdminLoginPage</title>
<style>
@import "bourbon";

body {
	
	background-image:url('https://cutewallpaper.org/21/white-hd-background/High-Resolution-White-Background-Wallpaper-Hd-1080p-.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	overflow: hidden;
}

.wrapper {
	margin-top: 80px;
	margin-bottom: 80px;
}

.form-signin {
	margin-top: 150px;
	max-width: 380px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #e6e6e6;
	border: 1px solid rgba(0, 0, 0, 0.1);
	.
	form-signin-heading
	,
	.checkbox
	{
	margin-bottom
	:
	30px;
}

.form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	@
	include
	box-sizing(border-box);
	&:
	focus
	{
	z-index
	:
	2;
}
}
}
h2
{
	font-style:italic;
	margin-bottom:10px;
	font-weight:light;
}
h3
{
font-size:35px;
}
input
{
background: #eee ;
margin-top:0xp;
border-radius:10px;
}
button
{
height:25px;
width:80px;
border-radius:10px;
background-color:lightgreen;
}
 #btn
        {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 25%;
            height:40px;
        }
        .avatar{
    width: 100px;
    height: 100px;
    border-radius: 50%;
    top: 90px;
    left: calc(50% - 50px);
    position: absolute;
    }
    h3
{
font-size:35px;
text-align:center;
}
</style>
</head>
<body>
	<%session.setAttribute("usertype","admin"); %>
	<div class="form-signin" style="margin-top:150px;">
	<img src="https://www.clipartmax.com/png/middle/15-153139_big-image-login-icon-with-transparent-background.png" alt="user_icon" class="avatar">
		<form action="LoginServlet" style="margin-bottom:0px;">
			<h3 class="form-signin-heading">Enter Login Details</h3>
			<h2>ADMIN ID:</h2>
			 <input type="number" class="form-control" name="upiid"
				placeholder="upi id" required="" autofocus=""
				style="height: 40px; width: 250px;" /><br /> <br />
			<h2 style="margin-top:0px;">PASSWORD:</h2>
			 <input type="password" class="form-control" name="pass"
				placeholder="Password" required=""
				style="height: 40px; width: 250px;" /> <br /> <br />
			<button id="btn" type="submit" >Login</button>
		</form>
	</div>
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
	
</html>