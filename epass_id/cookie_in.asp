<%@ language=Vbscript%>
<%
	dim rs,em,sql,Conn,pss
	set Conn=Server.CreateObject("ADODB.Connection")
	Conn.Provider="Microsoft.Jet.OLEDB.4.0"
	Conn.Open"D:\add_data.mdb"
	set rs=Server.CreateObject("ADODB.Recordset")
	em=Request.form("email")
	ps=Request.form("passw")
	Response.Cookies("email")=em
	'Response.Write("Email from cookie:"&Request.Cookies("email"))
	sql="select email,password from table_add where email='"&em&"' AND password='"&ps&"'"
	rs.Open sql,Conn

	if rs.EOF=True then
		Response.Redirect("loginunsuccessful.html")

	else
		Response.Redirect("sel_language.asp")
	end if 
	rs.close
	conn.close
%>

