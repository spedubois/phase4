<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="p1.Connector" %>
    <%@page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<% 
Connector con = new Connector();
ResultSet rs = con.stmt.executeQuery("SELECT login,password FROM Users WHERE login = '" + request.getParameter("login") 
		            	 			+ "' and password = '" + request.getParameter("password") + "'");
ResultSetMetaData rsmd = rs.getMetaData();

if(!rs.isBeforeFirst())
{
	out.println("Your login or password was incorrect.\n"+
			"<a href=\"ConnTest.jsp\">Go Back</a>");
	con.closeConnection();
}
else
{
	out.println("Login successful.\n"+
			"<a href=\"MainScreen.jsp\">Continue</a>");
	con.closeConnection();
}
%>
</body>
</html>