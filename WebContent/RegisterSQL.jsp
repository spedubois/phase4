<% /* User registers as a new user. If the login is already taken, the user must go back and enter in new
user information. Else, the user may proceed to the main screen.*/ %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="p1.Connector" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered User</title>
</head>
<body>
<%
	class RegistrationSQL {
	public RegistrationSQL(){
		
	}
	public String get(Statement stmt,String login, String name, String password, String address, String phoneNum) throws Exception
	{
		String query;
		query="insert into Users (login, name, password, address, phone_number) Values ('" + 
		login + "', '" + name + "', '" + password + "', '" + address + "', '" + phoneNum + "');";
		try{
			int results = stmt.executeUpdate(query);
        } catch(Exception e) {
        	if(e.getMessage().contains("Duplicate entry"))
        	{
            	System.out.println("Dupe entry.");
            	return "fail";
        	}else
        	{
    			System.err.println("Unable to execute query:"+query+"\n");
    	                System.err.println(e.getMessage());
    			throw(e);
        	}
		}
		System.out.println("Order:newUserReg query = "+query+"\n");
		
		return "New User Registered.";
	}

}
%>
</body>
<%Connector conn = new Connector();
ResultSet rs = conn.stmt.executeQuery("SELECT login FROM Users WHERE login = '" + request.getParameter("login") + "%'");
	RegistrationSQL Reg = new RegistrationSQL();
	String res = Reg.get(conn.stmt, request.getParameter("login"), request.getParameter("name"), request.getParameter("password"),
			request.getParameter("address"), request.getParameter("phone"));
			if(res.equals("fail"))
			{
				out.println("That login is taken, please try another one.\n"+
						"<a href=\"ConnTest.jsp\">Go Back</a>");
			}
			else
			{
				session.setAttribute("login", request.getParameter("login"));
				out.println("You have been registered\n"+
				"<a href=\"MainScreen.jsp\">Continue</a>");
			}
			conn.closeConnection();
			%>

</html>