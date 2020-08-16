<%@language=Vbscript%>
<%option explicit%>

<html>
<meta charset="utf-8">
<head>

<title>Select Language</title>
<link rel = "stylesheet" href = "style2.css">
</head>
<body>

<div class ="sign-in">
<img src="coronavirus.png">
<h1> Select Your Language: </h1>
<form name = "form1" action = "store_language.asp" method = "post">

<label for="applicant_language">Language</label>
<select id="applicant_language" name="applicant_language">
  <option value="English">English</option>
  <option value="Hindi">हिंदी</option>
  <option value="Marathi">मराठी</option>
</select>
<%
	'Response.Write("<br><br>Email from cookie:"&Request.Cookies("email"))
	'Response.Write("<br>Fistname from cookie:"&Request.Cookies("firstname"))
	'Response.Write("<br>Lastname from cookie:"&Request.Cookies("lastname"))

	if not session("session_language")="" then
		Response.Write("<br><br><h1>Recently used Language: "&session("session_language")&"</h1>")
	end if
%>
<p><span></p>
<button type="submit" class="signin-btn">Check</button>
<hr>
</form>
</div>

</body>
</html>