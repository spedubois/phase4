<% /* This will be the screen where the user will be able to do everything such as reserving a TH 
and adding a new house.*/ %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main</title>
</head>
<h2>Trust</h2>
<body>
	<form action="TrustSQL.jsp">
		Enter the login of the person you want to trust or not trust:
		<input type = "text" name="login2"/>
		</br>
		<input type = "radio" name="trust" value="1"/>
		Trust
		</br>
		<input type = "radio" name="trust" value="0"/>
		Distrust
		</br>
		<input type = "submit" value="Submit"/>
	</form>
</body>
</html>