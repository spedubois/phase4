<% /* Choose what house to favorite*/ %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main</title>
</head>
<h2>Favorite</h2>
<body>
	<form action="FavSQL.jsp">
		Enter the hid of the house you want to favorite:
		<input type = "text" name="hid"/>
		</br>
		<input type = "submit" value="Submit"/>
	</form>
</body>
</html>