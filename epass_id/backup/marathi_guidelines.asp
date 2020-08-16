<%@language=Vbscript%>
<%option explicit%>
<html>
<meta charset="utf-8">
<head>
<title>मार्गदर्शक</title>
<link rel = "stylesheet" href = "style_guide.css">
</head>
<body>

<div class ="sign-in">
<img class = "oti" src="coronavirus.png">

<marquee speed="fast"> <b> <u> <h1> लॉकडाउन पास अर्ज करण्यासाठी अधिकृत सरकारी वेबसाइटवर आपले स्वागत आहे </b> </u> </h1> </marquee>

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
		 Response.Write("<h2>आपले स्वागत आहे "&rs("firstname")&" "&rs("lastname")&".")
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

<h1>कोविड -१ साठी मार्गदर्शक तत्त्वे</h1>

<h1>प्रत्येकाला पाहिजे</h1>

	<img src = "washhands.jpg"/>
	<h2>आपले हात धुआ</h2>
	<p>
	कमीतकमी 20 सेकंद साबणाने आणि पाण्याने आपले हात धुवा, विशेषत: सार्वजनिक ठिकाणी किंवा नाक फुंकल्यानंतर, खोकला किंवा शिंका येणे.
	जर साबण आणि पाणी सहज उपलब्ध नसेल तर कमीतकमी 60% अल्कोहोल असलेले हँड सॅनिटायझर वापरा.
	आपले डोळे, नाक आणि तोंड न धुतलेल्या हातांनी स्पर्श करणे टाळा.</p><br>	

	<img src = "avoidcontact.png"/>
	<h2>बंद संपर्क</h2>
	<p>
		आजारी असलेल्या लोकांशी जवळचा संपर्क टाळा. लक्षणे नसलेले काही लोक व्हायरसचा प्रसार करण्यास सक्षम होऊ शकतात.
	जास्तीत जास्त घरी रहा आणि अनावश्यक प्रवास टाळा.
	आपण सार्वजनिकरित्या बाहेर जायला हवे असल्यास किमान 6 फूट - दोन हात लांबी ठेवून सामाजिक अंतर करण्याचा सराव करा.
	व्हिडिओ आणि फोन कॉल, मजकूर आणि सोशल मीडियाद्वारे प्रियजनांशी संपर्कात रहा.
	</p><br>

	<img src = "covermouth.jpg"/>
	<h2>आपले खोकला आणि शिंका घाला </h2>
	<p>
	 आपले नाक आणि तोंड झाकण्यासाठी ऊती वापरा आणि वापरलेल्या उती एका रद्दी कचर्‍याच्या डब्यात फेकून द्या. जर ऊतक उपलब्ध नसेल तर आपल्या कोपरात खोकला किंवा शिंक घ्या - आपल्या हातांना नाही. आपले हात त्वरित धुवा.
	</p><br>

	<img src = "disinfecting.jpg"/>
	<h2>दररोज वारंवार स्पर्श केलेल्या पृष्ठभागावर स्वच्छ आणि निर्जंतुकीकरण करा.</h2>
	<p>
	यामध्ये सारण्या, डोरकनब, लाइट स्विचेस, काउंटरटॉप, हँडल्स, डेस्क, फोन, कीबोर्ड, शौचालय, नल आणि सिंकचा समावेश आहे
	</p><br>


<button onclick="location.href ='application_form.asp';">नवीन ई-पाससाठी अर्ज करा</button><br><br>
<h2><font color="#FF6347">आधीच ई-पास आहे? <a href="check_id_status.html">स्थिती तपासा</a></font></h2><br>
<p><span></p>
<hr>
</form>
</div>
</body>
</html>