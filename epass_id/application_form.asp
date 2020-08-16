<%@Language = Vbscript%>
<%option explicit%>
	
<html>
<meta charset = "utf-8">

	<% dim email, con, rs, flag, fname,lname
	flag = 0

	email = Request.Cookies("email")

	set con = Server.CreateObject("ADODB.Connection")
	con.Provider = "Microsoft.Jet.OLEDB.4.0"
	con.Open "D:\add_data.mdb"
	set rs  = Server.CreateObject("ADODB.RecordSet")
	rs.Open "table_add",con,0,3,2

	rs.MoveFirst
	
	do while not rs.EOF or not flag=1 
	If rs("email")=email then
		 flag = 1
		 fname = rs("firstname")
		 lname = rs("lastname")
		 
		rs.MoveNext
	else
	rs.MoveNext
	end if
	loop
	


	con.close
	set con = Nothing

	%>		


<head>

<title>Application Form</title>
<link rel = "stylesheet" href = "style_epass_form.css">

</head>
<body>
<div class ="sign-in">
	<img src="coronavirus.png">

	<form name = "form1" action = "create_epass_id.asp" method = "post">
		<h1><b> <u> APPLICATION FOR LOCKDOWN PASS -- COVID-19 </u> </b></h1> <br> <br>
		<font color="#FF6347">First Name/नाम: <input type = "text" value = <% Response.Write(fname) %> name = "applicant_name"><br><br>
		Last Name/नाम: <input type = "text" value = <% Response.Write(lname) %> name = "applicant_name"><br><br>
	 	Adhaar card no/आधार कार्ड नंबर: <input type = "text" name = "applicant_adhaar_no"><br><br>
		Phone Number/फ़ोन नंबर: <input type = "number" name = "applicant_phone_number"><br><br>
		Email Id/ईमेल: <input type = "text" value = "<%Response.Write(Request.Cookies("email"))%> name = "applicant_email_id"><br><br>
		<label for="reason"> Select A Valid Reason/एक वैध कारण चुनें: </label>

		<select id="applicant_reason" name="applicant_reason">
			<option value="Labour Group/श्रमिक समूह">Labour Group/श्रमिक समूह</option>
			<option value="Stranded Student/फंसे हुए छात्र">Stranded Student/फंसे हुए छात्र</option>
			<option value="Stranded Individual/फंसे हुए व्यक्ति">Stranded Individual/फंसे हुए व्यक्ति</option>
			<option value="supermarket/सुपरमार्केट">supermarket/सुपरमार्केट</option>
			<option value="Bank/बैंक">Bank/बैंक</option>
			<option value="Cable TV/केबल टीवी">Cable TV/केबल टीवी</option>
			<option value="Goverment/सरकार">Goverment/सरकार</option>
  			<option value="Medical (Pharmacy Shop)/मेडिकल (फार्मेसी की दुकान)">Medical (Pharmacy Shop)/मेडिकल (फार्मेसी की दुकान)</option>
  			<option value="bazaar/बाजार">Bazaar/बाजार</option>
  			<option value="milk">Milk/दूध</option>
  			<option value="dr">Dr Visit/चिकित्सक</option>
			<option value="gas">LPG Gas Delivery/एलपीजी गैस वितरण</option>
			<option value="food">Food Pickup/फूड पिक</option>
			<option value="emergency">Emergency/आपातकालीन</option>
		</select> <br> <br>

		<b><u> Start Date & Time(24 Hour Format)/प्रारंभ तिथि और समय (24 घंटे का प्रारूप): </u> </b> <br> <br>
		
			<label for="applicant_start_date_month">Month/महीना:</label>
			<input type = "number" id = "applicant_start_date_month" name = "applicant_start_date_month" style="width: 50px;"> &nbsp;
			
			<label for="applicant_start_date_month">Day/दिन:</label>
			<input type = "number" id = "applicant_start_date_day" name = "applicant_start_date_day" style="width: 50px;"> &nbsp;
			
			<label for="applicant_start_date_year">Year/साल:</label>
			<input type = "number" id = "applicant_start_date_year" name = "applicant_start_date_year" style="width: 50px;"> &nbsp;


			<br><br><label for="applicant_start_time_hour">Hour/घंटा:</label>
			<input type = "number" id = "applicant_start_time_hour" name = "applicant_start_time_hour" style="width: 50px;"> &nbsp;
			
			<label for="applicant_start_time_minute">Minute/मिनट:</label>
			<input type = "number" id = "applicant_start_time_minute" name = "applicant_start_time_minute" style="width: 50px;"> &nbsp;
			
			<label for="applicant_start_time_second">Second/सेकंड:</label>
			<input type = "number" id = "applicant_start_time_second" name = "applicant_start_time_second" style="width: 50px;"> &nbsp;<br> <br>

		
		<b><u> End Date & Time(24 Hour Format):</u></b> <br> <br>
		
			<label for="applicant_end_date_month">Month/महीना:</label>
			<input type = "number" id = "applicant_end_date_month" name = "applicant_end_date_month" style="width: 50px;"> &nbsp;
			
			<label for="applicant_end_date_day">Day/दिन:</label>
			<input type = "number" id = "applicant_end_date_day" name = "applicant_end_date_day" style="width: 50px;"> &nbsp;
			
			<label for="applicant_end_date_year">Year/साल:</label>
			<input type = "number" id = "applicant_end_date_year" name = "applicant_end_date_year" style="width: 50px;"> &nbsp;


			<br><br><label for="applicant_end_time_hour">Hour/घंटा:</label>
			<input type = "number" id = "applicant_end_time_hour" name = "applicant_end_time_hour" style="width: 50px;"> &nbsp;
			
			<label for="applicant_end_time_minute">Minute/मिनट:</label>
			<input type = "number" id = "applicant_end_time_minute" name = "applicant_end_time_minute" style="width: 50px;"> &nbsp;
			
			<label for="applicant_start_time_second">Second/सेकंड:</label>
			<input type = "number" id = "applicant_end_time_second" name = "applicant_end_time_second" style="width: 50px;"> &nbsp;<br><br>

			Vehicle Number: <input type = "text" id = "vehicle_no" name ="vehicle_no"> </font><br> <br>

		
		<input type = "submit">
</form>

</div>
</body>
</html>