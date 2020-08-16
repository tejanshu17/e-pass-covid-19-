<%@ language = "Vbscript"%>
<%option explicit%>
<html>
<body>
<% 
	dim Conn,rs,em,fname,lname,psw,flag
	flag = 0
	set Conn=Server.CreateObject("ADODB.Connection")
	Conn.Provider="Microsoft.Jet.OLEDB.4.0"
	Conn.Open "D:/add_data.mdb"
	fname=Request.Form("firstname")
	lname=Request.Form("lastname")
	Response.Cookies("firstname_signup")=fname
	Response.Cookies("firstname_signup").Expires=#Dec 10,2021#
	Response.Cookies("lastname_signup")=lname
	Response.Cookies("lastname_signup").Expires=#Dec 10,2021#
	em=Request.Form("email")
	psw=Request.Form("passw")
	Response.Cookies("email_signup")=em
	Response.Cookies("email_signup").Expires=#Dec 10,2021#
	set rs=Server.CreateObject("ADODB.RecordSet")
	rs.Open"table_add",Conn,0,3,2

	rs.MoveFirst
	
	do while not rs.EOF or flag=1
	If rs("email")=em then
		 flag = 1
		 Response.Redirect("signupunsuccessful.html")

	else
	rs.MoveNext
	end if
	loop
	
	If flag = 0 then
	
	rs.AddNew
	rs("firstname")=fname
	rs("lastname")=lname
	rs("email")=em
	rs("password")=psw
	rs.Update
	Response.Redirect("SignIn.html")
	End If
	Conn.close
	set Conn=Nothing
%>
</body>
</html>