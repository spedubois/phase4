<%/*This is where the user should start. Has options to login as an exisitin user, register as a new user,
or view a list of all registered users*/%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="p1.Connector" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Uotel</title>
</head>
<body>
	<h1>Welcome to the Uotel system</h1>
	<form action="NewUser.jsp">
		<input type = "submit" value="Register new user"/>
	</form>
	<form action="ExistingUser.jsp">
		<input type = "submit" value="Login existing user"/>
	</form>

</body>
</html>