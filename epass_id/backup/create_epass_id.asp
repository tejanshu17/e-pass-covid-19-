<%@language="vbscript"%>
<% option explicit %>
<html>
<meta charset="utf-8">
<head>
<title>E-Pass</title>
<link rel = "stylesheet" href = "style_e-pass.css">
</head>
<body>
<div class ="sign-in">
<img src="coronavirus.png">
<h1>E-Pass</h1>
<hr>
<font color="#FF6347">
<%
	dim con, rs, uname, upwd
	dim lastid, newid, applicant_name,applicant_name1,applicant_name2, applicant_adhaar_no, startdiffe, enddiffe
	dim applicant_start_date, applicant_end_date, applicant_reason,aadhaar_last
	dim applicant_start_date_day, applicant_start_date_month, applicant_start_date_year
	dim applicant_start_time_hour, applicant_start_time_minute, applicant_start_time_second
	dim applicant_end_date_day,	applicant_end_date_month, applicant_end_date_year
	dim applicant_end_time_hour, applicant_end_time_minute, applicant_end_time_second
	dim number_of_epass

	applicant_name1 = Request.Form("applicant_name1")
	applicant_name2 = Request.Form("applicant_name2")
	applicant_name = applicant_name1&applicant_name2
	applicant_adhaar_no = Request.Form("applicant_adhaar_no")
	applicant_start_date_day = Request.Form("applicant_start_date_day")
	applicant_start_date_month = Request.Form("applicant_start_date_month")
	applicant_start_date_year = Request.Form("applicant_start_date_year")
	applicant_start_time_hour = Request.Form("applicant_start_time_hour")
	applicant_start_time_minute = Request.Form("applicant_start_time_minute")
	applicant_start_time_second = Request.Form("applicant_start_time_second")
	applicant_end_date_day = Request.Form("applicant_end_date_day")
	applicant_end_date_month = Request.Form("applicant_end_date_month")
	applicant_end_date_year = Request.Form("applicant_end_date_year")
	applicant_end_time_hour = Request.Form("applicant_end_time_hour")
	applicant_end_time_minute = Request.Form("applicant_end_time_minute")
	applicant_end_time_second = Request.Form("applicant_end_time_second")
	applicant_reason = Request.Form("applicant_reason")

	set con = Server.CreateObject("ADODB.Connection")
	con.Provider = "Microsoft.Jet.OLEDB.4.0"
	con.Open "D:\epass_ids.mdb"
	set rs  = Server.CreateObject("ADODB.RecordSet")
	rs.Open "e_pass_id",con,0,3,2
	If rs.EOF Then
		Response.Write("<h2>Database Empty<br></h2>")
		lastid = 0
	Else
		rs.MoveLast
		lastid = rs("ID")
	end if
	
	
    newid = lastid+1
	applicant_start_date = applicant_start_date_day&"-"&applicant_start_date_month&"-"&applicant_start_date_year
	applicant_start_date = applicant_start_date&"  "&applicant_start_time_hour&":"&applicant_start_time_minute&":"&applicant_start_time_second
	applicant_end_date = applicant_end_date_day&"-"&applicant_end_date_month&"-"&applicant_end_date_year
	applicant_end_date = applicant_end_date&"  "&applicant_end_time_hour&":"&applicant_end_time_minute&":"&applicant_end_time_second
	startdiffe = DateDiff("s", applicant_start_date, Now)
	enddiffe = DateDiff("s", applicant_end_date, Now)
	rs.AddNew
	rs("ID")= newid
	rs("Start_Date")=applicant_start_date
	rs("End_Date")=applicant_end_date
	rs("Status")="pass2"

	If startdiffe >= 0 Then
		
		If  enddiffe <0 Then
			rs("Status")="Active"
			Response.Write("<h2>Your Request has been accepted</h2>")
			Response.Write("<br><br><h2>Your E-Pass has been Activated ! Travel Safe.</h2>")
		ElseIf enddiffe >=0 Then
			rs("Status")="Expired"
			Response.Write("<br><br><h2>Your E-Pass has been Expired. This E-Pass can no longer be used any further.</h2>")
			
		Else
			Response.Write("<br><br><h2>An Input Error occured ! Please input valid values.</h2>")
		End If

	ElseIf startdiffe < 0 Then
		rs("Status")="Scheduled to be Active"
		Response.Write("<h2>Your Request has been accepted</h2>")
		Response.Write("<br><br><h2>Your E-Pass has been scheduled to turn Active at "&applicant_start_date&". Remember to keep the mask ON !</h2>")

	Else
		Response.Write("<br><br><h2>An Input Error occured ! Please input valid values.</h2>")
		
	End If

	rs("applicant_name")= applicant_name
	rs("applicant_adhaar_no")= applicant_adhaar_no 
	rs.Update
	rs.MoveNext
	Response.Write("<br><br><h2>Your New E-Pass:</h2>")
	Response.Write("<br><h2>E-Pass ID: "&newid&".</h2>")
	aadhaar_last = Right(applicant_adhaar_no,4)
	Response.Write("<br><h2>Aadhaar No. : ************"&aadhaar_last&"</h2>")
	Response.Write("<br><h2>E-Pass Validity: Your E-Pass will be active from "&applicant_start_date&" till "&applicant_end_date&".</h1>")
	Response.Write("<br><h2>Hope your "&applicant_reason&" related work goes well.<br>Have a good day.</h2>")
	Response.Write("<br><h2><br>Request Submitted On: "&Now&".</h2>")

	Application.lock
	number_of_epass = Application("no_of_epass")
	Application.unlock

	if number_of_epass = "" then
		Application("no_of_epass") = 1
		number_of_epass = Application("no_of_epass")
		response.write("<br><h2>Congratulations on Your First E-Pass from this Device !</h2>")
	else
		Application("no_of_epass") = number_of_epass + 1
		number_of_epass = Application("no_of_epass")
		response.write("<br><h2>Great ! "&number_of_epass&" E-Passes have already been made from this device !</h2><br><hr>")
	end if
	
	con.close
	set con = Nothing
%>
</font>
</div>
</body>
</html>
