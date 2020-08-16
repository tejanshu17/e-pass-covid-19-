<%@language=Vbscript%>
<%option explicit%>
<html>
<meta charset="utf-8">
<head>
<title>Guidelines for Covid-19</title>
<link rel = "stylesheet" href = "style_guide.css">
</head>
<body>

<div class ="sign-in">
<img class="oti" src="coronavirus.png"/>

<marquee speed="fast"> <b> <u> <h1> WELCOME TO The Official Government Website For Applying A Lockdown Pass </b> </u> </h1> </marquee><br>
<% dim email, con, rs, flag
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
		 Response.Write("<h2>Welcome "&rs("firstname")&" "&rs("lastname")&".")
		rs.MoveNext
	else
	rs.MoveNext
	end if
	loop
	

	If flag = 0 then
		Response.Write("<h1>Email is not recognized</h1>")
	End If

	con.close
	set con = Nothing
%>
<h1>Guidelines for Covid-19</h1>

<h1>Everyone Should </h1><br>

	<img src = "washhands.jpg"/>
	<h2> WASH HANDS </h2>
	<p>
	Wash your hands often with soap and water for at least 20 seconds, especially after being in a public place, or after blowing your nose, coughing or sneezing.
If soap and water are not readily available, use a hand sanitizer with at least 60% alcohol.
Avoid touching your eyes, nose and mouth with unwashed hands.
	</p><br>

	

	<img src = "avoidcontact.png"/>
	<h2> AVOID CLOSE CONTACT </h2>
	<p>
		Avoid close contact with people who are sick. Some people without symptoms may be able to spread the virus.
Stay home as much as possible and avoid non-essential travel.
Practice social distancing by keeping at least 6 feet &#8208; about two arm lengths &#8208; away from others if you must go out in public.
Stay connected with loved ones through video and phone calls, texts and social media.
	</p><br>

	<img src = "covermouth.jpg"/>
	<h2> Cover your coughs and sneezes </h2>
	<p>
	 Use a tissue to cover your nose and mouth, and throw used tissues in a lined trash can. If a tissue isn&apos;t available, cough or sneeze into your elbow &#8208; not your hands. Wash your hands immediately.
	</p><br>

	<img src = "disinfecting.jpg"/>
	<h2> Clean and disinfect frequently touched surfaces daily. </h2>
	<p>
	This includes tables, doorknobs, light switches, countertops, handles, desks, phones, keyboards, toilets, faucets and sinks.
	</p><br>



<button onclick="location.href ='application_form.asp';">Apply for a New E-Pass</button><br><br>

<h2><font color="#FF6347">Already have an E-Pass? <a href="check_id_status.html">Check Status</a></font></h2><br>
<p><span></p>
<hr>
</div>
</body>
</html>