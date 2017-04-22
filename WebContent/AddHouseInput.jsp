<% /* Used to pass information along to a query that will ad a user to the Users table in the DB.*/ %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register New User</title>
</head>
<body>
<h1>Add a new house</h1>
<form action="AddHouseSQL.jsp">
	Enter the house's category:<input type="text" name="category"/><br>
	Enter the house's url:<input type="text" name="url"/><br>
	Enter the house's phone number:<input type="text" name="phone"/><br>
	Enter the year built:<input type="text" name="year"/><br>
	Enter the house's city:<input type="text" name="city"/><br>
	Enter the house's state:<input type="text" name="state"/><br>
	Enter the house's address:<input type="text" name="address"/><br>
	Submit your information:<input type = "submit" value="Submit"/>
</form>
</body>
</html>