<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="height:100%">
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="ISO-8859-1">
<title>SignUp Page</title>
<style>
body {
	
	background-image:url('https://www.wallpaperkiss.com/wimg/b/134-1348395_big.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	overflow: hidden;
}

.wrapper {	
	margin-top: 80px;
  margin-bottom: 80px;
}

.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0,0,0,0.1);  
margin-top:200px;
  .form-signin-heading,
	.checkbox {
	  margin-bottom: 30px;
	}

	.form-control {
	  position: relative;
	  font-size: 16px;
	  height: auto;
	  padding: 10px;
		@include box-sizing(border-box);

		&:focus {
		  z-index: 2;
		}
	}

	input[type=text] {
	  margin-bottom: -1px;
	  border-bottom-left-radius: 0;
	  border-bottom-right-radius: 0;
	  height:30px;
	}

	input[type=password] {
	  margin-bottom: 20px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	   height:30px;
	}
}
input
{
height:30px;
}
h2
{
text-align:center;
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
<div class="form-signin">
    <form  action="signup.jsp">       
      <h2 class="form-signin-heading">Enter Details</h2>
      NAME:<br/> 
      <input type="text" class="form-control" name="name" placeholder="Enter your full name" required="" autofocus="" /><br/><br/>
      UPI ID:<br/>		
      <input type="text" class="form-control" id="upiid" name="upiid" placeholder="upiid" required="" autofocus=""/><br/><br/>
      PASSWORD:<br/>
      <input type="password" class="form-control" name="password" placeholder="Password" required=""/> <br/><br/>     
      <button class="btn btn-lg btn-primary btn-block" type="submit" id="btn" onmouseover="validate()">Register</button>    
    </form>
  </div>
  <script>
  function validate()
  {
    var z = document.getElementById("upiid").value;
    console.log(z);
    if(isNaN(z))
    {
        swal("Please only enter numeric characters for UPIID field");
    }
}
  </script>
</body>
</html>