<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register New User</title>
</head>
<body>
<h1>Register a new user</h1>
<form action="RegisterSQL.jsp">
	Enter you name:<input type="text" name="name"/><br>
	Enter a login:<input type="text" name="login"/><br>
	Enter your password:<input type="password" name="password"/><br>
	Enter you address:<input type="text" name="address"/><br>
	Enter your phone number:<input type="text" name="phone"/><br>
	Submit your information:<input type = "submit" value="Submit"/>
</form>
</body>
</html>