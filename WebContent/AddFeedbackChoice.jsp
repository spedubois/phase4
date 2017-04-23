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
<h2>Add Feedback</h2>
<body>
	<form action="AddFeedbackSQL.jsp">
		Enter the house you would like to leave feedback for (by hid):
		<input type = "number" name="hid" min="1" value="hid"/>
		</br>
		Enter the feedback score (0-10):  
		<input type = "number" name="score" min="0" max="10" value="score"/>
		</br>
		Enter any feedback you would like to leave:
		<input type = "text" name="feedback"/>
		</br>
		<input type = "submit" value="Submit"/>
	</form>
</body>
</html>