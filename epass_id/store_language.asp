<%@language="vbscript"%>
<% option explicit %>

<%
	dim language
	language = Request.Form("applicant_language")
	Response.Write(language)
	session("session_language")=language
	
	If language = "English" then
		Response.Redirect("eng_guidelines.asp")

	Elseif language = "Hindi" then
		Response.Redirect("hindi_guidelines.asp")

	Elseif language = "Marathi" then
		Response.Redirect("marathi_guidelines.asp")

	Else
		Response.Write("Language Error")
	End if
%>
</div>
</body>
</html>
