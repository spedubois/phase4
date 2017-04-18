<% /* JUST A TEST SQL TO SEE IF THE CONNECTION WAS BEING MADE*/ %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="p1.Connector" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Uotel Users</title>
</head>
<body>
<%

	class TestSQL 
	{
		Statement stmt;
	public TestSQL()
	{
		
	}
	public ArrayList<String> get(Statement stmt) throws Exception
	{
		String query;
		ArrayList<String> result = new ArrayList<String>();
		ResultSet results;
		query="Select login from Users";
		try{
			results = stmt.executeQuery(query);
        } catch(Exception e) {
			System.err.println("Unable to execute query:"+query+"\n");
	                System.err.println(e.getMessage());
			throw(e);
		}
		System.out.println("Order:getLogins query = "+query+"\n");
		while (results.next()){
			result.add(results.getString("login"));	
		}
		return result;
	}

} 
Connector conn = new Connector();
%>
	<p>CONNECTION MADE</p>
	<% TestSQL newSQL = new TestSQL(); %>
	<h1>Users</h1>
	<%for(String s:newSQL.get(conn.stmt)){out.println("<p>"+s+"</p>");}
	conn.closeConnection();%>
</body> 
<a href="ConnTest.jsp">Go Back</a>
</html>