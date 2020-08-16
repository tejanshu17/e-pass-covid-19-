<%@language=Vbscript%>
<%option explicit%>
<html>
<meta charset="utf-8">
<head>
<title>दिशानिर्देश</title>
<link rel = "stylesheet" href = "style_guide.css">
</head>
<body>

<div class ="sign-in">
<img class = "oti" src="coronavirus.png">

<marquee speed="fast"> <b> <u> <h1> एक लॉकडाउन पास को लागू करने के लिए आधिकारिक सरकार की वेबसाइट पर आपका स्वागत है </b> </u> </h1> </marquee>

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
		 Response.Write("<h2>आपका स्वागत है "&rs("firstname")&" "&rs("lastname")&".")
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

<h1>कोविद -19 के लिए दिशानिर्देश</h1>

<h1>हर किसी को करना चाहिए</h1>

	<img src = "washhands.jpg"/>
	<h2>अपने हाथ धोएं</h2>
	<p>
	कम से कम 20 सेकंड के लिए अपने हाथों को अक्सर साबुन और पानी से धोएं, विशेष रूप से सार्वजनिक स्थान पर रहने के बाद, या अपनी नाक बहने के बाद, खांसने या छींकने से।
	यदि साबुन और पानी आसानी से उपलब्ध नहीं हैं, तो कम से कम 60% अल्कोहल के साथ एक हाथ प्रक्षालक का उपयोग करें।
	अपनी आँखों, नाक और मुँह को अनचाहे हाथों से छूने से बचें।</p><br>	

	<img src = "avoidcontact.png"/>
	<h2>निकट संपर्क से बचें</h2>
	<p>
		जो लोग बीमार हैं उनसे निकट संपर्क से बचें। बिना लक्षणों के कुछ लोग वायरस फैलाने में सक्षम हो सकते हैं।
	जितना हो सके घर पर रहें और गैर जरूरी यात्रा से बचें।
	कम से कम 6 फीट - लगभग दो हाथ की लंबाई रखकर सामाजिक दूरी का अभ्यास करें - यदि आप सार्वजनिक रूप से बाहर जाना चाहते हैं तो दूसरों से दूर रहें।
	वीडियो और फोन कॉल, ग्रंथों और सोशल मीडिया के माध्यम से प्रियजनों के साथ जुड़े रहें।
	</p><br>

	<img src = "covermouth.jpg"/>
	<h2>अपनी खांसी और छींक को कवर करें</h2>
	<p>
	 अपनी नाक और मुंह को ढंकने के लिए एक ऊतक का उपयोग करें, और उपयोग किए गए ऊतकों को एक कूड़ेदान में फेंक सकते हैं। यदि कोई ऊतक उपलब्ध नहीं है, तो आपकी कोहनी में खाँसी या छींक आती है - आपके हाथों से नहीं। अपने हाथ तुरंत धो लें।
	</p><br>

	<img src = "disinfecting.jpg"/>
	<h2>स्वच्छ और कीटाणुरहित छुआने वाली सतहों को रोजाना।</h2>
	<p>
	इसमें टेबल, डॉर्कबॉब्स, लाइट स्विच, काउंटरटॉप्स, हैंडल, डेस्क, फोन, कीबोर्ड, शौचालय, सिंक और सिंक शामिल हैं।
	</p><br>


<button onclick="location.href ='application_form.asp';">नए ई-पास के लिए आवेदन करें</button><br><br>
<h2><font color="#FF6347">पहले से ही एक ई-पास है? <a href="check_id_status.html">अवस्था जांच</a></font></h2><br>
<p><span></p>
<hr>
</form>
</div>
</body>
</html>