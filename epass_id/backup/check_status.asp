<%@language="vbscript"%>
<% option explicit %>
<html>
<head>
<title>Check E-Pass</title>
<link rel = "stylesheet" href = "style_e-pass.css">
</head>
<body>
<div class ="sign-in">
<img src="coronavirus.png">
<%
	dim con, rs, flag, applicant_id, aadhaar_last, newid, start_date, end_date, startdiffe, enddiffe
	flag = 0

	applicant_id = Request.Form("applicant_id")

	set con = Server.CreateObject("ADODB.Connection")
	con.Provider = "Microsoft.Jet.OLEDB.4.0"
	con.Open "D:\epass_ids.mdb"
	set rs  = Server.CreateObject("ADODB.RecordSet")
	rs.Open "e_pass_id",con,0,3,2

	rs.MoveFirst
	
	do while not rs.EOF
	If rs("ID")=applicant_id then
		 flag = 1
		 start_date = rs("Start_Date")
		 end_date = rs("End_Date")

		 startdiffe = DateDiff("s", start_date, Now)
		 enddiffe = DateDiff("s", end_date, Now)

		If startdiffe >= 0 Then
		
			If  enddiffe <0 Then
				rs("Status")="Active"
				Response.Write("<h1>Your E-Pass is Currently Valid ! Travel Safe.</h1>")
			
			ElseIf enddiffe >=0 Then
				rs("Status")="Expired"
				Response.Write("<h1>Your E-Pass has been Expired. This E-Pass can no longer be used any further.</h1>")
			
			Else
				Response.Write("<h1>An Input Error occured ! Please input valid values.</h1>")
			End If

		ElseIf startdiffe < 0 Then
			 rs("Status")="Scheduled to be Active"
			 Response.Write("<h1>Your E-Pass has been scheduled to turn Active at "&start_date&". Remember to keep the mask ON !</h1>")

		Else
			 Response.Write("<h1>An Input Error occured ! Please input valid values.</h1>")
		
		End If		 

		 Response.Write("<br><hr><br><h1>E-Pass:</h1>")
		 Response.Write("<br><h1>E-Pass ID: "&rs("ID")&".</h1>")
		 Response.Write("<br><h1>Adhaar No.: ************"&Right(rs("applicant_adhaar_no"),4)&"</h1>")
		 Response.Write("<br><h1>E-Pass Status: "&rs("Status")&".</h1>")
		 Response.Write("<br><h1>E-Pass Valid till: "&rs("End_Date")&".</h1>")
		 Response.Write("<br><h1>Request Submitted on "&Now&"<br><hr>")
		 rs.Update
		rs.MoveNext
	else
	rs.MoveNext
	end if
	loop
	

	If flag = 0 then
		Response.Write("<h1>ID cannot recognized</h1>")
	End If

	con.close
	set con = Nothing
%>
</div>
</body>
</html>
