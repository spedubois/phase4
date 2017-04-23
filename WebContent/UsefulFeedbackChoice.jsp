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
<h2>Statistics</h2>
<body>
	<form action="UsefulFeedbackSQL.jsp">
		Enter the hid you want the most useful feedback for: 
		<input type = "number" name="hid" min="1" value="hid"/>
		</br>
		Enter the number of feedbacks you would like:  
		<input type = "number" name="num" min="1" value="num"/>
		</br>
		<input type = "submit" value="Get Statistics"/>
	</form>
</body>
</html>