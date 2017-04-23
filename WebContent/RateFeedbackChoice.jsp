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
<h2>Rate Feedback</h2>
<body>
	<form action="RateFeedbackSQL.jsp">
		Enter the feedback you would like to rate (by fid):
		<input type = "number" name="fid" min="1" value="fid"/>
		</br>
		Enter the rating (0-2):  
		<input type = "number" name="rating" min="0" max="2" value="rating"/>
		</br>
		<input type = "submit" value="Submit"/>
	</form>
</body>
</html>