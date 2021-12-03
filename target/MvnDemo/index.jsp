<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>LoginPage</title>
<style>
@import "bourbon";

body {
	background: #eee ;
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
	background-color: #fff;
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
            margin: 10px 0;
            border: none;
            cursor: pointer;
            width: 25%;
            height:40px;
        }
</style>
</head>
<body>
	<div class="form-signin" style="margin-top:200;">
	<form action="userlogin.jsp">
			<button id="btn" type="submit" >Login</button>
		</form>
		<form action="adminlogin.jsp" style="width:450px;">
			<button id="btn">AdminLogin</button>
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
	
</body>
</html>
