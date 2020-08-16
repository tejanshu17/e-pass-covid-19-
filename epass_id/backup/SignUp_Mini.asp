<%@ language = "Vbscript"%>
<%option explicit%>
<html>
<head>

<title> Sign up </title>
<link rel = "stylesheet" href = "style1.css">
</head>

<body>

<div class ="sign-up">
<img src="coronavirus.png">
<h1> Sign Up</h1>
<form name = "Sign_Up" action = "cookie_up.asp" method ="POST">
<input type="text" class = "name-box" placeholder="First Name" name = "firstname" value="<%

	'Response.Write("<br><br>Email from cookie:"&Request.Cookies("email"))
	'Response.Write("<br>Fistname from cookie:"&Request.Cookies("firstname"))
	'Response.Write("<br>Lastname from cookie:"&Request.Cookies("lastname"))

	if not Request.Cookies("firstname_signup")="" then
		Response.Write(Request.Cookies("firstname_signup"))
	end if

%>">
<input type="text" class = "name-box" placeholder="Last Name" name = "lastname" value="<%

	'Response.Write("<br><br>Email from cookie:"&Request.Cookies("email"))
	'Response.Write("<br>Fistname from cookie:"&Request.Cookies("firstname"))
	'Response.Write("<br>Lastname from cookie:"&Request.Cookies("lastname"))

	if not Request.Cookies("lastname_signup")="" then
		Response.Write(Request.Cookies("lastname_signup"))
	end if

%>">
<input type="text" class = "input-box" placeholder="Your Email" name = "email" value="<%

	'Response.Write("<br><br>Email from cookie:"&Request.Cookies("email"))
	'Response.Write("<br>Fistname from cookie:"&Request.Cookies("firstname"))
	'Response.Write("<br>Lastname from cookie:"&Request.Cookies("lastname"))

	if not Request.Cookies("email_signup")="" then
		Response.Write(Request.Cookies("email_signup"))
	end if

%>">
<input type="password" class = "input-box" placeholder="Your Password" name = "passw">
<p><span><input type="checkbox"></span>I agree to the terms and services</p>
<button type="submit" class="signup-btn">Sign Up</button>
<hr>
<p> Do you have an account? <a href="SignIn.html">Sign in</a></p>
</form>
</div>

</body>
</html>
