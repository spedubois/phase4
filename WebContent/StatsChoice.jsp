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
	<form action="StatsSQL.jsp">
		<input type = "radio" name="stats" value="popular"/>
		Most popular houses
		</br>
		<input type = "radio" name="stats" value="expensive"/>
		Most expensive houses
		</br>
		<input type = "radio" name="stats" value="rating"/>
		Highly rated houses
		</br>
		Enter the result limit: 
		<input type = "number" name="limit" min="1" value="Highly rated houses" placeholder="1"/>
		</br>
		<input type = "submit" value="Get Statistics"/>
	</form>
</body>
</html>